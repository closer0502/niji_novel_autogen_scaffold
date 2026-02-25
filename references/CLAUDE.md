# 原作参照データの取り扱いルール

## 基本方針

- `references/` には**原作の公式情報のみ**を置く（作品間で再利用する想定）
- 今作の独自解釈・改変は `backbone/divergence.md` と各作業ディレクトリ（`characters/`, `world/` など）に書く
- 原作キャラを登場させる場合、まず `references/canon/characters/{{キャラ名}}.md` の情報を確認し、
  今作での変化は `characters/` のファイルに記載する
- 今作に登場する原作キャラのみ `references/canon/characters/` にファイルを作成する

## 二次創作ルール

- 原作の設定は `references/canon/` を正とする
- 独自解釈・改変は必ず `backbone/divergence.md` に記載してから執筆する
- 原作に存在しないオリジナルキャラは `characters/` に `original_` プレフィックスで作成する
