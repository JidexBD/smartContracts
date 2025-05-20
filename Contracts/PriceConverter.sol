// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

//copy aggreator import here 
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter{
      //function to get the price of ether from chainlink interface 
    function getprice () internal view returns (uint256) {

        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 answer,,,)= priceFeed.latestRoundData();
        return uint256(answer) * 1e18;
    }

    function getConversionRate (uint256 ethAmount) internal view returns (uint256){
        uint256 ethPrice = getprice();
        uint256 ethAmountInUsd = (ethAmount * ethPrice) / 1e18;
        return ethAmountInUsd;
    }

     //function to get version of price feed 
    function getVersion () internal  view returns (uint256) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

}