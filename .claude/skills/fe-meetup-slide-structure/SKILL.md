---
description: >
  Defines the Marp slide structure and content composition rules for the WEB Frontend Engineer Meetup (WEBフロントエンドエンジニア集会) monthly slides.
  Use this skill when composing or editing slide content — it covers title naming, per-item slide sequence, logo usage, section heading rules, and December year-in-review format.
  Do NOT use this skill for deciding which news items to include; that is handled by fe-meetup-news-selection.
---

# fe-meetup Slide Structure

## File Header

```markdown
---
marp: true
theme: fe-meetup
paginate: true
---

# 今月のフロントエンド

フロントエンド エンジニア集会 YYYY 年 M 月

---

## "今月のフロントエンド" とは

今月あったフロントエンドのニュースを, 以下のフォーマットで紹介します.

- ニュースがあった技術について, その名前かキーワード
- その技術に関する解説 (3 行目安)
- 何があったかを解説

---

## 取り上げないもの

- 特定フレームワークに関するバージョンアップ (例外あり)
- AI 単品のニュース
```

## Per-item Slide Sequence

```markdown
## [Name]

YYYY/MM/DD

![bg 15%](./_assets/logos/xxx.png)

---

## "[Name]" とは

- line 1
- line 2
- line 3

---

## [Name] のニュース

**headline (what happened)**

- point 1
- point 2
- point 3

<!-- _footer: "出典: [Article title](URL)" -->

---

## detail / background slides (optional, repeatable)
```

## Self-Containment Rule

**Never write in a way that requires having attended a past meetup to understand.** Each month's deck must be fully understandable on its own.

**Follow-up news (続報) is a valid and welcome pattern.** Structure it as dedicated slides in chronological order — first the background ("過去に何が起きていたか"), then the current news ("今回何があったか"). See the polyfill.io incident follow-up (202606) for the canonical example. Because the background slide retells the story, no past attendance is required.

- ✅ Background slide before the news slide for follow-ups
- ✅ Corrections that restate both the old claim and the fix:
  "5 月号では「ES2026 に正式採用」と紹介していました. 実際は ES2027 送りです. 訂正します"
- ✅ References to public events ("6 月に予告されていた通り") — these point at the news, not at a past meetup
- ❌ Past-issue references as the *only* context: "先月号で紹介した〜の続報" with no retelling
- ❌ Doing any of this in the opening とは 3 lines — that slide is only for describing the technology (see below)

### とは Slide Rules

**Why 3 lines**: the meetup audience includes non-frontend engineers and complete beginners, so every technology needs an explanation — but explanation time is a budget, and spending more of it means the deck never finishes. 3 lines is the deliberate sweet spot: just enough for someone with no frontend background to follow the news that comes next, short enough to keep the pace. Do not expand beyond 3 lines, and do not skip the slide because "everyone knows this".

The 3 lines describe **only what the technology is** — nothing else.

- ✅ Descriptive facts about the technology itself
- ✅ Chronology / history of the technology is fine
  ("当初 Facebook が開発, 現在は React Foundation が権利を持つ",
  "コンパイラは長らく TS 自身で実装されてきた")
- ❌ This slide series' own continuity ("先月号で〜") — that belongs in the ニュース slide or detail slides, phrased self-contained per the rule above

## Section Title Rules

The `##` on a title slide is **the name only by default** — `## Tailwind CSS` ✅, `## Tailwind CSS News` ❌

**Exception — when a non-tech name has stronger pull than the technology name:**

The section title signals "why this matters" before the slide is even opened. In the cases below, use a more recognizable or impactful name instead of the underlying tech name.

| Pattern | Criterion | Example |
|---|---|---|
| Tech demo / fun | The subject name creates more "wait, what?" than the tech name | Implemented in CSS/HTML → `## Minecraft`, `## SuperMario` |
| Unexpected industry crossover | The company or domain name conveys context better than the tech name | Game engine announcement → `## Toyota` |
| Regulation / external impact | The regulating body's name directly signals the frontend impact | UI warning obligation → `## ニューヨーク州` |

**The title → とは → ニュース sequence is always maintained without exception.** This means slides like `## "ニューヨーク州" とは` will appear and may seem unnecessary — this is intentional. It is a tongue-in-cheek consequence of strictly following the format, and should be embraced as such.

**Library + framework pairs** (e.g. React & Next.js): create separate とは slides for each before the combined news slide:
1. `## "React" とは`
2. `## "Next.js" とは`
3. `## React / Next.js のニュース`

## CSS / Styling News Rule

Any CSS or style-related update MUST include cross-browser compatibility information:

- Which engines ship it and which don't (Chrome/Edge, Safari, Firefox) — a small table works well
- What happens in non-supporting browsers: does it degrade gracefully (progressive enhancement viable) or break functionality (fallback needed)?

The audience decides whether they can use a feature based on this — a CSS feature announcement without compat info is incomplete.

## Logos

Only use logos available in `src/fe-meetup/_assets/logos/`. Omit the logo line if no logo exists for the technology.

```
Firefox.png  astro.svg  css.png  ecmascript.png  googlechrome.png
html5.svg  javascript.png  nextjs.svg  nginx.png  nodejs.png
npm.png  react.png  remix.png  safari.png  tailwindcss.svg
typescript.png  vite.png  voidzero.png  vscode.png
```

## Output

`src/fe-meetup/YYYYMM.md`

## December Special (Year in Review)

- Cover all themes equally (governance / HTML+CSS / security / etc.)
- Focus on industry-wide shifts and trends rather than individual library updates
- Cite historical events with accurate dates and context
