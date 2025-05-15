// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;


contract SimpleStorage {
    uint256 favoriteNumber;

    person [] public listOfPeople;

    //we are mapping our name to favorite number
    mapping (string => uint256) public nameTofavoriteNumber;

    //struct is a datatype to store data of multiple types
    struct person{
        uint256 favoriteNumber;
        string name;
    }

    //function to store favorite number 
    function store(uint256 _favoriteNumber) public  {
        favoriteNumber = _favoriteNumber;
    }


    //function to retrieve favorite number
    function retrieve() public view returns (uint256){
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber)public{
        listOfPeople.push(person(_favoriteNumber, _name));
        nameTofavoriteNumber[_name] = _favoriteNumber;
    }
}