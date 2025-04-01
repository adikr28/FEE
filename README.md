# Dynamic Fee Contract

## Overview
The **Dynamic Fee Contract** is a smart contract that adjusts transaction fees dynamically based on network activity. When transactions are frequent, the fee increases; when activity slows down, the fee decreases.

## Features
- **Automatic Fee Adjustment**: The contract increases or decreases the fee based on the block difference since the last transaction.
- **Owner Control**: The contract owner can manage and deploy the contract.
- **Event Logging**: Emits events when fees are updated or transactions are processed.

## Deployment

### Prerequisites
- Solidity ^0.8.0
- A compatible Ethereum development environment (Remix, Hardhat, Foundry, etc.)

### Steps
1. Deploy the contract using Remix or a Hardhat script.
2. Ensure that the deployment account is assigned as the contract owner.

## Contract Address
```
0x6403B0b15384FDD89BaE0fbed81d4CE9a2457FD5


```

## Functions

### `adjustFee()`
Adjusts the transaction fee based on recent activity:
- Increases the fee if transactions are frequent.
- Decreases the fee if transactions are infrequent.

### `executeTransaction()`
- Users must send the required fee to process a transaction.
- The fee is dynamically adjusted with each transaction.
- Emits a `TransactionProcessed` event.

## Events

### `FeeUpdated(uint256 newFee)`
Emitted when the transaction fee changes.

### `TransactionProcessed(address user, uint256 fee)`
Emitted when a transaction is successfully executed.

## License
MIT License

