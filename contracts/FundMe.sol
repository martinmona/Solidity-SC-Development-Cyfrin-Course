// SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    AggregatorV3Interface internal dataFeed;
    uint256 public minimumUsd = 5e18;
    uint256 public balance = 0;

    constructor() {
        dataFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    }
    
    function found() public payable {
        require(getConversionRate(msg.value) > minimumUsd, "didn't send enough ETH");
        balance += msg.value;
    }

    function widthraw() public {}

    function getPrice() public view returns (uint256) {
        (,int256 ethPrice,,,) = dataFeed.latestRoundData();
        return uint256(ethPrice * 1e10);
    }

    function getConversionRate(uint256 amount) public view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * amount) / 1e18;
        return ethAmountInUsd;
    }
}