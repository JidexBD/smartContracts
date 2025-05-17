// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {
     //minimum usd we want our senders to send 
    uint256 public minimumUSD = 5e18;

    //array of users that sent us eth or funded us
    address [] public funders;

    //mapping point an address to the amount funded.so we can know who sent what amount
    mapping (address funder => uint256 amountFunded ) public addressToAmountFunded;

    //function to send or fund our muminimum of 5usd to our contract 
    function fund() public payable {
        require (getConversionRate(msg.value) >= minimumUSD, "You need to send at least 5 eth");

        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }

    //function to get the price of ether from chainlink interface 
    function getprice () public view returns (uint256) {

        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 answer,,,)= priceFeed.latestRoundData();
        return uint256(answer) * 1e18;
    }

    function getConversionRate (uint256 ethAmount) public view returns (uint256){
        uint256 ethPrice = getprice();
        uint256 ethAmountInUsd = (ethAmount * ethPrice) / 1e18;
        return ethAmountInUsd;
    }

    function withdraw () public  {

    }
    //function to get version of price feed 
    function getVersion () public  view returns (uint256) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
}