// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26; 

contract SecondContract{
    uint256 public id = 4242;
}

contract FirstContract{
    function createNewSecondContract() public returns(address){
        SecondContract _newContract = new SecondContract();

        return address(_newContract);
    }
}