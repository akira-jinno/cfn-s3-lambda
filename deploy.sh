#!/bin/bash  # このスクリプトをbashシェルで実行する宣言

# ===============================
# 1. S3バケット名を変数に格納
# ===============================
BUCKET_NAME=tf-s3-backend-n80ddd  # 事前に作成しておいたS3バケット名を指定
                               # ※ここは自分のバケット名に変更してください

# ===============================
# 2. LambdaコードをZIP形式に圧縮
# ===============================
#zip app.zip lambda/app.py  # lambdaディレクトリ内のapp.pyをZIPファイルに圧縮
                           # 出力先はプロジェクト直下に「app.zip」

# ===============================
# 3. ZIPファイルをS3にアップロード
# ===============================
aws s3 cp app.zip s3://$BUCKET_NAME/lambda/app.zip
# → S3の "lambda/app.zip" というキーでアップロードされる
# → CloudFormationテンプレートはこのファイルをLambdaコードとして参照する

# ===============================
# 4. CloudFormationでスタックを作成 or 更新
# ===============================
aws cloudformation deploy \
  --template-file template.yaml \                  # 使用するCloudFormationテンプレート
  --stack-name day1-basic-stack \                  # スタックの名前（初回作成 or 更新される）
  --capabilities CAPABILITY_NAMED_IAM \            # IAMリソース作成に必要なオプション
  --parameter-overrides BucketName=$BUCKET_NAME    # テンプレート内のBucketNameパラメータに値を渡す

# ------------------------------------
# ※注意ポイント：
# - スタック名がすでに存在する場合は更新される
# - 初回のみS3バケットを手動で作成しておく必要があります
# - Lambdaコードに変更がある場合もこのスクリプトで再デプロイ可能です
# ------------------------------------
