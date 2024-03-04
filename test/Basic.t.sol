// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import "deploy-yul/YulDeployer.sol";

contract BasicTest is Test {
    YulDeployer yulDeployer = new YulDeployer();
    address public basic;

    function setUp() public {
        basic = yulDeployer.deployContract("Basic");
    }

    function test_Basic() public {
        {
            (bool success, bytes memory data) = basic.staticcall("");
            assertTrue(success, "call failed");
            assertEq(abi.decode(data, (uint256)), 0, "wrong return value");
        }
        {
            (bool success, bytes memory data) = basic.call("dummy");
            assertTrue(success, "call failed");
        }
        {
            (bool success, bytes memory data) = basic.staticcall("");
            assertTrue(success, "call failed");
            assertEq(abi.decode(data, (uint256)), 1, "wrong return value");
        }
    }
}
