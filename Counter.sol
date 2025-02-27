// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
 * @title Counter
 * @dev Simple contract to manage a counter with increment functionality
 */
contract Counter {
    uint256 private count; // State variable to store the counter value

    // constructor is called when the contract is deployed and count is set to 0
     constructor() public {
        count = 0;
     }

     /**
     * @dev Retrieves the current count value.
     * @return The current count value.
     * @notice This function is `view`, meaning it does not modify the blockchain state and is free of gas costs.
     */
    function getCount() public view returns (uint256) {
        return count;
    }

    /**
     * @dev Increments the count by 1.
     * @notice This function modifies the state, so it costs gas.
     */
    function incrementCount() public {
        count += 1;
    }
}
