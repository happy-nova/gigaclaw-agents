# GigaClaw Agents

Shared OpenClaw instance for team AI assistants. Agents are provisioned via [gigaclaw-dash](https://github.com/happy-nova/gigaclaw-dash).

## Architecture

```
┌──────────────────┐     ┌──────────────────┐
│  GigaClaw Dash   │────▶│  GigaClaw Agents │
│    (Vercel)      │     │    (Railway)     │
└──────────────────┘     └──────────────────┘
    config.patch              OpenClaw
```

## Deployment

### Railway

1. Create new project from this repo
2. Set environment variables:
   - `ANTHROPIC_API_KEY` — Claude API key
   - `OPENCLAW_TOKEN` — Gateway auth token (generate a secure random string)
   - `SLACK_SIGNING_SECRET` — (optional) for Slack event verification
3. Deploy

### Environment Variables

| Variable | Required | Description |
|----------|----------|-------------|
| `ANTHROPIC_API_KEY` | Yes | Anthropic API key for Claude |
| `OPENCLAW_TOKEN` | Yes | Gateway authentication token |
| `OPENAI_API_KEY` | No | OpenAI API key (for GPT models) |

## Agent Workspaces

Each agent gets a workspace at `/app/workspaces/{agentId}/` with:
- `SOUL.md` — Agent personality and instructions
- `MEMORY.md` — Long-term memory
- `memory/` — Daily notes

## Configuration

The `openclaw.json` is modified via `config.patch` when new agents are onboarded through the dashboard.

## License

MIT
