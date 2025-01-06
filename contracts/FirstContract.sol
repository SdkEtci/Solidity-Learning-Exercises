// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26; 

interface ISecondContract{
    function get_treasure() external returns(uint256);    
}

contract FirstContract{

    function get_treasure_in_contract(address _contractAddress) public returns(uint256){
        ISecondContract _myNewContract = ISecondContract(_contractAddress);

        return _myNewContract.get_treasure();
    }
}