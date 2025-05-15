// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;


contract BalanceChecking {

    //sturct to store user data 
    struct user{
        address id;
        uint256 balance;
    }

    //array to store user data
    user[] public usersData;

    //mapping point address to user balance 
    mapping (address => uint256) public addressToBalance;

    //function to add user and list people in the array 
    function addUser(address _id,uint256 _balance) public {
        usersData.push(user(_id,_balance));
        addressToBalance[_id] = _balance;
    }

    //function to check balance
    function checkUserBalance(address _id) public view returns (uint256){
    return addressToBalance[_id];
    }
}