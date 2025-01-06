// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26; 

// Humans are created with this contract
contract Second{
    struct Human{
        uint256 id;
        string name;
        uint8 age;
        uint8 gender;
    }

    function generateHuman(uint256 _id, string memory _name, uint8 _age, uint8 _gender) pure public returns(Human memory){
        Human memory _newHuman = Human({
            id: _id,
            name: _name,
            age: _age,
            gender: _gender
        });
        return _newHuman;
    }  
}