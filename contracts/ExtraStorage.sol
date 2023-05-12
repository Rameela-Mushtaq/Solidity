// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

//it is a child contract that inherit the proprities of the function of another contract
//and we inherit the functinality just by is keyword

//now ExtraStorage inherit all the properties and it is same like as SimpleStorage contract
contract ExtraStorage is SimpleStorage{

    //Here we want to override the function that is alredy write in simple storage .fot this we have to add the override key word in this child function and virtual keyword on parent function

     
     function store(uint256 _favoriteNumber) public override  {
         favoriteNumber = _favoriteNumber + 5;
     }
}