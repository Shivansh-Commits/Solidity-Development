//SPDX-License-Identifier:UNLICENSED

pragma solidity ^0.8.11;

contract ownerAuthentication
{
    address owner;
    
    constructor() public                                       //just like java constructor , called only while deployment.
    {
    owner=msg.sender;    
    }

    function getEther()public payable{}

    function withdrawAllMoney(address payable _to)public
    {   
        require(msg.sender==owner,"YOU ARE NOT THE OWNER");    //conditional statement updated from lappy
        _to.transfer(address(this).balance);
    }
}