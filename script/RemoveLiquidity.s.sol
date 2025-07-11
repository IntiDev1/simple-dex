// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/SimpleDEX.sol";

contract RemoveLiquidity is Script {
    function run() external {

        address dex    = 0x90b42297a4EE84145bd70d678Ae833AB5855739a;


        vm.startBroadcast();

        // Retira 500 de cada token
        SimpleDEX(dex).removeLiquidity(500 ether, 500 ether);

        vm.stopBroadcast();
    }
}
