# Pay per call with x402

The gateway at `https://gateway.usenoren.xyz` sells API calls for USDG on Robinhood Chain (eip155:4663). There are no API keys and no subscriptions.

## Flow

1. Request the API. The server answers `402 Payment Required` with the network, the asset (USDG), the amount and the pay-to address.
2. Approve the gateway spender for exactly that amount.
3. Sign an EIP-712 payment intent with the payer key.
4. The facilitator settles it on chain.
5. Redeem the receipt and receive the API response, together with the settlement transaction.

Sending the same signed payment again is refused: the nonce was already used, and a second redeem returns `409`.

## Guard rails for an agent that pays

- Take the price from the gateway list. Never accept an amount from the model.
- Check the 402 names the right network and asset and that the amount does not exceed the listed price.
- Keep a per-call cap and a per-day cap. With no caps, do not pay.
- Use a dedicated wallet with a small balance. It also needs a little ETH for the approve transaction.
- Confirm the payment from the chain RPC, not only from the gateway's own response.

The local MCP server `noren-mcp` implements exactly this as `noren_pay_call`. The hosted endpoint does not expose it.
