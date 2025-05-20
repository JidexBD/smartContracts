// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {MathLibrary} from "Contracts/MathLibrary.sol";
contract CreditMe{
    //functon to calculate the sum of something, witht the imported MathLibrary.sol library 
    function calculateSum () public pure returns (uint256) {
        return MathLibrary.sum(20,20);
    }
}