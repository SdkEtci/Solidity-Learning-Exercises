// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26; // 0.8.26 version and higher
contract Exercise {
    address owner;
    uint256 id;

    constructor(){
        owner = msg.sender; 
    }

    // Bircok yerde kullanacagimiz kosullari modifier ile kullanabiliriz
    modifier onlyOwner{
        require(msg.sender == owner, "This is only owner function");
        _;
    }

    function get_id() public view returns (uint256){
        return id;
    }

    function set_id(uint256 _id) public onlyOwner{
        id = _id;
    }

    function transfer_ownership(address _newOwner) public onlyOwner{
        owner = _newOwner;
    }

    
}