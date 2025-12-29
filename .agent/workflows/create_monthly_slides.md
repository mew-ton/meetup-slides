---
description: Create "This Month's Frontend" slides for the meetup
---

# Create "This Month's Frontend" Slides

This workflow describes the process for creating the monthly frontend news slides for the "WEB Frontend Engineer Meetup" (WEBフロントエンドエンジニア集会).

## 1. Context & Principles

- **Schedule**: 3rd Tuesday of every month. News range: ~1 month ending near the meetup date (do not drift too far back).
- **Audience**: Extremely broad mix.
    - **Students/Beginners**: No prior language knowledge.
    - **Backend Devs**: Forced into frontend, no context.
    - **Tech Leads/Experts**: Deep knowledge.
    - **Goal**: Content must be accessible to beginners yet interesting to experts.
- **Selection Philosophy**:
    - **Impact & Utility**: Governance changes, Industry shifts.
    - **Surprise & Fun**: "Minecraft in Pure CSS" (Tech demos that wow).
    - **Nostalgia & Impact**: "jQuery Major Update" (Old tech moving forward).
    - **Anti-patterns**: 
        - Dry framework version updates *without* broader context or impact.
        - Abstract concepts without concrete examples.

## 2. Strict Format

Each news item MUST follow this Marp markdown structure:

1. **Title Slide**:
    - `## [Specific Tool/Service Name]` (MUST be a concrete name).
    - Date (YYYY/MM/DD).
    - Logo (if available).
    - **Rule**: If a library and framework are paired (e.g., **React & Next.js**), create **separate explanation slides** for each before combined news.
        - Slide 1: `## React とは？`
        - Slide 2: `## Next.js とは？`
        - Slide 3: `## React / Next.js のニュース`
2. **"What is [Name]?"**:
    - 3-line basic explanation of the technology.
3. **"News about [Name]"**:
    - Top line: Specific event/release from this month.
    - Bullets: Summary of the news.
4. **"Details/Background"** (Flexible / Multiple Slides):
    - Technical deep dive, code examples, or educational context (e.g., "Why is this important?", "Attack Vector details").
    - Can be multiple slides.
    - **Source**: Include footer with source link (`<!-- _footer: "出典: [Title](URL)" -->`) on the last slide or where appropriate.
    - **Note**: If multiple related news items exist for the same tech (e.g., two security incidents), you can chain them or group them under the same main header.

## 3. Workflow Steps

### Stage 1: Search & Convert
Search for news (Range: 1 month prior to meetup) and convert promising items.

### Stage 2: Selection (Strict Criteria)
- **Broad Appeal**: Include topics relevant to WordPress/Static site devs (HTML, CSS, CMS), not just JS experts.
- **Criteria**:
    - **Impact**: Governance, Defaults changing.
    - **Surprise/Demo**: "Wow" factor (e.g., "Minecraft in Pure CSS").
    - **Emotional/Nostalgic**: Major updates to legacy tech (e.g., jQuery) are ACCEPTABLE even if "simple", provided they have community impact/story.
- **Exclusion Rule**: Do NOT strictly exclude "Simple Updates". Only exclude updates that lack *both* technical impact *and* emotional/community value (e.g., minor bugfixes).
- **Date Check** (CRITICAL): Verify the news is actually within the target range.
    - Check official release notes or changelogs, not just blog post dates.
    - Exclude "delayed buzz" about features released >3 months ago unless there is a specific new major milestone.
- **Integrity Rule**: If no news fits the criteria, **DO NOT force it**.
    - "No news" is better than "incorrect/outdated news".
    - It is acceptable to reduce the number of sections if strictly valid topics are unavailable.

### Stage 3: Generate Slides
- Create `src/fe-meetup/YYYYMM.md`.
- Theme: `fe-meetup`.

## 4. Year in Review (December Special)
- **Balance**: Treat all themes equally (e.g., Governance, HTML/CSS, Security). Do not label one as "Biggest News".
- **Trends over Features**: 
    - Focus on broader industry shifts rather than individual library updates.
    - **Examples (from 2025)**:
        - "OSS Governance Revolution" (Foundation models).
        - "Infrastructure Renewal" (Shift to Native: tsgo, Rolldown, Remix "De-React").
        - "Return to HTML/CSS" (No Build, Browser Gap, Web Components in Design Systems).
        - "Supply Chain Security" (Continuous threats, not just one-off events).
- **Accuracy**: Ensure historical events (e.g. polyfill.io 2024) are cited with correct dates/context.
