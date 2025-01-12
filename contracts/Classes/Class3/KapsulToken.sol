// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26; 

contract BaseContract{
    uint256 public id = 4242;

    function setID(uint256 _id) public {
        id = _id;
    }
}

contract DerContract is BaseContract{
    // DerContract BaseConstract taki function lara ulasabilir
}