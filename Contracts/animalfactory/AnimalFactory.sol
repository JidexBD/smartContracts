// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {Cows} from "Contracts/animalfactory/Cow.sol";
import {Birds} from "Contracts/animalfactory/Bird.sol";


contract AnimalFactory {


// Factory contract to create and manage Cows and Birds

    Cows[] public listOfCowsContracts;
    Birds[] public listOfBirdsContracts;

    function createCow(string memory _name, uint256 _birdNumber) public returns (address) {
        Cows newCow = new Cows(_name, _birdNumber);
        listOfCowsContracts.push(newCow);
        return address(newCow);
    }

    function createBird(string memory _species, uint256 _cowNumber) public returns (address) {
        Birds newBird = new Birds(_species, _cowNumber);
        listOfBirdsContracts.push(newBird);
        return address(newBird);
    }

    function getCow(uint256 index) public view returns (address) {
        return address(listOfCowsContracts[index]);
    }

    function getBird(uint256 index) public view returns (address) {
        return address(listOfBirdsContracts[index]);
    }
}
