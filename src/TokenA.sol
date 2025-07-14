// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TokenA is ERC20 {
    constructor(uint256 initialSupply) ERC20("TokenA", "TKA") {
        // Convierte a 18 decimales automáticamente
        _mint(msg.sender, initialSupply * 1e18);
    }
}
