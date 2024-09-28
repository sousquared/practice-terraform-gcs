以下サイトのterraform練習  
main.tfではなくいくつかのファイルにリファクタリングしている.  
https://cloud.google.com/load-balancing/docs/https/ext-load-balancer-backend-buckets?hl=ja

## システムアーキテクチャ

```mermaid
graph TB
Internet((インターネット)) --> LB[外部HTTPSロードバランサ]
LB --> B1[バックエンドバケット1]
LB --> B2[バックエンドバケット2]
subgraph GCP[Google Cloud Platform]
LB
B1
B2
end
```

システムアーキテクチャ図 by diagram.py
![システムアーキテクチャ図](./system-architecture.png)

# Terraform

## 実行
```
# terraform plan -- 実行前の確認用
terraform apply
```

## クリーンアップ
```
terraform destory
```

# rye

## 仮想環境のアクティベート
```
. .venv/bin/activate
```

(無効化する場合)
```
deactivate
```

## パッケージの同期
```
rye sync
```

## パッケージの追加
```
rye add diagrams
```

## スクリプトの実行
```
rye run python diagram.py 
```
