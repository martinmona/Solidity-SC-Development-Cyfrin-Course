// // SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

import { Animal } from "./Animal.sol";

contract Cow is Animal {
    constructor(string memory _name) Animal(_name) {
    }

    function emitSound() public virtual view override returns (string memory) {
        return "Muuu";
    }
}