// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;



contract Birds {
    string public species;
    uint256 public cowNumber;

    constructor(string memory   _species, uint256 _cowNumber){
        species = _species;
        cowNumber = _cowNumber;
    }
}
