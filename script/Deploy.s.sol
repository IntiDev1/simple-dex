// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/TokenA.sol";
import "../src/TokenB.sol";
import "../src/SimpleDEX.sol";

contract DeployDEX is Script {
    function run() external {
        vm.startBroadcast();

        TokenA tokenA = new TokenA(1_000_000 ether);
        TokenB tokenB = new TokenB(1_000_000 ether);
        SimpleDEX dex = new SimpleDEX(address(tokenA), address(tokenB));

        console.log(" TokenA deployed at:", address(tokenA));
        console.log(" TokenB deployed at:", address(tokenB));
        console.log(" SimpleDEX deployed at:", address(dex));

        vm.stopBroadcast();
    }
}

