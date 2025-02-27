// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
 * @title Counter
 * @dev Simple contract to manage a counter with increment functionality
 */
contract Counter2 {

    // here by making state public and setting default value we need not use a constructor hence saving gas
    uint256 public count = 0; // State variable to store the counter value and is stored on the blockchain


    /**
     * @dev Increments the count by 1.
     * @notice This function modifies the state, so it costs gas.
     */
    function incrementCount() public {
        count += 1;
    }
}
