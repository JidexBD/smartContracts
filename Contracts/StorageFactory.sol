// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

//imports from our simple storage contract
import {SimpleStorage} from "./SimpleStorage.sol";



contract StorageFactory { 
  
    //stores our simple storage contracts
    SimpleStorage [] public listOfSimpleStorageContracts;

    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorageContract = new   SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }


    //his function is used for storing data into your list of Simple Storage smart contracts based on index and number.
    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        mySimpleStorage.store(_newSimpleStorageNumber);
    }

    function sfget(uint256 _simpleStorageIndex)public view returns(uint256){
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    
    }


}