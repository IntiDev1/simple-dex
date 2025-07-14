# SimpleDEX 🦄💱

A basic decentralized exchange (DEX) that allows users to swap between two ERC-20 tokens (TokenA and TokenB), add/remove liquidity, and view token prices — all on the Sepolia testnet.

## 🧠 Overview

This project was developed as part of the Solidity Bootcamp Module 3 and demonstrates how a simple DEX operates on-chain.

### Features

- Add liquidity to the token pool.
- Swap between TokenA and TokenB.
- View token prices based on pool reserves.
- Withdraw liquidity (owner only).

## 📄 Contracts Deployed on Sepolia

- `TokenA`: [`0x9D2C1B9e22E08fF02a1Dde5a61aB13637945074c`](https://sepolia.etherscan.io/address/0x9D2C1B9e22E08fF02a1Dde5a61aB13637945074c)
- `TokenB`: [`0x0a2960B791491e02a5AbDCeabB24d73f7a314033`](https://sepolia.etherscan.io/address/0x0a2960B791491e02a5AbDCeabB24d73f7a314033)
- `SimpleDEX`: [`0x678A6Deaf2ECE17D75aC6045Db7B30Eb1251487b`](https://sepolia.etherscan.io/address/0x678A6Deaf2ECE17D75aC6045Db7B30Eb1251487b)

## 🚀 How to Deploy & Test in Remix

1. **Open Remix** at [remix.ethereum.org](https://remix.ethereum.org/)
2. **Connect Wallet** (Rabby or MetaMask) using `Injected Provider - Sepolia`
3. Deploy `TokenA` and `TokenB` with `initialSupply = 1_000_000`
4. Deploy `SimpleDEX` using the addresses of `TokenA` and `TokenB`
5. Approve the DEX to spend your tokens:
    - Call `approve(spender, amount)` from both `TokenA` and `TokenB`
    - `spender` = `SimpleDEX` address
    - `amount` = `1000000000000000000000` (1000 tokens)
6. Add liquidity via `addLiquidity(amountA, amountB)`
7. Swap using `swapAforB()` or `swapBforA()`
8. Get price using `getPrice(tokenAddress)`
9. View balances using `balanceOf(address)` from the token contracts

## 📦 Tech Stack

- Solidity ^0.8.20
- Remix IDE + Sepolia Testnet
- OpenZeppelin Contracts (ERC20)
- Foundry (for local testing and deployment)

## 📁 Project Structure


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



## 🙌 Author

**Andres Soto (IntiDev1)**  
Solidity Developer · Student at Solidity Course Bootcamp  
GitHub: [@IntiDev1](https://github.com/IntiDev1)
Wallet: 0xA43172d819542155D16F7059563951381BFD70Dc
---

🧪 Happy coding and experimenting with decentralized exchanges!




