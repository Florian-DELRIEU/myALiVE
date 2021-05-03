#include "\x\alive\addons\x_lib\script_component.hpp"
SCRIPT(eventLog);

/* ----------------------------------------------------------------------------
Function: MAINCLASS
Description:
Event log

Parameters:
Nil or Object - If Nil, return a new instance. If Object, reference an existing instance.
String - The selected function
Array - The selected parameters

Returns:
Any - The new instance or the result of the selected function and parameters

Attributes:
Boolean - debug - Debug enable, disable or refresh
Boolean - state - Store or restore state of analysis

Examples:
(begin example)
// create the command router
_logic = [nil, "create"] call ALIVE_fnc_eventLog;

(end)

See Also:

Author:
ARJay

Peer reviewed:
nil
---------------------------------------------------------------------------- */

#define SUPERCLASS  ALIVE_fnc_baseClass
#define MAINCLASS   ALIVE_fnc_eventLog

#define MTEMPLATE   "ALiVE_EVENT_%1"

TRACE_1("event log - input",_this);

params ["_logic","_operation","_args"];

private _result = true;

switch(_operation) do {
    case "init": {
        if (isServer) then {
            _logic setvariable ["super", QUOTE(SUPERCLASS)];
            _logic setvariable ["class", QUOTE(MAINCLASS)];
            TRACE_1("After listener init", _logic);

            _logic setvariable ["debug", false];
            _logic setvariable ["listenerCount", 0];
            _logic setvariable ["eventCount", 0];
            _logic setvariable ["firstEvent", 0];
            _logic setvariable ["maxEvents", 5];
            _logic setvariable ["events", createHashMap];
            _logic setvariable ["eventsByType", createHashMap];
            _logic setvariable ["listeners", createHashMap];
            _logic setvariable ["listenersByFilter", createHashMap];
        };
    };

    case "destroy": {
        [_logic,"debug", false] call MAINCLASS;

        if (isServer) then {
            _logic setvariable ["super", nil];
            _logic setvariable ["class", nil];

            [_logic,"destroy"] call SUPERCLASS;
        };
    };

    case "debug": {
        if(!isnil "_args") then {
            _result = _logic getvariable "debug";
        } else {
            _logic setvariable ["debug", _args];
        };
    };

    case "addListener": {
        _args params ["_listener","_filters"];

        private _debug = _logic getvariable "debug";
        private _listeners = _logic getvariable "listeners";
        private _filteredListeners = _logic getvariable "listenersByFilter";

        private _listenerID = _logic getvariable "getNextListenerInsertID";

        // store the listener in a hash by filter type

        {
            private _filter = _x;

            if !(_filter in _filteredListeners) then {
                _filteredListeners set [_filter, createHashMapFromArray [
                    [_listenerID, _args]
                ]];
            }else{
                private _typeFilters = _filteredListeners get _filter;
                _filters set [_listenerID, _args];
            };
        } forEach _filters;

        // store the listener in the main hash

        _listeners set [_listenerID, _args];

        if(_debug) then {
            //_listeners call ALIVE_fnc_inspectHash;
            //_filteredListeners call ALIVE_fnc_inspectHash;
        };

        _result = _listenerID;
    };

    case "removeListener": {
        private _listenerID = _args;
        private _listeners = _logic getvariable "listeners";
        private _filteredListeners = _logic getvariable "listenersByFilter";

        private _listener = _listeners get _listenerID;
        private _filters = _listener select 1;

        // remove the event from the hash by type

        {
            (_filteredListeners get _x) deleteat _listenerID;
        } forEach _filters;

        // remove the event from the main hash

        _listeners setvariable [_listenerID, nil];
    };

    case "getListeners": {
        _result = _logic getvariable "listeners";
    };

    case "clearListeners": {
        [_logic,"listeners", createHashMap] call ALIVE_fnc_hashSet;
        [_logic,"listenersByFilter", createHashMap] call ALIVE_fnc_hashSet;
    };

    case "getListenersByFilter": {
        private _filter = _args;
        private _filteredListeners = _logic getvariable "listenersByFilter";

        _result = _filteredListeners get _filter;
    };

    case "maxEvents": {
        if (!isnil "_args") then {
            _logic setvariable ["maxEvents", _args];
        } else {
            _logic getvariable "maxEvents";
        };
    };

    case "addEvent": {
        private _event = _args;

        private _debug = _logic getvariable "debug";
        private _events = _logic getvariable "events";
        private _eventsByType = _logic getvariable "eventsByType";
        private _maxEvents = _logic getvariable "maxEvents";

        private _eventID = [_logic,"getNextEventInsertID"] call MAINCLASS;

        [_event,"id", _eventID] call ALIVE_fnc_hashSet;

        private _type = [_event,"type"] call ALIVE_fnc_hashGet;

        // store the event in a hash by type

        if !(_type in _eventsByType) then {
            [_eventsByType,_type, createHashMapFromArray [
                [_eventID, _event]
            ]] call ALIVE_fnc_hashSet;
        } else {
            private _eventTypes = _eventsByType get _type;
            _eventTypes set [_eventID, _event];
        };

        // remove first event if over the max limit

        if (count _events > _maxEvents) then {
            private _firstEvent = _logic getvariable "firstEvent";
            [_logic,"removeEvent", format ["event_%1",_firstEvent]] call MAINCLASS;
            _firstEvent = _firstEvent + 1;
            _logic setvariable ["firstEvent", _firstEvent];
        };

        // store the event in the main hash

        _events set [_eventID, _event];

        if (_debug) then {
            _event call ALIVE_fnc_inspectHash;
            //_events call ALIVE_fnc_inspectHash;
            //_eventsByType call ALIVE_fnc_inspectHash;
        };

        // spawn the event dispatch

        private _filteredListeners = _logic getvariable "listenersByFilter";
        private _typeListeners = _filteredListeners get _type;
        private _globalListeners = _filteredListeners get "ALL";

        private _listeners = [];

        if (!isnil "_typeListeners") then {
            {
                private _class = if(_x isEqualType objNull) then {
                    _listeners pushback [_x, _x getVariable "class"];
                } else {
                    _listeners pushback [_x, [_x,"class"] call ALIVE_fnc_hashGet;];
                };
            } foreach _typeListeners;
        };

        if (!isnil "_typeListeners") then {
            {
                private _class = if(_x isEqualType objNull) then {
                    _listeners pushback [_x, _x getVariable "class"];
                } else {
                    _listeners pushback [_x, [_x,"class"] call ALIVE_fnc_hashGet;];
                };
            } foreach _globalListeners;
        };

        [_event, _listeners] spawn {
            params ["_event","_listeners"];

            {
                _x params ["_listener","_class"];

                if (_class isEqualType "") then {
                    _class = missionnamespace getvariable _class;
                };

                [_listener,"handleEvent", _event] call _class;
            } foreach _listeners;
        };

        _result = _eventID;
    };

    case "removeEvent": {
        private _eventID = _args;

        private _events = _logic getvariable "events";
        private _event = [_events,_eventID] call ALIVE_fnc_hashGet;
        if (isnil "_event") exitwith {};

        private _type = [_event,"type"] call ALIVE_fnc_hashGet;

        private _eventsByType = _logic getvariable "eventsByType";
        private _eventsForType = _eventsByType get _type;
        if (!isnil "_eventsForType") then {
            _eventsForType deleteat _eventID;
        };
        
        _events setvariable [_eventID, nil];
    };

    case "getEventsByType": {
        private _type = _args;
        private _eventsByType = _logic getvariable "eventsByType";

        _result = [_eventsByType,_type] call ALIVE_fnc_hashGet;
    };

    case "getEvents": {
        _result = _logic getvariable "events";
    };

    case "clearEvents": {
        _logic setvariable ["events", createHashMap];
        _logic setvariable ["eventsByType", createHashMap];
    };

    case "getNextListenerInsertID": {
        private _listenerCount = _logic getvariable "listenerCount";
        _result = format ["listener_%1", _listenerCount];

        _listenerCount = _listenerCount + 1;
        _logic setvariable ["listenerCount", _listenerCount];
    };

    case "getNextEventInsertID": {
        private _eventCount = _logic getvariable "eventCount";
        _result = format ["event_%1", _eventCount];

        _eventCount = _eventCount + 1;
        _logic setvariable ["eventCount", _eventCount];
    };
    
    default {
        _result = [_logic, _operation, _args] call SUPERCLASS;
    };
};

TRACE_1("event log - output",_result);

_result