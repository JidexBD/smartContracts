// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {

    //this is to attach the function in our price converter  to all unit256
    using PriceConverter for uint256;

    //minimum usd we want our senders to send 
    uint256 public constant MINIMUMUSD = 5e18;

    //array of users that sent us eth or funded us
    address [] public funders;

    uint256 funderIndex;

    //mapping point an address to the amount funded.so we can know who sent what amount
    mapping (address funder => uint256 amountFunded ) public addressToAmountFunded;

    address public immutable i_owner; 

    //to make sure only owner can withdraw funds
    constructor () {
        i_owner = msg.sender;
    }
    //custom error 
    error NotOwner();

    //modifier to check if sender is owner with custom error added
    modifier onlyOwner( ){
        if (msg.sender != i_owner) {
        revert NotOwner();
        }
        _;
    }

  

    //function to send or fund our muminimum of 5usd to our contract 
    function fund() public payable {
        require (msg.value.getConversionRate() >= MINIMUMUSD, "You need to send at least 5 eth");

        addressToAmountFunded[msg.sender]  += msg.value;
    }

  

    function withdraw () public  {
     for (funderIndex = 0; funderIndex < funders.length; funderIndex++) {
        address funder = funders[funderIndex];
        addressToAmountFunded[funder] = 0;
        }

        //restting an array 
        funders = new address[](0);

        //to withdraw funds 
        (bool callSuccess, ) = payable (msg.sender).call{value: address(this).balance} ("");
        require(callSuccess , "call Failed" );

    }

     receive() external payable {
            fund();
        }

    fallback() external payable {
        fund();
        }
}