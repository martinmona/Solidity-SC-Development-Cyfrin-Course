// // SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

import { Animal } from "./Animal.sol";

contract Bird is Animal {
    constructor(string memory _name) Animal(_name) {
    }

    function emitSound() public virtual view override returns (string memory) {
        return "Chirp!";
    }
}