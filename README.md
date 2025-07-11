# 🧪 SimpleDEX - Proyecto Final Módulo 3

Este es el proyecto final del Módulo 3 del curso de Solidity. Desarrollamos un **AMM DEX (Intercambiador Descentralizado)** tipo Uniswap muy simple usando Foundry, que permite:

- Crear dos tokens ERC20 (`TokenA`, `TokenB`)
- Desplegar un contrato `SimpleDEX`
- Agregar liquidez
- Hacer swaps entre TokenA y TokenB
- Consultar precios
- Retirar liquidez

---

## 🛠 Herramientas utilizadas

- ⚙️ Foundry (forge, cast, script)
- Solidity ^0.8.20
- Scroll Sepolia testnet
- RPC público: `https://rpc.scroll.io`
- Alchemy/Infura para RPC privado (si se desea)

---

## 📦 Estructura

simple-dex/
│
├── src/
│ ├── TokenA.sol
│ ├── TokenB.sol
│ └── SimpleDEX.sol
│
├── script/
│ ├── Deploy.s.sol # Despliega TokenA, TokenB, SimpleDEX
│ ├── AddLiquidity.s.sol # Agrega liquidez
│ ├── SwapTokens.s.sol # Hace un swap TokenA -> TokenB
│ ├── RemoveLiquidity.s.sol # Retira liquidez
│ ├── GetPrice.s.sol # Consulta precios
│ └── CheckBalance.s.sol # Verifica balances
│
├── .env # Claves privadas y URL RPC (ignorado)
├── foundry.toml
├── .gitignore
└── README.md


## Autor
Nombre: IntiDev1

Curso: Solidity - Módulo 3

Wallet: 0xA43172d819542155D16F7059563951381BFD70Dc

