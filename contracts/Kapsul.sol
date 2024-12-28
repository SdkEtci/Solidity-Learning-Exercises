// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26; // ^ isareti -> bu versiyon ve ustu

contract Kapsul {
    // yerden tasarruf yapmak icin -> once buyuk olan veriler yazilir daha sonra kucukler
    uint256 id; // private desek bile herkes gorebilir sadece baska kontrokatlar goremez
    address owner; // address -> 20 byte
    mapping(address => uint256) balances; // hashmap gibi calisir

    constructor(){
        owner = msg.sender; 
    }

    function set_balance(address _wallet, uint256 _balance) public{
        balances[_wallet] = _balance;
    }

    function get_balance(address _wallet) public view returns(uint256){
        return balances[_wallet];
    }

    // view -> sadece read islemi icin
    // pure -> hicbir sey
    // payable -> odeme alir

    function get_id() public view returns(uint256) {
        return id;
    }

    function set_id(uint256 _id) public returns(bool){
        require(msg.sender == owner, "This is an only owner function."); // if gibi calisir
        id = _id;
        return true;
    }
}