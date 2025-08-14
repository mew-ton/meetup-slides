---
marp: true
theme: fe-meetup
paginate: true
---

# デカすぎコンポーネント分割術

tech-dojo 20250815

---

## コンポーネントはなぜ太る ?

### パターン 1: パーツ追加型

コンポーネントを構成するパーツが増えれば、コンポーネントも肥大化する

```html
<section class="dashboard-grid">
  <FooGraph />
  <BarGraph />
  <BazGraph />
  <QuxGraph />
  <QuuxGraph />
  <QuuuxGraph />
  <!-- ... 死ぬほど並んでいる ... -->
```

---

## コンポーネントはなぜ太る ?

### パターン 2: 見た目の共通化 (**今回の対象**)

「見た目が同じだから」で共通化した結果,
ドメインごとの呼び出し方の違いで内部にロジックが蓄積

ページのエントリーポイントとなるコンポーネントでは顕著に起こる

---

## 見た目共通化型の典型例

1 見た目が共通のコンポーネントを作る

```html
// 最初：シンプルな一覧コンポーネント
<DataTable data={users} />
```

---

## 見た目共通化型の典型例

2 ドメインごとに異なる見た目を実装したくなる

```html
// ユーザー管理画面から呼び出す
<DataTable data={users} type="user" />

// それ以外から呼び出す
<DataTable data={products} />
```

---

## 見た目共通化型の典型例

3 ドメインロジックがどんどん増えていく

```html
// ユーザー管理画面から呼び出す
<DataTable data={users} type="user" />

// 商品管理画面から呼び出す
<DataTable data={products} type="product" productType="food" />
<DataTable data={products} type="product" productType="drink" />

// 注文管理画面から呼び出す
<DataTable data={orders} type="order" />

// ....
```

---

## 見た目共通化型の典型例

4 内部の分岐が複雑で手を入れたくなくなる

```ts
if (type === 'user') {
  // ユーザー固有の処理
} else if (type === 'product' && productType === 'food') {
  // 食べ物固有の処理
} else if (type === 'product' && productType === 'drink') {
  // 飲み物固有の処理
} else if (type === 'order') {
  // 注文固有の処理
} else if (/* .... */) {
  // ....
```

---

## ページコンポーネントの場合

props ではなく、
そのページの遷移元や Query Params で切り分けをしようとする

```ts
// ユーザー管理画面から遷移する
transitionTo('/dashboard?mode=user')

// 商品管理画面から遷移する
transitionTo('/dashboard?mode=product')

// 注文管理画面から遷移する
transitionTo('/dashboard?mode=order')

// ....
```

---

## 見た目共通化型の構造的問題

### 内部での複雑化

- ドメインロジックの混在（ユーザー・商品・注文...）
- 条件分岐の増大（type別、mode別処理）
- props の肥大化

---

## 見た目共通化型の構造的問題

### 保守性の悪化

- **変更影響の予測困難**：1つの修正が他ドメインに影響
- **テストの複雑化**：全パターンの組み合わせテストが必要
- **並行開発の困難**：複数チームが同じファイルを触る競合

---

## 教訓

- "見た目が同じ" は, 共通化をする理由にならない
- "共通化" にドメインロジックを含んではならない
- Query Params は基本的には引数 (props) ではない

---

## 分解の手順

### Step 1: 複製する

呼び出し元のコンテキストぶんだけコンポーネントを複製する

```html
<DataTable data={users} type="user" />
<DataTable data={products} type="product" productType="food" />
<DataTable data={products} type="product" productType="drink" />
<DataTable data={orders} type="order" />
```

**UserTable, ProductTable, OrderTable にする**
もしくは ProductFoodTable, ProductDrinkTable が必要かも ?

---

## 分解の手順

### Step 1: 複製する (ページの場合)

遷移元のコンテキストぶんだけページを複製する

```html
transitionTo('/dashboard?mode=user')
transitionTo('/dashboard?mode=product&productType=food')
transitionTo('/dashboard?mode=product&productType=drink')
transitionTo('/dashboard?mode=order')
```

**dashboard/user, dashboard/product, dashboard/order にする**
もしくは dashboard/product/food, dashboard/product/drink が必要かも ?

---

## 分解の手順

### Step 1: 複製する (要点)

- 呼び出し元/遷移元は正しいコンテキストのコンポーネントに切り替える
- 実装は **元のコンポーネントを複製しただけ** にする
- テストコードもあれば複製して, この時点ですべて通過させる

```html
<!-- ちょっと気持ち悪いけど, まずはここまで -->
<UserTable data={users} type="user" />
<ProductTable data={products} type="product" productType="food" />
<ProductTable data={products} type="product" productType="drink" />
<OrderTable data={orders} type="order" />
```

---

## 分解の手順

### Step 2: デッドコード削除

- いらない Props を消す
- 到達しない ドメインロジックを消す
- 不要な DOM を消す
- **テストコードは手を入れない**

---

## 分解の手順

### Step 2: デッドコード削除 (テストコードの扱い)

- ドメインロジックを消すと落ちるテスト, 落ちないテストが適切かどうか? を確認する
- 残したロジックに関するテストは **そのまま通過していること** を確認する
- 最後にテストコードを修正する

---

## 勘所 (作業中に意識すること)

- どこを複製の起点にするか? をよく観察する
  - 場合によっては, ページとコンポーネントをまとめて複製が必要になる場合もあるかも ...
- ステップをちゃんと意識する
  - まず複製しただけの段階で動く状態にする
  - Step2 の作業は **コンテキストごとに** 行う
- テストコードの失敗状況は, ただしくデッドコードを削除できているかどうかの指標として捉える

---

## まとめ

### 教訓

- "見た目が同じ" は, 共通化をする理由にならない
- "共通化" にドメインロジックを含んではならない
- Query Params は基本的には引数 (props) ではない

---

## まとめ

### 分解の手順

1. 必要数だけ複製する
2. 呼び出し元を適切に振り分ける
3. デッドコードを消す
