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

    function widthrawAll() public {
        for(uint256 i = 0; i < funders.length; i++) {
            address funder = funders[i];
            addressToAmountFunded[funder] = 0;
        }
        funders = new address[](0);
        
        // Using transfer
        //payable(msg.sender).transfer(address(this).balance);
        
        // Using send
        // bool success = payable(msg.sender).send(address(this).balance);
        // require(success, "Send failed");

        // Using call
        (bool success,) = payable(msg.sender).call{value: address(this).balance}("");
        require(success, "call failed");

    }
}