// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {Web3Verse} from "../src/Web3Verse.sol";

contract DeployWeb3Verse is Script {
    function run() external returns (Web3Verse) {
        vm.startBroadcast();
        Web3Verse web3Verse = new Web3Verse();
        vm.stopBroadcast();
        return web3Verse;
    }
}
