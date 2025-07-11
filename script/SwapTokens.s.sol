// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/SimpleDEX.sol";
import "../src/TokenA.sol";

contract SwapTokens is Script {
    function run() external {

        address tokenA = 0x82118e7e113116918BF613fDf1E0F699F30F2245;
        address dex    = 0x90b42297a4EE84145bd70d678Ae833AB5855739a;


        vm.startBroadcast();

        // Approve swap
        TokenA(tokenA).approve(dex, 100 ether);

        // Swap 100 TokenA por TokenB
        SimpleDEX(dex).swapAforB(100 ether);

        vm.stopBroadcast();
    }
}
