// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/math/Math.sol"; // (opcional)
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol"; // Usamos funciones seguras

/// @title SimpleDEX - Un exchange descentralizado básico con pool de liquidez
contract SimpleDEX {
    using SafeERC20 for IERC20; // Activamos funciones seguras para transferencias

    IERC20 public tokenA;
    IERC20 public tokenB;
    address public owner;

    uint256 public reserveA;
    uint256 public reserveB;

    event LiquidityAdded(uint256 amountA, uint256 amountB);
    event LiquidityRemoved(uint256 amountA, uint256 amountB);
    event Swapped(address indexed user, address tokenIn, uint256 amountIn, address tokenOut, uint256 amountOut);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner");
        _;
    }

    /// @notice Constructor recibe las direcciones de los tokens
    constructor(address _tokenA, address _tokenB) {
        tokenA = IERC20(_tokenA);
        tokenB = IERC20(_tokenB);
        owner = msg.sender;
    }

    /// @notice Agrega liquidez al pool (solo el owner)
    function addLiquidity(uint256 amountA, uint256 amountB) external onlyOwner {
        tokenA.safeTransferFrom(msg.sender, address(this), amountA);
        tokenB.safeTransferFrom(msg.sender, address(this), amountB);

        reserveA += amountA;
        reserveB += amountB;

        emit LiquidityAdded(amountA, amountB);
    }

    /// @notice Intercambia TokenA por TokenB
    function swapAforB(uint256 amountAIn) external {
        tokenA.safeTransferFrom(msg.sender, address(this), amountAIn);

        uint256 amountBOut = getAmountOut(amountAIn, reserveA, reserveB);

        require(reserveB >= amountBOut, "Not enough TokenB liquidity");

        tokenB.safeTransfer(msg.sender, amountBOut);

        reserveA += amountAIn;
        reserveB -= amountBOut;

        emit Swapped(msg.sender, address(tokenA), amountAIn, address(tokenB), amountBOut);
    }

    /// @notice Intercambia TokenB por TokenA
    function swapBforA(uint256 amountBIn) external {
        tokenB.safeTransferFrom(msg.sender, address(this), amountBIn);

        uint256 amountAOut = getAmountOut(amountBIn, reserveB, reserveA);

        require(reserveA >= amountAOut, "Not enough TokenA liquidity");

        tokenA.safeTransfer(msg.sender, amountAOut);

        reserveB += amountBIn;
        reserveA -= amountAOut;

        emit Swapped(msg.sender, address(tokenB), amountBIn, address(tokenA), amountAOut);
    }

    /// @notice Retira liquidez (solo el owner)
    function removeLiquidity(uint256 amountA, uint256 amountB) external onlyOwner {
        require(reserveA >= amountA && reserveB >= amountB, "Not enough reserves");

        reserveA -= amountA;
        reserveB -= amountB;

        tokenA.safeTransfer(msg.sender, amountA);
        tokenB.safeTransfer(msg.sender, amountB);

        emit LiquidityRemoved(amountA, amountB);
    }

    /// @notice Retorna el precio actual de 1 unidad del token opuesto
    function getPrice(address _token) external view returns (uint256) {
        if (_token == address(tokenA)) {
            require(reserveA > 0, "No TokenA liquidity");
            return (reserveB * 1e18) / reserveA;
        } else if (_token == address(tokenB)) {
            require(reserveB > 0, "No TokenB liquidity");
            return (reserveA * 1e18) / reserveB;
        } else {
            revert("Token not supported");
        }
    }

    /// @notice Fórmula de producto constante para calcular el output de un swap
    function getAmountOut(uint256 amountIn, uint256 reserveIn, uint256 reserveOut) internal pure returns (uint256) {
        require(reserveIn > 0 && reserveOut > 0, "Invalid reserves");

        uint256 amountInWithFee = amountIn * 997; // 0.3% de fee (Uniswap-style)
        uint256 numerator = amountInWithFee * reserveOut;
        uint256 denominator = (reserveIn * 1000) + amountInWithFee;

        return numerator / denominator;
    }
}
