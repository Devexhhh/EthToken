// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/DevexCoin.sol";

contract TestDevexCoin is Test {
    DevexCoin c;

    function setUp() public {
        c = new DevexCoin();
    }
    function test_Mint() public {
        c.mint(address(this), 100);
        assertEq(c.balanceOf(address(this)), 100);
        c.mint(0x075c299cf3b9FCF7C9fD5272cd2ed21A4688bEeD, 100);
        assertEq(c.balanceOf(0x075c299cf3b9FCF7C9fD5272cd2ed21A4688bEeD), 100);
    }

    function test_Transfer() public {
        c.mint(address(this), 100);
        c.transfer(0x075c299cf3b9FCF7C9fD5272cd2ed21A4688bEeD, 100);
        assertEq(c.balanceOf(0x075c299cf3b9FCF7C9fD5272cd2ed21A4688bEeD), 100);
        assertEq(c.balanceOf(address(this)), 0);
    }

    function test_Approve() public {
        c.mint(address(this), 100);
        c.approve(0x075c299cf3b9FCF7C9fD5272cd2ed21A4688bEeD, 100);
        uint amount = c.allowance(
            address(this),
            0x075c299cf3b9FCF7C9fD5272cd2ed21A4688bEeD
        );
        assertEq(amount, 100);
        vm.prank(0x075c299cf3b9FCF7C9fD5272cd2ed21A4688bEeD);
        c.transferFrom(
            address(this),
            0x075c299cf3b9FCF7C9fD5272cd2ed21A4688bEeD,
            100
        );
        assertEq(c.balanceOf(address(this)), 0);
        assertEq(c.balanceOf(0x075c299cf3b9FCF7C9fD5272cd2ed21A4688bEeD), 100);
    }
}
