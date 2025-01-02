// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26; 

contract Second{
    mapping(address => string) walletName;
    
    // String degeri struct yapisi ile tutuldugu icin memory keyword u kullanilir
    // kullanildiktan sonra atmasini soyluyoruz

    function set_walletName(string memory _name) public{
        // String leri birbiriyle dogrudan karsilastiramiyoruz
        // Bu sebeple string lerin hash sonuclarini kontrol ediyoruz
        // keccak -> byte 32 
        require(keccak256(_name) != keccak256("Sidika"));
        walletName[msg.sender] = _name;
    }

    function get_walletName(address _wallet) public view returns(string memory){
        return walletName[_wallet];
    }  

    
}