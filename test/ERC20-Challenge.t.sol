pragma solidity ^0.8.24;

import {Test, console} from "forge-std/Test.sol";  
import { MyToken } from "../Challenge/ERC20-Challenge.sol";

contract ContractTest is Test {
    MyToken public token;

    address alice = vm.addr(0x1);
    address bob = vm.addr(0x2);
    uint256 constant initial = 100e18;
    uint256 constant value = 2e18;

    function setUp() public {
        token = new MyToken(initial);
    }

    function testName() external view {
        assertEq("MyToken",token.name());
    }

    function testSymbol() external view {
        assertEq("MTK", token.symbol());
    }

    function testMint() public {
        token.mint(alice, value);
        assertEq(value, token.balanceOf(alice));
        assertEq(token.totalSupply(), initial + value);
    }

    function testBurn() public {
        token.mint(alice, value);
        assertEq(token.balanceOf(alice), value);
        uint256 burn = 1e18;
        token.burn(alice, burn);

        assertEq(token.totalSupply(), initial + value - burn);
        assertEq(token.balanceOf(alice), value - burn);
    }

    function testApprove() public {
        assertTrue(token.approve(alice, value));
        assertEq(token.allowance(address(this),alice), value );
    }

    function testTransfer() external {
        testMint();
        vm.startPrank(alice);
        token.transfer(bob, 0.5e18);
        assertEq(token.balanceOf(bob), 0.5e18);
        assertEq(token.balanceOf(alice), value - 0.5e18);
        vm.stopPrank();
    }

    function testTransferFrom() external {
        testMint();
        vm.prank(alice);
        token.approve(address(this), 1e18);
        assertTrue(token.transferFrom(alice, bob, 0.7e18));
        assertEq(token.allowance(alice, address(this)), 1e18 - 0.7e18);
        assertEq(token.balanceOf(alice), value - 0.7e18);
        assertEq(token.balanceOf(bob), 0.7e18);
    }

    function testFailMintToZero() external {
        token.mint(address(0), value);
    }

    function testFailBurnFromZero() external {
        token.burn(address(0) , value);
    }

    function testFailBurnInsufficientBalance() external {
        testMint();
        vm.prank(alice);
        token.burn(alice, value + 1);
    }

    function testFailApproveToZeroAddress() external {
        token.approve(address(0), value);
    }

    function testFailApproveFromZeroAddress() external {
        vm.prank(address(0));
        token.approve(alice, value);
    }

    function testFailTransferToZeroAddress() external {
        testMint();
        vm.prank(alice);
        token.transfer(address(0), value);
    }

    function testFailTransferFromZeroAddress() external {
        testBurn();
        vm.prank(address(0));
        token.transfer(alice , value);
    }

    function testFailTransferInsufficientBalance() external {
        testMint();
        vm.prank(alice);
        token.transfer(bob , value + 1);
    }

    function testFailTransferFromInsufficientApprove() external {
        testMint();
        vm.prank(alice);
        token.approve(address(this), value - 1);
        token.transferFrom(alice, bob, value);
    }

    function testFailTransferFromInsufficientBalance() external {
        testMint();
        vm.prank(alice);
        token.approve(address(this), type(uint).max);

        token.transferFrom(alice, bob, value + 1);
    }
   
}   