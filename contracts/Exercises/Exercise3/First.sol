// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26; 

// Features
// Human struct - ID | isim | yas | cinsiyet
// Iki contract
// Tüm humanlar 2. Kontratta saklansin (olusturulsun)
// Human olusturma ve human okuma islemleri 1. Kontrat araciligiyla yapilsin

struct Human{
        uint256 id;
        string name;
        uint8 age;
        uint8 gender;
}

interface ISecondContract{
    function generateHuman(uint256 _id, string memory _name, uint8 _age, uint8 _gender) external returns(Human memory);    
}

contract First{
    Human[] humanList;

    function addHuman(address _contractAddress, uint256 _id, string memory _name, uint8 _age, uint8 _gender) public{
        ISecondContract _newContract =ISecondContract(_contractAddress);
        humanList.push(_newContract.generateHuman(_id, _name, _age, _gender));
    }

    function getFromHumanList(uint256 _index) public view returns(Human memory){
        return humanList[_index];
    }
}