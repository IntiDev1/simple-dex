// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/TokenA.sol";
import "../src/TokenB.sol";
import "../src/SimpleDEX.sol";

contract AddLiquidityScript is Script {
    function run() external {
        // ✅ Direcciones actualizadas del último deploy exitoso
        address tokenAAddr = 0x82118e7e113116918BF613fDf1E0F699F30F2245;
        address tokenBAddr = 0x4BC8bd15F32CdDd199903AccB62C82EE5fAD8a83;
        address dexAddr    = 0x90b42297a4EE84145bd70d678Ae833AB5855739a;

        
        vm.startBroadcast();

        // Instanciar contratos
        TokenA tokenA = TokenA(tokenAAddr);
        TokenB tokenB = TokenB(tokenBAddr);
        SimpleDEX dex = SimpleDEX(dexAddr);

        uint256 amount = 1000 ether;

        // Autorizar al DEX mover los tokens
        tokenA.approve(dexAddr, amount);
        tokenB.approve(dexAddr, amount);

        // Agregar liquidez al DEX
        dex.addLiquidity(amount, amount);

        vm.stopBroadcast();
    }
}

