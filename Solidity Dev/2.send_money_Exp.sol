//SPDX-License-Identifier:UNLICENSED

pragma solidity  ^0.8.11;

contract sendMoneyexp
{
    uint public balanceReceived;

    function receiveMoney() public payable    //In order to receive Ether into the Smt.Cont we need a payable function
    {
        balanceReceived += msg.value;        //this statement is not necessary.
    }

    function viewBalance() public view returns(uint)
    {
        return address(this).balance;
    }

    function withdrawMoney() public 
    {
        address payable to_address = payable(msg.sender);
        to_address.transfer(address(this).balance);
    }

    function withdrawMoneyto(address payable _to)public
    {
        _to.transfer(address(this).balance);
    }
}