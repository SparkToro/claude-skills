# SparkToro skills for Claude

Official skills that let Claude do audience research with SparkToro data: where any audience spends time online, and which websites, podcasts, YouTube channels, subreddits and social accounts they follow.

You need a SparkToro account. The plugin connects to SparkToro for you and asks you to sign in the first time it's used.

## Install

### Claude Code

```
/plugin marketplace add SparkToro/claude-skills
/plugin install sparktoro@sparktoro
```

Then ask something like "Where do B2B SaaS founders hang out online?" or run `/sparktoro:audience indie game developers`.

To get updates: `/plugin marketplace update sparktoro`

### Claude.ai and Claude Desktop

1. Connect SparkToro: https://sparktoro.com/mcp
2. Download the skill zips from the [latest release](https://github.com/SparkToro/claude-skills/releases/latest).
3. In Claude, go to **Settings > Capabilities > Skills** and upload each zip.

Uploaded skills don't update on their own. Download and upload again when a new release comes out.

### For teams

Add this to your project's `.claude/settings.json` so everyone who opens the project is offered the plugin:

```json
{
  "extraKnownMarketplaces": {
    "sparktoro": { "source": { "source": "github", "repo": "SparkToro/claude-skills" } }
  },
  "enabledPlugins": { "sparktoro@sparktoro": true }
}
```

## What's included

| Skill | What it does |
|---|---|
| `audience-research` | Builds a SparkToro report for an audience and digs into where they spend time online |

## Support

support@sparktoro.com

---

## Maintainers

### Layout

```
.claude-plugin/marketplace.json     catalog of plugins
plugins/sparktoro/
  .claude-plugin/plugin.json        plugin metadata and version
  .mcp.json                         SparkToro connector
  skills/<name>/SKILL.md            one folder per skill
  commands/<name>.md                slash commands
scripts/                            zip build + version check
```

### Adding a skill

1. Create `plugins/sparktoro/skills/<name>/SKILL.md` with `name` and `description` frontmatter.
2. Test locally (below).
3. Add it to the table above.

### Testing locally

```
claude plugin validate .
```

In Claude Code: `/plugin marketplace add ./path/to/claude-skills`, then `/plugin install sparktoro@sparktoro`.

### Releasing

1. Bump `version` in **both** `.claude-plugin/marketplace.json` and `plugins/sparktoro/.claude-plugin/plugin.json`. Claude Code only pulls changes when the version changes.
2. Merge to `master`.
3. Tag and push: `git tag v0.2.0 && git push origin v0.2.0`. The Release workflow checks the versions match the tag and attaches one zip per skill.

This repo is public. Never put API keys, customer data or internal notes in it.
