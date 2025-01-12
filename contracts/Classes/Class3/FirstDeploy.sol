// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26; 

contract FirstDeploy{
    string message = "Kapsul education";
    uint256 date;

    constructor(){
        date = block.timestamp;
    }

    function getMessage() public view returns(string memory){
        return message;
    }

    function getDate() public view returns(uint256){
        return date;
    }

}