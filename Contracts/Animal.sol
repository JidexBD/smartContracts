// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;



contract Animal{

    struct Animals{
        uint256 animalNumber;
        string animalName;

    }

    Animals [] public listOfAnimals;

    //constructor to add 3 animals manually 
    constructor () {
        listOfAnimals.push(Animals (1,"Dog"));
         listOfAnimals.push(Animals (2,"Cat"));
          listOfAnimals.push(Animals (3,"Mouse"));
    }

    //function to addAnimal using our struct and array 
    function addAnimal(uint256 _animalNumber,string memory _animalName) public {
        listOfAnimals.push(Animals(_animalNumber ,_animalName));
    }

    //function to get list of animals 
    function getAnimal() public view returns(Animals[]memory) {
        return listOfAnimals;
    }

    //function to get specific animal 
}