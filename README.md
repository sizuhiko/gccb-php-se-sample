# gccb-php-se-sample

GCCBを利用してGAEのPHP SEへ自動デプロイするサンプルコード

## 事前準備

- [GCP](https://console.cloud.google.com/)プロジェクトの作成
- 課金設定をonにする(Cloud Container Builderに関連する部分で必要になりますが、よほどの負荷をかけない限り無料です)
- [gcloudコマンド（Google Cloud SDK）のインストール](https://cloud.google.com/sdk/docs/)
- プロジェクトIDを環境変数にセットする

```
$ export PROJECT_ID=作成したプロジェクトID
```

## 初期設定

`init.sh` を実行することで、以下の作業を自動化します。

- GAEにデプロイするサービスアカウント `deployer` の登録
- `deployer` にデプロイの役割を割り当てる
- `deployer` のサービスアカウント鍵を生成する

最初にgcloudコマンドでGCPへアクセスできるようにするため、ログインを実行します。
ブラウザでプロジェクトを作成したユーザーでログインして認可をしてください。

## コンテナビルド

Google Cloud Container Builder で利用するコンテナをビルドします。

`build.sh` を実行することで、以下の作業を自動化します。

- ベースイメージをpull
- ビルド用コンテナのビルド
- デプロイ用コンテナのビルド

## PUSH TO DEPLOY のトリガーをセットする

この手順はAPIが公開されていないので、GCPのコンソール（ブラウザ）から実施します。

`Container Registory` にアクセスします。
`トリガーを作成` を選択するとモーダルダイアログが出るので、さらに `トリガーを作成` ボタンを押します。

トリガー元のリポジトリは3つ選択できます。

- Cloud Source Repositories
- Bitbucket
- GitHub

このうち、BitbucketとGitHubを選択した場合は、Cloud Source Repositories にソースコードがミラーされます。

あとは、ウィザードに従って、以下の設定をします。

- リポジトリの選択
- 名前の設定
- トリガータイプ
  - ブランチまたはタグを選択し、その名前を正規表現で設定
- ビルド設定の選択
- 環境変数の設定（任意）

## コードをPUSHしてみよう

新しいバージョンのデプロイが実行されます。
