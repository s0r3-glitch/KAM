#include "script_component.hpp"
/*
 * Author: Katalam
 * Treatment for a pulmo injury
 * Main function
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 * 3: Treatment <STRING>
 * 4: Item User (not used) <OBJECT>
 * 5: Used Item <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject, "Body", "ChestSeal", objNull, "kat_chestSeal"] call kat_breathing_fnc_treatmentAdvanced_chestSeal;
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodyPart", "_classname", "", "_usedItem"];

[_patient, _usedItem] call ACEFUNC(medical_treatment,addToTriageCard);
[_patient, "activity", ELSTRING(pharma,Activity_usedItem), [[_medic] call ACEFUNC(common,getName), getText (configFile >> "CfgWeapons" >> _usedItem >> "displayName")]] call ACEFUNC(medical_treatment,addToLog);

[QGVAR(chestSealLocal), [_medic, _patient], _patient] call CBA_fnc_targetEvent;
