// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter{
     //this  function that give us the value of ethereum in term of USD
    function getPrice() internal  view returns(uint256) {
        //ABI
        //Address 0xCf05a09F3D05f46cE68e16C102666938666d3845
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xCf05a09F3D05f46cE68e16C102666938666d3845);
        (,int256 price ,,,) = priceFeed.latestRoundData();
        //Ethereum in term of USD
        return uint256 (price * 1e10);
    }

    function getVersion() internal  view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0xCf05a09F3D05f46cE68e16C102666938666d3845);
        return priceFeed.version();
    }
     
    //this function we use on our fund function to make sure that we send enough mesg.value in our fund
    function getConversionRate(uint256 ethAmount) internal  view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
}

