// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;



contract Cows {
    string public name;
    uint256 public birdNumber;

    constructor(string memory _name, uint256 _birdNumber){
        name = _name;
        birdNumber = _birdNumber;
    }
}
