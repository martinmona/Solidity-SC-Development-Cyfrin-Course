// // SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

contract Cow {
    string private name;
    constructor(string memory _name) {
        name = _name;
    }

    function getName() public view returns (string memory) {
        return name;
    }
}