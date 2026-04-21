---
description: >
  Applies the news selection criteria for the WEB Frontend Engineer Meetup (WEBフロントエンドエンジニア集会) monthly slides.
  Use this skill when deciding which frontend news items to include or exclude for the meetup — it defines the target audience profile, selection philosophy, date-validity rules, and integrity constraints.
  Do NOT use this skill for formatting or structuring slide content; that is handled by fe-meetup-slide-structure.
---

# fe-meetup News Selection

## Target Audience Profile

- Students / beginners — no prior language knowledge
- Backend engineers — assigned to frontend with no context
- Tech leads / experts — deep domain knowledge

**Goal**: content must be accessible to beginners yet interesting to experts.

## Selection Philosophy

| Category | Description | Example |
|---|---|---|
| Impact / utility | Governance changes, default changes, industry shifts | Node.js release cycle overhaul |
| Surprise / demo | Strong "wow" factor tech demos | Minecraft in pure CSS |
| Nostalgia / community | Legacy tech moving forward, community excitement | jQuery major update |

## Exclusion Rules

- Simple bug fixes with no technical impact and no emotional or community value
- Framework version bumps with no context or broader significance
- AI-only news (unless clearly tied to frontend)

## Date Validation (required)

- Target range: approximately one month before the meetup date (3rd Tuesday of the month)
- Verify dates against official release notes or changelogs — do not rely solely on blog post publication dates
- Exclude "delayed buzz" about releases older than 3 months, unless a significant new milestone has occurred

## Integrity Rule

If no suitable news is found, do not force it. Reducing the number of sections is acceptable. "No news" is better than "incorrect or outdated news".
