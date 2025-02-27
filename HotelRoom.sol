// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract HotelRoom {

    // no semicolons apparently 
    enum Statuses {Vacant, Occupied} 
    Statuses public currentStatus;

    event Occupy(address _occupant, uint _value);

    // Owner's address ("payable" so it can receive Ether)
    address payable public owner;

    // Constructor sets the owner as the deployer
    constructor() {
        owner = payable(msg.sender); // Explicitly cast msg.sender as payable
        currentStatus = Statuses.Vacant;
    }

    // encapsulate require statements using modifier
    // if require condition is true _; is replaced with function body
    modifier vacancyRequirement() {
        require(currentStatus == Statuses.Vacant, "Room occupied");
        _;
    }

    modifier amountRequirement(uint _amount) {
        require(msg.value >= _amount, "Not enough ether");
        _;
    }

    // Book function to send Ether to the owner
    // make function "payable" when transfer of eth is done
    function book() public payable vacancyRequirement amountRequirement(2 ether) {
        // if any of the below two require conditions are false stop executing any further
        
        currentStatus = Statuses.Occupied;
        owner.transfer(msg.value); // Correct transfer of Ether

        emit Occupy(msg.sender, msg.value);
    }
}
