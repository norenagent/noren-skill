# MCP tools

Hosted, read-only, no credentials: `https://mcp.usenoren.xyz/mcp` (Streamable HTTP, 60 requests per minute per address).

Local, with payments: `npx -y noren-mcp` (stdio). Payments stay off until `NOREN_PAYER_KEY` and both caps are set.

| Tool | Hosted | What it returns |
| --- | --- | --- |
| `noren_gateway_stats` | yes | Paid APIs, 402 challenges, settled payments |
| `noren_list_apis` | yes | Pay-per-call APIs with slug, path and price in USDG |
| `noren_reputation` | yes | Score and tier of a wallet, from settled payments only, with the transactions behind it |
| `noren_leaderboard` | yes | Top paying wallets |
| `noren_verify_payment` | yes | The USDG transfers in a transaction, read from the chain RPC |
| `noren_pay_call` | no, local only | Calls one paid API and pays for it |

## Reading a reputation result

The score only counts payments that settled through the Noren gateway. A wallet that never used it has no score. That is unproven, not bad. Some early payments come from Noren's own test wallets, so say that when it matters.
