#include "\x\alive\addons\mil_intelligence\script_component.hpp"
SCRIPT(G2);

/* ----------------------------------------------------------------------------
Function: ALIVE_fnc_G2
Description:

Parameters:
Nil or Object - If Nil, return a new instance. If Object, reference an existing instance.
String - The selected function
Array - The selected parameters

Returns:
Any - The new instance or the result of the selected function and parameters

Examples:

See Also:

Author:
SpyderBlack723
---------------------------------------------------------------------------- */

#define SUPERCLASS  ALiVE_fnc_baseClass
#define MAINCLASS   ALiVE_fnc_G2
#define MTEMPLATE   "ALiVE_G2_%1"

private "_result";

params [
    ["_logic", objNull, [objNull]],
    ["_operation", "", [""]],
    "_args"
];

// https://docs.google.com/document/d/10fISYf_yAGgBsMOAPpzvOnSIBfteXFBsOG13JqIujcM/edit#heading=h.ik70z9iq923x

switch(_operation) do {

    case "init": {
        if (isServer) then {
            _logic setvariable ["super", QUOTE(SUPERCLASS)];
            _logic setvariable ["class", QUOTE(MAINCLASS)];
            _logic setvariable ["moduleType", "ALiVE_G2"];
            _logic setvariable ["startupComplete", false];

            _logic setvariable ["perFrameID", -1];
            _logic setvariable ["timeBetweenConfidenceDecay", 15];

            [_logic,"setIntelDisplayStrategy", "map"] call MAINCLASS;

            _logic setvariable ["nextIntelIDNum", 0];
            _logic setvariable ["maxIntelLifetime", 10 * 60];

            private _intel = createHashMapFromArray [
                ["spotrep", createHashMap]
            ];

            _logic setvariable ["intel", _intel];

            [_logic,"start"] call MAINCLASS;
        };
    };

    case "start": {
        private _timeBetweenConfidenceDecay = _logic getvariable "timeBetweenConfidenceDecay";

        private _perFrameID = [{
            private _logic = _this select 0;
            [_logic,"onFrame"] call ALiVE_fnc_G2;
        }, _timeBetweenConfidenceDecay, _logic] call CBA_fnc_addPerFrameHandler;

        _logic setvariable ["perFrameID", _perFrameID];

        _logic setvariable ["startupComplete", true];
    };

    case "getNextIntelID": {
        private nextIntelNum = _logic getvariable "nextIntelIDNum";
        _logic setvariable ["nextIntelIDNum", nextIntelNum + 1];

        _result = format ["intel_%1", nextIntelNum];
    };

    case "getIntelDisplayStrategies": {
        _result = ["Map"];
    };

    case "setIntelDisplayStrategy": {
        private _strategy = _args;

        switch (tolower _strategy) do {
            case "map": {
                _logic setvariable ["intelDisplayStrategies", createHashMapFromArray [
                    ["onCreate", "onCreateMAP"],
                    ["onDecay", "onDecayMAP"],
                    ["onRemove", "onRemoveMAP"]
                ]];
            };
        };
    };

    case "createSpotrep": {
        _args params ["_side","_faction","_groupType","_groupCount","_groupSpeed","_groupDirection","_timeSinceSeen"];

        private _maxIntelLifetime = _logic getvariable "maxIntelLifetime";

        private _reportConfidence = 1 - ((_timeSinceSeen * 60) / _maxIntelLifetime);

        // what the fuck are you even doing?
        if (_reportConfidence <= 0) exitwith {};

        private _spotrep = createHashMapFromArray [
            ["type", "spotrep"],
            ["side", _side],
            ["faction", _faction],
            ["groupType", _groupType],
            ["groupCount", _groupCount],
            ["speed", _groupSpeed],
            ["direction", _groupDirection],
            ["timeSinceSeen", _timeSinceSeen],
            ["confidence", _reportConfidence]
        ];

        [_logic,"storeIntelReport", _spotrep] call MAINCLASS;
    };

    case "storeIntelReport": {
        private _report = _args;

        private _reportType = _report get "type";
        private _reportID = [_logic,"getNextIntelID"] call MAINCLASS;

        _report set ["id", _reportID];

        private _intel = _logic getvariable "intel";
        private _reportsOfType = _intel get _reportType;

        _reports set [_reportID, _report];

        private _intelDisplayStrategies = _logic getvariable "intelDisplayStrategies";
        private _intelOnRemoveDisplayStrategy = _intelDisplayStrategies get "onCreate";
        [_logic,_intelOnRemoveDisplayStrategy, _report] call MAINCLASS;
    };

    case "removeIntelReports": {
        private _reports = _args;

        private _intel = _logic getvariable "intel";
        private _intelDisplayStrategies = _logic getvariable "intelDisplayStrategies";
        private _intelOnRemoveDisplayStrategy = _intelDisplayStrategies get "onRemove";

        {
            private _reportType = _x get "type";
            private _reportID = _x get "id";

            [_logic,_intelOnRemoveDisplayStrategy, _report] call MAINCLASS;

            private _reportsOfType = _intel get _reportType;
            _reportsOfType deleteat _reportID;
        } foreach _reports;
    };

    case "onFrame": {
        private _intel = _logic getvariable "intel";
        private _maxIntelLifetime = _logic getvariable "maxIntelLifetime";
        private _timeBetweenConfidenceDecay = _logic getvariable "timeBetweenConfidenceDecay";
        private _confidenceDecay = _timeBetweenConfidenceDecay / _maxIntelLifetime;

        private _intelDisplayStrategies = _logic getvariable "intelDisplayStrategies";
        private _intelOnRemoveDisplayStrategy = _intelDisplayStrategies get "onDecay";

        private _reportsToRemove = _intel select {
            private _confidence = _y get "confidence";
            private _newConfidence = _confidence - _confidenceDecay;

            _y set ["confidence", _newConfidence];

            [_logic,_intelOnRemoveDisplayStrategy, _report] call MAINCLASS;

            _newConfidence <= 0
        };

        [_logic,"removeIntelReports", _reportsToRemove] call MAINCLASS;
    };

    case "debug": {
        if (!isnil "_args") then {
            _logic setvariable [_operation, _args];
        } else {
            _result = _logic getvariable _operation;
        };
    };

    case "destroy": {
        [_logic,"debug", false] call MAINCLASS;

        if (isServer) then {
            _logic setVariable ["super", nil];
            _logic setVariable ["class", nil];

            [_logic,"destroy"] call SUPERCLASS;
        };
    };

    // map display strategies
        case "onCreateMAP": {
            private _report = _args;
            
            private _reportType = _report get "type";
            switch (_reportType) do {
                case "spotrep": {
                    private _groupSide = _report get "side";
                    private _groupFaction = _report get "faction";
                    private _groupType = _report get "type";
                    private _groupCount = _report get "count";
                    private _speed = _report get "speed";
                    private _direction = _report get "direction";
                };
            };
        };
        case "onDecayMAP": {
            private _report = _args;
            private _reportMarkers = _report get "markers";
            private _reportConfidence = _report get "confidence";

            {
                _x setMarkerAlpha _reportConfidence;
            } foreach _reportMarkers;
        };
        case "onRemoveMAP": {

        };
    //

    default {
        _result = [_logic, _operation, _args] call SUPERCLASS;
    };
};

if (!isnil "_result") then { _result } else { nil };