// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.10;

import "../../access/MPCManageable.sol";

interface IAnycallProxy {
    function exec(
        address token,
        uint256 amount,
        bytes calldata data
    ) external returns (bool success, bytes memory result);
}

struct SwapInfo {
    bytes32 swapoutID;
    address token;
    address receiver;
    uint256 amount;
    uint256 fromChainID;
}

interface IRetrySwapinAndExec {
    function retrySwapinAndExec(
        string calldata swapID,
        SwapInfo calldata swapInfo,
        address anycallProxy,
        bytes calldata data,
        bool dontExec
    ) external;
}

interface IUnderlying {
    function underlying() external view returns (address);
}

abstract contract AnycallProxyBase is MPCManageable, IAnycallProxy {
    mapping(address => bool) public supportedCaller;

    modifier onlyAuth() {
        require(supportedCaller[msg.sender], "AnycallProxyBase: only auth");
        _;
    }

    constructor(address mpc_, address caller_) MPCManageable(mpc_) {
        supportedCaller[caller_] = true;
    }

    function addSupportedCaller(address caller) external onlyMPC {
        supportedCaller[caller] = true;
    }

    function removeSupportedCaller(address caller) external onlyMPC {
        supportedCaller[caller] = false;
    }
}
