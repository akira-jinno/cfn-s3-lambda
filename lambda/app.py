# Lambda関数のメイン処理（ハンドラ関数）
def lambda_handler(event, context):
    print("Hello from Lambda!")  # CloudWatch Logs に出力されるメッセージ（デバッグ用）

    # クライアント（呼び出し元）に返すレスポンス
    return {
        'statusCode': 200,                  # HTTPステータスコード（正常終了）
        'body': 'Hello World from Lambda'   # レスポンスの本文
    }
