// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DynamicFeeContract {
    address public owner;
    uint256 public fee = 0.001 ether;
    uint256 public maxFee = 0.01 ether;
    uint256 public minFee = 0.0001 ether;
    uint256 public lastBlock;

    event FeeUpdated(uint256 newFee);
    event TransactionProcessed(address user, uint256 fee);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor() {
        owner = msg.sender;
        lastBlock = block.number;
    }

    function adjustFee() public {
        if (block.number - lastBlock > 100) {
            fee = fee > minFee ? fee - (fee / 10) : minFee;
        } else {
            fee = fee < maxFee ? fee + (fee / 10) : maxFee;
        }
        emit FeeUpdated(fee);
    }

    function executeTransaction() external payable {
        adjustFee();
        require(msg.value >= fee, "Insufficient fee");
        lastBlock = block.number;
        emit TransactionProcessed(msg.sender, fee);
    }
}
