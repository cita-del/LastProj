// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    // Constructor
    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {}


    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);                                            // Mint new tokens 
    }

 
    function transferTokens(address to, uint256 amount) external {
        _transfer(msg.sender, to, amount);                           // Transfer tokens
    }   


    function redeemTokens(uint256 amount) external {
        _burn(msg.sender, amount);                                   // Redeem tokens for items etc..
    }

    
    function balanceOfPlayer() external view returns (uint256) {
        return this.balanceOf(msg.sender);                          // Check token balance
    }

    // Burn tokens 
    function burnTokens(uint256 amount) external {
        _burn(msg.sender, amount);
    }
}
