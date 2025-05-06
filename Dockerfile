# ベースイメージ
FROM golang:1.24-alpine

# 必要パッケージ
RUN apk add --no-cache git ca-certificates

# ワーキングディレクトリ
WORKDIR /app

# go.mod と go.sum を先にコピーして依存解決
COPY go.mod go.sum ./
RUN go mod download

# アプリのコードをコピー
COPY . .

# ビルド
RUN go build -o app

# 実行
CMD ["./app"]
