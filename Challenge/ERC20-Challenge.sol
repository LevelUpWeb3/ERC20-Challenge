// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// Define your ERC20 token contract
contract MyToken is ERC20 {
    // Define the global variables for balances, total supply, name, and symbol below

    // Constructor that mints the initial supply to the deployer of the contract
    constructor(uint256 initialSupply) ERC20("MyToken", "MTK") {
        // Mint the initial supply of tokens to the deployer's address
    }

    // Function to mint new tokens to a specified address
    function mint(address to, uint256 amount) public {
        // Implement the mint function using the _mint internal function
    }

    // Function to burn tokens from a specified address
    function burn(address from, uint256 amount) public {
        // Implement the burn function using the _burn internal function
    }

    // Function to transfer tokens from the caller's address to a specified address
    function transfer(address to, uint256 amount) public override returns (bool) {
        // Implement the transfer function using the _transfer internal function
    }

    // Function to approve an address to spend a certain amount of tokens on behalf of the caller
    function approve(address spender, uint256 amount) public override returns (bool) {
        // Implement the approve function using the _approve internal function
    }

    // Function to transfer tokens from one address to another using an allowance
    function transferFrom(address from, address to, uint256 amount) public override returns (bool) {
        // Implement the transferFrom function using the _transfer and _approve internal functions
    }

    function getBalanceOf(address account) public view returns (uint256) {
        // Implement the getBalanceOf function
    }
}
