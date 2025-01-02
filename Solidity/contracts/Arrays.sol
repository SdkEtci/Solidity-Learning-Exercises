// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26; 

contract Array{
    uint256[] numbers;
    Human[] humanList;

    struct Human{
        string name;
        uint256 age;
    }

    function add_human(string memory _name, uint256 _age) public{
        Human memory _newHuman = Human({
            name: _name,
            age: _age
        });

        humanList.push(_newHuman);
    }

    function get_from_humanList(uint256 _index) public view returns(Human memory){
        return humanList[_index];
    }

    function add_number(uint256 _number) public{
        numbers.push(_number);
    }

    function get_number(uint256 _index) public view returns(uint256){
        return numbers[_index];
    }
}