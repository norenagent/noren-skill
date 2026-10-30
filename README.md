# noren-skill

Source for the `noren` agent skill: instructions that teach a coding agent which Noren capabilities exist today (sandboxed code execution, pay-per-call APIs with x402 on Robinhood Chain, wallet records, a policy gate for trades, verifiable receipts) and which claims it must not make.

Format: the [Agent Skills](https://github.com/vercel-labs/skills) layout.

## Layout

```
skill/
  SKILL.md          Frontmatter + decision tree
  references/       Topic references the agent loads on demand
install.sh          Local install into <project>/.claude/skills/noren
tests/list.sh       Smoke test: the skill and its references are well formed
LICENSE             Apache-2.0
NOTICE.md           Origin
```

## Install

```bash
./install.sh --project /path/to/your/project
```

The script copies the local `skill/` folder. It never runs remote code and never asks for secrets.

## Origin

Derived from `open-covenant/covenant-skill` (Apache-2.0); see [NOTICE.md](./NOTICE.md). The content was rewritten for Noren because the original was specific to another chain.

## License

Apache-2.0, see [LICENSE](LICENSE).
