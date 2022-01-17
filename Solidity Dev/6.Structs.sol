//SPDX-License-Identifier:UNLICENSED

pragma solidity ^0.8.11;

contract mappings
{
    struct Payment{
        uint amount;
        uint timestamp;
    }

    struct Balance{
        uint totalBalance;
        uint numPayments;
        mapping(uint=>Payment) payments;
    }

    mapping(address => Balance) public balanceReceived;

    function getMoney()public payable{
        balanceReceived[msg.sender].totalBalance += msg.value;
        Payment memory payment = Payment(msg.value,block.timestamp);
        balanceReceived[msg.sender].payments[balanceReceived[msg.sender].numPayments] = payment;
    }

    function getBalance()public view returns(uint){
        return address(this).balance;
    }

    function withdrawMoney(address payable _to , uint _amount) public
    {
        require(_amount <= (balanceReceived[msg.sender].totalBalance) ,"NOT ENOUGH FUNDS");
        balanceReceived[msg.sender].totalBalance -= _amount;
        _to.transfer(_amount);
    }
}