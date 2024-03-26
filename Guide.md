# Guide

Let's get you equipped! This guide will go over setting up your development environment and ERC20 token functionality.

## Foundry

Starting point is setting up a new Foundry project to deploy our contract to Scroll Sepolia Testnet and verify it.

If you need help regarding with Foundry, please see: [Foundry-Exercise](./Foundry-Exercise.md).

## ERC20

First of all, notice that ERC20 tokens are fungible. So each of an individual ERC20 token is completely indistinguishable than the other. For example, technically there is no difference between a USDT in my wallet and the one in yours.

### What you need?

1. **Total Supply:** You should initialize the total supply of your token.
2. **Balances:** You should store a balance value for each user.
3. **Allowance:** Similarly, you should store an allowance value for each user. It will determine how much allowance each user gives to different accounts.
4. **Name, Symbol and Decimals:** Of course your token needs a fancy name, a symbol, and number of decimals to help EVM understand the units.
5. **Transfer Function:** You should write a transfer function allowing users move their assets (in terms of your token) to another addresses.
6. **Approve Function:** You'll need an approve function to manage allowances.
7. **A More Generic Transfer Function:** Build another transfer function so that a caller can even decide who is sending the transferring tokens.
8. **Mint and Burn Functions:** Finally you will need minting and burning functions to increase or decrease the total supply of your token.

## Solidity

1. Variables
2. Functions

## Further Reading

1. [Beginner's Guide: What is ERC20?](https://www.blockchain-council.org/ethereum/beginners-guide-what-is-erc20/)
2. [What Crypto Users Need to Know: The ERC20 Standard](https://www.investopedia.com/tech/why-crypto-users-need-know-about-erc20-token-standard/)