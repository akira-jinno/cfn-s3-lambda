# CloudFormation + Lambda デモ

このプロジェクトは、S3に格納されたLambdaコードを使って、CloudFormationでデプロイするシンプルな構成です。

## 構成ファイル

- `template.yaml`：CloudFormationテンプレート
- `deploy.sh`：Lambdaコードのzip化 → S3アップロード → スタック作成スクリプト
- `lambda/app.py`：Lambda関数のコード

## デプロイ手順

```bash
bash deploy.sh
