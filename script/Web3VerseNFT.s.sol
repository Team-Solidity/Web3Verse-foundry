// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {Web3VerseNFT} from "../src/Web3VerseNFT.sol";

contract DeployWeb3VerseNFT is Script {
    function run() external returns (Web3VerseNFT) {
        vm.startBroadcast();
        Web3VerseNFT web3VerseNFT = new Web3VerseNFT();
        vm.stopBroadcast();
        return web3VerseNFT;
    }
}
