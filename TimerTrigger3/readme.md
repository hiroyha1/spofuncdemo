# TimerTrigger3

アプリケーション設定から接続情報を取得し、サイト コレクションを取得するサンプルです。

TimerTrigger3 との違いはパスワードを KeyVault から取得する点のみです。

## KeyVault 設定

### シークレットの作成

KeyVault のリソースを作成し、次のシークレットを作成します。

| 名前 | 値 |
|--|--|
| PASS | パスワード |

作成されたシークレットを選択し、シークレット識別子 https://xxx.vault.azure.net/secrets/PASS/... をコピーします。

### Managed Identity の有効化

Azure Functions の "ID" でシステム割り当てマネージド ID を "オン" にします。

### KeyVault のアクセス ポリシー設定

Azure Functions からシークレットの取得ができるように KeyVault のアクセス ポリシーを設定します。

1. "設定" - "アクセス ポリシー" - "アクセス ポリシーの追加" 
2. "シークレットのアクセス許可" で "取得" にチェック
3. "プリンシパルの選択" で Azure Functions の名前を入力
4. "追加" をクリック
5. "保存" をクリック

## 設定

Azure Portal の対象の Azure Functions にて "設定" - "構成" - "アプリケーション設定" に次の設定を追加します。

| 名前 | 値 |
|--|--|
| USER | ユーザー名 (SharePoint Online administrator または Global Administrator) |
| PASS | @Microsoft.KeyVault(SecretUri=コピーしたシークレット識別子) |
| URL | SharePoint Online Administrator Center の URL (例: https://contoso-admin.sharepoint.com) |

PASS の値の例: "@Microsoft.KeyVault(SecretUri=https://myvaule1234.vault.azure.net/secrets/PASS/abcdefg"


## 実行に必要なモジュール

サンプルでは SharePoint Online Management Shell モジュールを使用しています。このモジュールを PowerShell Gallery から取得するために、requirements.psd1 に次の行を追加しています。

```
@{
    'Microsoft.Online.SharePoint.PowerShell' = '16.*'
}
```

Azure Functions に対して PowerShell モジュールを追加する方法については以下を参照してください。

- [Add PowerShell modules to Azure functions](https://tech.nicolonsky.ch/azure-functions-powershell-modules/)

PowerShell 7 で SharePoint Online Management Shell モジュールを使用する際には注意が必要です。

- [Unable to run SharePointOnline Module in Azure Function (PowerShell) #6602](https://github.com/MicrosoftDocs/office-docs-powershell/issues/6602)

## 動作確認

Azure Portal から TimerTrigger3 を選択し、"コードとテスト" - "テストと実行" - "実行" を押すと、コンソールに実行結果が出力されます。

