//Get funds from users
//withdrwa fund
//set the minimun funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./PriceConverter.sol";

contract FundMe{
    using PriceConverter for uint256;
    uint256 public minimumUsd = 50 * 1e18;

    address[] public funders;
    mapping (address => uint256) public addressToAmountFunded;
     
    //payable keyword allows to access to the value section
    function fund() public payable {
    //want to b able to get minimum fund value in USD
    //require key word work as a checker for the value is greater then 1 eth if it is not then show t0 error
    require(msg.value.getConversionRate() > minimumUsd, "Didn't send enough");
    funders.push(msg.sender);
    addressToAmountFunded[msg.sender] = msg.value;
    }

   

    function withdraw() public {
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
        //code
        address funder = funders[funderIndex];
        addressToAmountFunded[funder] = 0;
        }

        //reset an array
        funders = new address[] (0);
        //actually withdraw the fund

        //transfer
        payable(msg.sender).transfer(address(this).balance);
        //send
        bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess, "Send Failed");
        //call
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Send Failed");
    }
}