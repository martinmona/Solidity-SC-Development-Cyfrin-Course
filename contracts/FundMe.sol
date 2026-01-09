// SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

import {PriceConverter} from "./PriceConverter.sol";
import "./MathLibrary.sol";

contract FundMe {
    using MathLibrary for uint256;
    using PriceConverter for uint256;
    uint256 public minimumUsd = 5e18;
    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;
    
    function found() public payable {
        require(msg.value.getConversionRate() > minimumUsd, "didn't send enough ETH");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value.sum(addressToAmountFunded[msg.sender]);
    }

    function widthraw() public {}
}