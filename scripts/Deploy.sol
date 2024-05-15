// SPDX-License-Identifier: BSD-3-Clause-Clear
pragma solidity ^0.8.4;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {Coordinator} from "../src/Coordinator.sol";

/// @title Deploy
/// @notice Deploys EIP712Coordinator to destination chain defined in environment
contract Deploy is Script {
    function run() public {
        // Setup wallet
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // Log address
        address deployerAddress = vm.addr(deployerPrivateKey);
        console.log("Loaded deployer: ", deployerAddress);

        // Create Coordinator
        Coordinator coordinator = new Coordinator();
        console.log("Deployed Coordinator: ", address(coordinator));

        // Execute
        vm.stopBroadcast();
    }
}
