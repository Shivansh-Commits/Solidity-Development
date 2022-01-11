//SPDX-License-Identifier:UNLICENSED

pragma solidity ^0.6.0;

contract MyContract 
{
    address owner;
    constructor

    function getMoney() public payable
    {

    }
    function checkBalance() public view returns(uint)
    {
    return address(this).balance;
    }

    function withdrawMoney(address payable _to)public 
    {
    _to.transfer(address(this).balance);
    }

}