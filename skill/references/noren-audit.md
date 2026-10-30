# Audit receipts

Each decision or action is recorded as a receipt signed with ed25519 over a canonical hash. Each receipt includes the hash of the one before it, so the records form a chain.

- Anyone can re-verify a receipt.
- Change one field and verification fails.
- Refusals are recorded as well as successes.

## What the agent should say

Say that the chain makes tampering detectable. Do not say it makes an agent trustworthy. It shows what was done, not whether it was wise.

Anchoring the chain on Robinhood Chain is not live yet.
