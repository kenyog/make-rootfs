# クロスビルド用のrootfsを作るスクリプトを管理するリポジトリ

さまざまなLinux環境のルートファイルシステムのtarボールを作成するためのスクリプトを集めたリポジトリです。

例えばRaspberry Pi OSのインストールイメージをダウンロードしてきて、そこから必要なファイルを抽出して、クロスビルドを行うときのsysrootとして使用可能なファイル構成をtarボール化できます。
`amd64`環境上でクロスビルドすることを想定しているため、基本的に`amd64`アーキテクチャ以外の環境を対象にします。

[English](./README.md)


## 対応してるOS

* [Ubuntu22.04(Arm64)](./ubuntu22-arm64/README.md)

