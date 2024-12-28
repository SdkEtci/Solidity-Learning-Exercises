// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26; // 0.8.26 version and higher
contract Exercise {
    address owner;
    uint8 id;

    constructor(){
        owner = msg.sender; 
    }

    function get_id() public view returns(uint8) {
        return id;
    }

    function set_id(uint8 _id) public returns(bool){
        
        if (_id == 42 && msg.sender != owner)
            return false;
        else 
            id = _id;

        return true;
    }
}