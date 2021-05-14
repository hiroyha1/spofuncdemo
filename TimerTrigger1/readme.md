# TimerTrigger1

アプリケーション設定から接続情報を取得し、サイト コレクションを取得するサンプルです。

## 設定

Azure Portal の対象の Azure Functions にて "設定" - "構成" - "アプリケーション設定" に次の設定を追加します。

| 名前 | 値 |
|--|--|
| USER | ユーザー名 (SharePoint Online administrator または Global Administrator) |
| PASSWORD | パスワード |
| URL | SharePoint Online Administrator Center の URL (例: https://contoso-admin.sharepoint.com) |

## 実行に必要なモジュール

サンプルでは SharePoint Online Management Shell モジュールを使用しています。このモジュールを PowerShell Gallery から取得するために、requirements.psd1 に次の行を追加しています。

```
@{
    'Microsoft.Online.SharePoint.PowerShell' = '16.*'
}
```

Azure Functions に対して PowerShell モジュールを追加する方法については以下を参照してください。

- [Add PowerShell modules to Azure functions](https://tech.nicolonsky.ch/azure-functions-powershell-modules/)
