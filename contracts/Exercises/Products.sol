// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
import "@openzeppelin/contracts/utils/Strings.sol";

contract Products{

    // struct mapping den daha fazla gas ödetir
    struct Product{
        uint8 barcode;
        uint8 station;
    }
    // struct kullamak yerine mapping de kullanilabilir
    // mapping(uint256 => uint8) productStation;

    // herbir duragin cuzdani icin mapping
    mapping (uint8 => address) stationWallets;

    Product[] productList;
    address owner;

    constructor(){
        owner = msg.sender; 
    }
    
    modifier onlyOwner{
        require(msg.sender == owner, "This is only owner function");
        _;
    }

    function getStationWallet(uint8 _stationNumber) public view returns(address){
        return stationWallets[_stationNumber];
    }

    function updateStationWallet(uint8 _stationWallet, address _walletAddress) public onlyOwner{
        stationWallets[_stationWallet] = _walletAddress;
    }

    function transfer_ownership(address _newOwner) public onlyOwner{
        owner = _newOwner;
    }

    function addProduct(uint8 _barcode, uint8 _station) public onlyOwner{
        require(msg.sender == stationWallets[_station], "Not allowed.");
        require(_station <= 3 && _station >= 1, "Station value is invalid.");
        require(!isThereBarcode(_barcode), "Barcode already used.");

        Product memory newProduct = Product({
            barcode: _barcode,
            station: _station
        });
        
        productList.push(newProduct);
    }
    
    function getProductList() public view returns(string memory){
        string memory str;
        for (uint i = 0; i < productList.length; i++) {
            str = string.concat(str, "Barcode: ", Strings.toString(productList[i].barcode), " Station: ", Strings.toString(productList[i].station), " ");
        }
        return str;
    }

    function getStation(uint8 _barcode) public view returns(uint8){
        for (uint i = 0; i < productList.length; i++) {
            if (productList[i].barcode == _barcode) {
                return productList[i].station;
            }
        }
        return 0;
    }
    
    function changeStation(uint8 _barcode) public onlyOwner{
        for (uint i = 0; i < productList.length; i++) {
            if (productList[i].barcode == _barcode) {
                require(productList[i].station != 3, "It is in the last station");
                productList[i].station++;
            }
        }
    }

    function isThereBarcode(uint8 _barcode) public view returns(bool){
        
        for (uint i = 0; i < productList.length; i++) {
            if (productList[i].barcode == _barcode) {
                return true;
            }
        }

        return false;
    }
}