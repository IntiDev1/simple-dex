// script/CheckBalance.s.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/TokenA.sol";


contract CheckTokenBalance is Script {
    function run() external view {
        TokenA token = TokenA(0x82118e7e113116918BF613fDf1E0F699F30F2245);
        address owner = 0xA43172d819542155D16F7059563951381BFD70Dc;
        uint256 balance = token.balanceOf(owner);
        console.log(" Balance TokenA:", balance);
    }
}

