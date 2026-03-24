// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/DevexCoin.sol";

contract TestDevexCoin is Test {
    DevexCoin c;

    function setUp() public {
        c = new DevexCoin(0);
    }
    function testSimple() public {
        assertEq(uint(2), uint(2), "ok");
    }
}
