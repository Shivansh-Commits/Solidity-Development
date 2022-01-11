//SPDX-License-Identifier:UNLICENSED

pragma solidity ^0.8.11;

contract mappings
{
    mapping(address => uint) public balanceReceived;

    function getMoney()public payable{
        balanceReceived[msg.sender] += msg.value;
    }

    function getBalance()public view returns(uint){
        return address(this).balance;
    }

    function withdrawMoney(address payable _to,uint _amount) public
    {
        require(_amount <= balanceReceived[msg.sender] , "NOT ENOUGH FUNDS");
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}