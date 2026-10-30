# Trading gate

A policy the operator writes is enforced before an order leaves. Every decision, placed or refused, becomes a signed receipt.

```json
{
  "venue": "robinhood-crypto",
  "mode": "dry_run",
  "caps": { "per_order_usd": 500, "daily_notional_usd": 2000 },
  "risk": { "daily_loss_stop_usd": 300 },
  "universe": { "allow": ["BTC-USD", "ETH-USD"], "sides": ["buy"] },
  "order_types": ["market"],
  "rate": { "max_orders_per_min": 10 },
  "approvals": { "require_human_over_usd": 400 }
}
```

## What was shown, with a mock broker and no credentials

Four orders went to the gate. One (about $60) passed as a dry run and nothing was sent. Three were refused: one over the per-order cap (1,200 against 500), one for a symbol not on the allow list (DOGE-USD), and one over the approval line that needed a human. Each refusal carries its reason and a receipt whose signature verified.

## Limits to state

- This ran as a dry run against a mock broker. No order was placed and no account was touched.
- Noren is infrastructure the operator runs. It is not a broker, adviser or custodian and never holds funds.
- Anchoring decisions on chain is not live yet.
