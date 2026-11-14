Sentry.init do |config|
  # DSN は Render の環境変数 SENTRY_DSN から読む（コードに書かない）
  config.dsn = ENV["SENTRY_DSN"]

  # 本番環境のエラーだけを送る
  config.enabled_environments = %w[ production ]

  # IP・Cookie・リクエストの中身（フォームの入力内容）・クエリを送らない
  config.send_default_pii = false

  # パフォーマンス計測は使わない（エラーの記録だけにする）
  config.traces_sample_rate = 0.0
end
