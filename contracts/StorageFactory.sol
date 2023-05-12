// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory{
    SimpleStorage[] public  simpleStorageArray;
   
    //this function allows us to deploy one contract from an other contract
    function createSimpleStorageContract() public {
           SimpleStorage simpleStorage = new SimpleStorage();
           simpleStorageArray.push(simpleStorage);

    }

    //function for the interaction of one contract with other contract 
    //by this function we can store value from our storagefactory contract

    function sfStore(uint256 _simpleStorageIndex, uint256 _simplaeStorageNumber) public{
        //for interaction two thing are needed 1: Address and 2: ABI (Applcation Binary Interface) that tell how can we interact
        
        simpleStorageArray[_simpleStorageIndex].store(_simplaeStorageNumber);

        // SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        // simpleStorage.store(_simplaeStorageNumber);

    }

    //this function is for reading content from the storagefactory contract from every simplestorage contract that we created
    function sfGet(uint256 _simpleStorageIndex) public  view  returns(uint256){
        //two ways to read values from storagefactory contract

        return simpleStorageArray[_simpleStorageIndex].retrieve();

        //  SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        //  return simpleStorage.retrieve();
    }

}