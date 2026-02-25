# プロジェクト指示

## このプロジェクトについて

これは「{{原作タイトル}}」の二次創作小説「{{作品タイトル}}」の執筆プロジェクトです。

## 原作情報

- 原作：{{原作タイトル}}（{{原作者}}）
- 分岐タイプ：{{続編 / IF / パラレル / 補完}}（詳細は `backbone/divergence.md`）

## 執筆ルール

- 文体：{{三人称一元視点 / 一人称 / 三人称多元視点 など}}
- 時制：{{過去形 / 現在形}}
- トーン：{{ライトノベル寄り / 文芸寄り / ダーク / コミカル など}}
- 一章あたりの目安：{{4000〜6000字}}

## ファイル構成

| ディレクトリ | 内容 |
|-------------|------|
| `references/` | 原作の公式設定（再利用用データ） |
| `synopsis/` | 今作のあらすじ・プロット |
| `characters/` | 今作でのキャラクター設定（独自解釈・オリキャラ含む） |
| `world/` | 今作での世界観設定（原作からの追加・変更） |
| `backbone/` | テーマ・年表・相関図・分岐管理 |
| `style/` | 文体ガイド・用語集 |
| `drafts/` | 執筆原稿 |

## 原作との整合性ルール

1. 原作の設定は `references/canon/` を**正**とする
2. 原作から改変する場合は、必ず先に `backbone/divergence.md` に記載する
3. `backbone/divergence.md` の「維持する設定」に書かれた要素は変えない
4. 原作キャラを書く際は `references/canon/characters/{{キャラ名}}.md` の口調・性格を確認する
5. オリジナルキャラは `characters/original_{{名前}}.md` で作成する
6. 今作に登場しない原作キャラのファイルは作成しない（必要になった時点で追加する）

## 執筆時の注意

1. 新しい章を書く前に、必ず `synopsis/outline.md` と該当章の `synopsis/chapters/chXX.md` を確認すること
2. キャラの口調は `references/canon/characters/{{キャラ名}}.md`（原作設定）と `characters/`（今作の解釈）を両方確認すること
3. 新しい固有名詞を出したら `style/glossary.md` に追加すること
4. 設定矛盾を避けるため、`references/canon/` と `backbone/divergence.md` と `world/` と `backbone/timeline.md` を参照すること
5. キャラクターを新規追加した場合は `backbone/relationships.md` も更新すること
