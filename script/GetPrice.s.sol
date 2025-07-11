// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/SimpleDEX.sol";

contract GetPrice is Script {
    function run() external view {
        address dex    = 0x90b42297a4EE84145bd70d678Ae833AB5855739a;


        uint256 priceA = SimpleDEX(dex).getPrice(0x82118e7e113116918BF613fDf1E0F699F30F2245);
        uint256 priceB = SimpleDEX(dex).getPrice(0x4BC8bd15F32CdDd199903AccB62C82EE5fAD8a83);

        console.log(" Price TokenA:", priceA);
        console.log(" Price TokenB:", priceB);
    }
}
