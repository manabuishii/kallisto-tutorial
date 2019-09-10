# かいてあること

- [Kallisto のチュートリアル](https://www.kallistobus.tools/getting_started.html)
  - これを CWLワークフローにする
  - ダウンロードして、gunzipやってあるとする。

# ツールのバージョン

- kallisto 0.45.0
  - `quay.io/biocontainers/kallisto:0.45.0--hdcc98e5_0`
- bustools 0.39.3
  - この repository にある Dockerfile
  - もともとは、 bioconda にある。

# テストの実行方法

## cwltest

```
cwltest --test test.yml
```

## CircleCIをローカル実行する

```
circleci local execute --job buildlocal
```


流れとしては
- CWL CommandLineToolで、チュートリアルの各ステップのコマンドを書く
 - [雑に始める CWL！](https://qiita.com/tm_tn/items/4956f5ca523f7f49f386)方式でCWLにしたい。参加者募集中
- ツールがあつまったら、CWL Workflowを書く。
 - 書き方については、Live Share 先のREADME.mdにかいてあります（ここにもはりつけます）
- テストを書く



# 雑に始めるCWLワークフロー

## 前提条件

- ツールは、できているとする
  - ワークフロー内で `run` したい `CommandLineTool` の定義ファイル
  - ツールがないときは、まずツールをそろえてから。並行は大変


##  ワークフロー書き方の手順

1. ヘッダを書く

```yaml
cwlVersion: v1.0
class: Workflow
doc: the workflow to analyze hogehoge
inputs: []
steps: []
outputs: []
```
2. `steps` の `id` を全部書く
3. 各 `step` の `run` に実行すべき CommandLineTool の CWL ファイルを指定する
4. `run` に指定した CommandLineTool 定義を参照して、各CWLの `outputs` を全部 `step` の `out` に書く
5. `out` に指定したもののうち、別のツールの `in` になるものを記述する (ツール間の依存関係の解決)
6. 実行時に入力されるパラメータを `inputs` に記述する
7. `inputs` に書いたものを、使用するstepの `in` に書く
8. `out` に指定したもののうち、workflow終了時に手元に残っておいてほしいものを `outputs` に書く

## 注意事項

- 分岐については、考えない
  - 今回は条件分岐は考えない
    - 条件分岐は、CWL側には書くべきではない。スクリプトに書いてコンテナにいれる。
  - 単純に、２つとか複数の処理をしたいだけなら、雑に始めるワークフローの対象
- InitialWorkdirなどは、今回はパス
  - step での CommandLineTool も今回はパス
- テストを書く


# 雑に書くコンテナ

- bioconda にあれば楽




# 確認事項

- (別のインプット|グローバルなアウトプット)に使われないステップのoutはどうなるか?
- 
