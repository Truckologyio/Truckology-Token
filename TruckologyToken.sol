// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TruckologyToken is ERC20Burnable, Ownable {
    // Constants
    uint256 public constant TOTAL_SUPPLY = 575_000_000 * 10**18;
    uint256 public constant THEO_INITIAL_MINTING = 1_000_000 * 10**18;

    // Addresses
    address public theoxToken;

    // Events
    event MintTheox(address indexed to, uint256 amount);

    // Constructor
    constructor() ERC20("TruckologyToken", "THEO") {
        // Mint initial THEO tokens
        _mint(msg.sender, THEO_INITIAL_MINTING);
    }

    // Function to distribute tokens to specified addresses
    function distributeTokens() external onlyOwner {
        // ... (your existing distribution logic)
    }

    // Function to mint additional THEOX tokens
    function mintTheox(address to, uint256 amount) external onlyOwner {
        require(theoxToken != address(0), "Theox token not set");
        TruckologyToken(theoxToken).mint(to, amount);
        emit MintTheox(to, amount);
    }

    // Function to set THEOX token address
    function setTheoxToken(address _theoxToken) external onlyOwner {
        require(_theoxToken != address(0), "Invalid Theox token address");
        theoxToken = _theoxToken;
    }

    // Function to mint THEO tokens
    function mintTheo(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    // Function to transfer tokens
    function transferTokens(address to, uint256 amount) external onlyOwner {
        _transfer(_msgSender(), to, amount);
    }

    // Function to check balance
    function checkBalance(address account) external view returns (uint256) {
        return balanceOf(account);
    }
}
