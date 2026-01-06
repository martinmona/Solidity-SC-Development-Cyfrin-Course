// SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

contract FundMe {
    function found() public payable {
        require(msg.value > 1e18, "didn't send enough ETH");
    }

    function widthraw() public {}
}