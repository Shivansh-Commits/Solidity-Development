//SPDX-License-Identifier:UNLICENSED

pragma solidity ^0.8.11;

contract exception{

    mapping(address => uint) public balanceReceived;

    function getMoney() public payable{
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to , uint _amount) public{   
        require(_amount <= balanceReceived[msg.sender],"INSUFFICIENT BALANCE");
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }

}

