// // SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

abstract contract Animal {
    string private name;
    constructor(string memory _name) {
        name = _name;
    }

    function getName() public view returns (string memory) {
        return name;
    }

    function emitSound() public virtual view returns (string memory);
}