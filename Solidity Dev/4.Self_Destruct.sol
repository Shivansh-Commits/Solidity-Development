//SPDX-License-Identifier:UNLICENSED

pragma solidity ^0.8.11;

contract self_destruct
{

uint public _var = 5;
address owner;

constructor() public
{
    owner = msg.sender;
}

function getEther()public payable{}

function DestroySmartContract(address payable _to)public
{
    require(msg.sender == owner,"YOU ARE NOT THE OWNER");
    selfdestruct(_to);         //self Destruct function takes one argument i.e an address to where the funds of the smt Cont will be sent.
}

}