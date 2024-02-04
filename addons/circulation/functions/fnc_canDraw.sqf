#include "..\script_component.hpp"
/*
 * Author: Battlekeeper, modified by YetheSamartaka & Slatery
 * Condition function for the blood drawing
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Volume of Blood to remove (in milliliters) <NUMBER>
 *
 * Return Value:
 * <BOOLEAN>
 *
 * Example:
 * [medic, medic, 500] call kat_circulation_fnc_canDraw;
 *
 * Public: No
 */

params ["_medic", "_patient", "_volume"];

private _bagItem = format ["ACE_bloodIV_%1", _volume];
private _bloodVolume = (_patient getVariable [QACEGVAR(medical,bloodVolume), 6.0]);
private _volumeChange = _volume/1000;
private _canAddItem = ((_medic canAddItemToUniform _bagItem) || (_medic canAddItemToVest _bagItem) || (_medic canAddItemToBackpack _bagItem)); // make sure the blood can actually be added to the medic, so you don't just lose blood
//hint str maxLoad _medic;
hint str loadBackpack _medic;
if (_medic canAddItemToUniform _bagItem) then {
	systemChat "Can add to uniform";

} else
{
	systemChat "Can't add to uniform";
};
if (_medic canAddItemToVest _bagItem) then {
	systemChat "Can add to vest";

} else
{
	systemChat "Can't add to vest";
};
if (_medic canAddItemToBackpack _bagItem) then {
	systemChat "Can add to backpack";

} else
{
	systemChat "Can't add to backpack";
};

if (_medic canAddItemToUniform[_bagItem, 1, true]) then {
	systemChat "Can add to uniform no limit";
} else
{
	systemChat "Can't add to uniform no limit";
};
if (_medic canAddItemToVest [_bagItem, 1, true]) then {
	systemChat "Can add to vest no limit";
} else
{
	systemChat "Can't add to vest no limit";
};
if (_medic canAddItemToBackpack [_bagItem, 1, true]) then {
	systemChat "Can add to backpack no limit";
} else
{
	systemChat "Can't add to backpack no limit";
};
/*
systemChat toString[_canAddItem];
systemChat toString[_bloodVolume];
systemChat toString[_volumeChange];
systemChat toString[_medic canAddItemToUniform [_bagItem, 1, true]];
systemChat toString[_medic canAddItemToVest [_bagItem, 1, true]];
systemChat toString[_medic canAddItemToBackpack [_bagItem, 1, true]];
*/
if (((_bloodVolume - _volumeChange) > GVAR(blood_draw_limit)) && _canAddItem) exitWith {true};
false
