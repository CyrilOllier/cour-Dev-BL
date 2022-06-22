// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.13;

//version avec constructeur pour deployScript

contract SimpleStorage {
    uint  storageData;

    constructor(uint _n) payable{
        set(_n);
    }

    function get() public view returns(uint) {
        return storageData;
    }
    
    function set(uint n) public {
        storageData = n;
    }

}
