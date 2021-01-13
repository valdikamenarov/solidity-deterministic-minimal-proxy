# Minimal Proxy with Deterministic addresses

These Smart Contracts leverage the Minimal Proxy Design [EIP-1167](https://eips.ethereum.org/EIPS/eip-1167) and the CREATE2 [EIP-1014](https://eips.ethereum.org/EIPS/eip-1014) opcode which allows us to calculate a proxy address before deploying it.

This gives us the ability to provide a contract address to a user and only deploy the underlying contract when he starts interaction with it. (e.g. deploy a wallet when money has been added to it).

### NOTE! This code has not been tested/audited and is not suitable for production.
