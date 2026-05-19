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
