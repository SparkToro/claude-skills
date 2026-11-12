---
name: audience-research
description: Research any audience with SparkToro data. Use when the user wants to know where a group of people spends time online, which websites, podcasts, YouTube channels, subreddits or social accounts they follow, their demographics, or how big the audience is. Triggers include "who is my audience", "where does my audience hang out", "what podcasts do X listen to", "find influencers for", "audience research", or any mention of SparkToro.
---

# SparkToro audience research

Answer audience questions with real SparkToro data from the SparkToro connector, not from general knowledge.

## Before you start

The SparkToro tools (`create_report`, `get_report_status`, `get_websites` and so on) come from the SparkToro connector. If they aren't available, tell the user to connect SparkToro (https://sparktoro.com/mcp) and stop. Don't invent audience data.

## Workflow

### 1. Turn the request into an audience of people

SparkToro audiences describe **people**, not topics.

- Good: "B2B SaaS founders", "people who visit moz.com", "home bakers who sell at farmers markets"
- Not good: "SaaS marketing", "baking"

If the user gives you a topic, ask one clarifying question to turn it into people. Put demographics, profession, interests and brand affinities in the prompt itself. More specific prompts give better audiences.

### 2. Set the location

`location` only accepts country codes (`us`, `ca`, `uk`). For a state, region or city, keep the country code and put the place in the prompt, for example `location="us"` and `prompt="male golfers aged 30-50 in Washington state"`.

### 3. Check for an existing report first

Call `list_reports` before creating anything. If a matching report exists, reuse it, since every new report uses the user's quota. Check `get_quota` when the user may be close to their limit.

### 4. Create the report and wait

1. Call `create_report`. It returns right away with status `processing`.
2. Poll `get_report_status` every 5 to 10 seconds until the status is `ready`.
3. Don't call section tools before it's ready.

### 5. Ask what they want to know

Once the report is ready, don't fetch every section. Tell the user it's ready and offer a few directions that fit their goal:

| Goal | Tools |
|---|---|
| Who they are | `get_demographics`, `get_bio_keywords`, `get_tam` |
| Where to advertise or pitch | `get_websites`, `get_website_categories`, `get_press` |
| Who to partner with | `get_social`, `get_youtube`, `get_podcasts` |
| Communities to join | `get_reddit` |
| What they search and ask | `get_search_keywords`, `get_prompts` |
| What they use and buy | `get_brands`, `get_apps` |

### 6. Make it useful

- Lead with the 3 to 5 findings that matter for the user's goal, then the supporting data.
- Separate high-affinity picks (niche, very specific to this audience) from high-reach picks (big, less targeted). Most users want the niche ones.
- End with concrete next steps such as outreach targets, ad placements or content topics.
- Show audience data as SparkToro reports it. Don't add follower counts or traffic numbers from memory.

See `references/examples.md` for worked examples.
