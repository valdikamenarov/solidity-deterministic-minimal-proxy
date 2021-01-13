// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Create2.sol";

/**
 * @dev Proxy Factory leveraging the Minimal Proxy Pattern(EIP-1167) with a 
 * Deterministic Proxy address creation (EIP-1014).
 *
 * See the https://eips.ethereum.org/EIPS/eip-1014#motivation[EIP] for more
 * information.
 */
contract ProxyFactory {

    address proxyImplAddr;


    event ProxyCreated(address indexed proxy);

    constructor(address _proxyImplAddr) public {
        proxyImplAddr = _proxyImplAddr;
    }

    function computeAddress(uint256 salt) public view returns(address) {
        return Create2.computeAddress(
                    keccak256(abi.encodePacked(salt)),
                    keccak256(getBytecode())
                );
    }
    
    function createProxy(uint256 salt) public returns(address result) {
        emit ProxyCreated(proxy);
        return Create2.deploy(
                0,
                keccak256(abi.encodePacked(salt)),
                getBytecode()
            );
    }

    function getBytecode() public view returns (bytes memory) {
        bytes10 creation = 0x3d602d80600a3d3981f3;
        bytes10 runtimePrefix = 0x363d3d373d3d3d363d73;
        bytes20 targetBytes = bytes20(proxyImplAddr);
        bytes15 runtimeSuffix = 0x5af43d82803e903d91602b57fd5bf3;
        return abi.encodePacked(creation, runtimePrefix, targetBytes, runtimeSuffix);
    }
}

