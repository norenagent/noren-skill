---
name: noren
description: Use when an AI agent must run code in an isolated sandbox, pay for an API per call with x402 on Robinhood Chain, check a wallet's settled-payment record, or put a policy gate in front of a trade, with receipts anyone can verify.
license: Apache-2.0
metadata:
  author: noren
  version: 0.1.0
---

# noren

Noren is an operating layer that agents can be held to. This skill teaches a coding agent which Noren pieces exist today, how to call them, and which claims it must not make.

Everything described here is live and was checked against the running service. If a capability is not in this file, assume it does not exist yet.

## When to use

Reach for this skill when one of these holds:

1. The agent must run untrusted or generated code and the operator wants hard limits, not a promise.
2. The agent must pay for an API call and should not hold an API key or a subscription.
3. The agent is about to pay, delegate to, or trust a wallet and needs evidence of its record.
4. The agent places orders and a policy (caps, allow list, approval line) must be enforced before the order leaves.

## Decision tree

- Running code: use the sandbox, see [noren-sandbox](references/noren-sandbox.md).
- Paying for an API: x402 on Robinhood Chain, see [noren-x402](references/noren-x402.md).
- Checking a counterparty or a claimed payment: the read-only MCP tools, see [noren-mcp-tools](references/noren-mcp-tools.md).
- Gating a trade: see [noren-trading-gate](references/noren-trading-gate.md).
- Proving what an agent did: see [noren-audit](references/noren-audit.md).

## Rules the agent must follow

- Never ask the user for a private key or seed phrase. Payments use a dedicated wallet the user configures, with caps.
- Never invent a score, a tier, a hash or a transaction. If a tool returns no data, say so.
- Treat a wallet with no record as unproven, not as safe and not as bad.
- Do not describe GPU rental, staking or on-chain escrow as available. They are not live.
- Money moves only through a call the user has authorised, up to a cap the user has set.

## Where things are

- Site: https://usenoren.xyz
- Sandbox: https://sandbox.usenoren.xyz
- Gateway: https://gateway.usenoren.xyz
- MCP: https://mcp.usenoren.xyz/mcp (read-only), or `npx -y noren-mcp` locally
- Chain: Robinhood Chain, eip155:4663, USDG
