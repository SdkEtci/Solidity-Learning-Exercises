// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26; 

contract SecondContract{
    uint256 treasure = 100 ;

    function get_treasure() public view returns(uint256){
        return treasure;
    }
}