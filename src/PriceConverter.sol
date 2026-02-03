// SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    function getPrice(
        AggregatorV3Interface dataFeed
    ) internal view returns (uint256) {
        (, int256 ethPrice, , , ) = dataFeed.latestRoundData();
        if (ethPrice < 0) {
            revert("Negative price returned from price feed");
        }
        // casting to 'uint256' is safe because ethPrice from Chainlink is already uint256
        // forge-lint: disable-next-line(unsafe-typecast)
        return uint256(ethPrice) * 1e10;
    }

    function getConversionRate(
        uint256 amount,
        AggregatorV3Interface dataFeed
    ) internal view returns (uint256) {
        uint256 ethPrice = getPrice(dataFeed);
        uint256 ethAmountInUsd = (ethPrice * amount) / 1e18;
        return ethAmountInUsd;
    }
}
