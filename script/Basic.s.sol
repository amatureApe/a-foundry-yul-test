// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Script, console2} from "forge-std/Script.sol";
import "deploy-yul/YulDeployer.sol";

contract BasicDeployScript is Script {
    YulDeployer yulDeployer = new YulDeployer();

    function setUp() public {}

    function run() public {
        yulDeployer.deployContract("Basic");
        vm.broadcast();
    }
}
