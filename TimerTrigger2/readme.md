# TimerTrigger2

アプリケーション設定から接続情報を取得し、Teams のチームを取得するサンプルです。

## 設定

Azure Portal の対象の Azure Functions にて "設定" - "構成" - "アプリケーション設定" に次の設定を追加します。

| 名前 | 値 |
|--|--|
| USER | ユーザー名 |
| PASSWORD | パスワード |

## 実行に必要なモジュール

サンプルでは Microsoft Teams PowerSHell モジュールを使用しています。このモジュールを PowerShell Gallery から取得するために、requirements.psd1 に次の行を追加しています。

```
@{
    'MicrosoftTeams' = '2.*'
}
```

Azure Functions に対して PowerShell モジュールを追加する方法については以下を参照してください。

- [Add PowerShell modules to Azure functions](https://tech.nicolonsky.ch/azure-functions-powershell-modules/)

## 動作確認

Azure Portal から TimerTrigger2 を選択し、"コードとテスト" - "テストと実行" - "実行" を押すと、コンソールに実行結果が出力されます。
