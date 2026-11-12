# Worked examples

## Topic turned into an audience

**User:** "Research the meal kit market for me."

That's a topic. Ask one question:

> Who do you want to reach: people who already buy meal kits, busy parents who cook at home, or something else?

**User:** "Busy parents in Canada who cook most nights."

```
create_report(
  prompt="parents of young children who cook dinner at home most nights and are short on time",
  location="ca"
)
```

## Finer geography

**User:** "Where do climbers in Colorado hang out online?"

```
create_report(
  prompt="rock climbers and boulderers who live in Colorado",
  location="us"
)
```

After it's ready: "Your Colorado climbers report is ready. I can look at the websites they visit, the podcasts and YouTube channels they follow, or the subreddits they use. Where should I start?"

## Reusing a report

**User:** "What podcasts do my climbers listen to?"

Call `list_reports`, find the existing climbers report, and go straight to `get_podcasts`. Don't create a new report.
