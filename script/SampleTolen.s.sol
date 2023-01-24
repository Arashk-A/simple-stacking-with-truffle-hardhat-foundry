// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

import "forge-std/Script.sol";

import {SampleToken} from "src/SampleToken.sol";
import {StakingToken} from "src/StakingToken.sol";


contract SampleTokenScript is Script {
    SampleToken token;
    StakingToken staking;

    function setUp() public {}

    function run() public {
        vm.broadcast();
        token = new SampleToken("SampleToken", "TOK", 100 ether);
        staking = new StakingToken("StakingToken", "STA", address(token));

        token.grantRole(token.MINTERROLE(), address(staking));
        token.grantRole(token.BURNERROLE(), address(staking));
        
    }
}
