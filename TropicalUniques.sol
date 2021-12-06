// SPDX-License-Identifier: MIT

/*------------------------------------------------------------------------------------------
████████████████████████████████████████████████████████████████████████████████████████████
█─▄─▄─█▄─▄▄▀█─▄▄─█▄─▄▄─█▄─▄█─▄▄▄─██▀▄─██▄─▄█████▄─▄▄─█▄─▄█▄─▀█▄─▄██▀▄─██▄─▀█▄─▄█─▄▄▄─█▄─▄▄─█
███─████─▄─▄█─██─██─▄▄▄██─██─███▀██─▀─███─██▀████─▄████─███─█▄▀─███─▀─███─█▄▀─██─███▀██─▄█▀█
▀▀▄▄▄▀▀▄▄▀▄▄▀▄▄▄▄▀▄▄▄▀▀▀▄▄▄▀▄▄▄▄▄▀▄▄▀▄▄▀▄▄▄▄▄▀▀▀▄▄▄▀▀▀▄▄▄▀▄▄▄▀▀▄▄▀▄▄▀▄▄▀▄▄▄▀▀▄▄▀▄▄▄▄▄▀▄▄▄▄▄▀
-------------------------------------------------------------------------------------------*/

pragma solidity 0.6.12;

import "./libs/ITropicalUniques.sol";
import "./libs/Operable.sol";
import "./libs/TimeLock.sol";

// Tropical Unique Addresses, to be excluded from: antiBot, antiWhale, Bonuses and features.
contract TropicalUniques is ITropicalUniques, Operable, TimeLock {
    
    mapping (address => bool) uniqueAddress;

    constructor() public {
        setUniqueAddress(address(0), true);
    }

    function setUniqueAddress(address _address, bool _isUnique) public override onlyOperator timeLock {
        uniqueAddress[_address] = _isUnique;
    }

    function isUniqueAddress(address _address) public override view returns(bool) {
        return uniqueAddress[_address] == true;
    }

}
