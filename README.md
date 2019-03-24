# myapp
Node.js express application study


## ローカル(MacOS)での実行

**環境**

- node バージョン: v4.4.7
- express バージョン: 4.13.4



**インストール**

~~~
$ git clone https://github.com/takara9/myapp

myapp$ npm install
~~~


**実行**

~~~
myapp$ npm start
~~~


**アクセス**

アドレスは、ドメイン名、または IPアドレス にポート 3000 番をアクセスする。
http://hostname:3000/

サーバーのアドレスにアクセスした時の画面

![ログイン画面](docs/login.png "ログイン画面")


パスワードを間違えてログインに失敗して、フラッシュのエラーメッセージ表示

![ログイン失敗時の画面](docs/flash_message.png "ログイン失敗画面")





## Google Cloud AppEngine へのデプロイ

前提条件として、GCP にアカウントがあり、SDK がインストールしていて、gcloud コマンドが利用できる状態であるとします。

AppEngineが動作するプロジェクトを作成します。

~~~
imac:myapp maho$ gcloud projects create takara-0005 --enable-cloud-apis --name MyAppEngine5 --set-as-default
~~~

プロジェクトが作成できたことを確認します。

~~~
imac:myapp maho$ gcloud projects list
PROJECT_ID           NAME              PROJECT_NUMBER
intense-base-183010  SandBox           171831961904
takara-0005          MyAppEngine5      243253059344
~~~


AppEngine をasia-northeast1 (Tokyo) に作成する。

~~~
imac:myapp maho$ gcloud app create --region=asia-northeast1
~~~


アプリケーションをデプロイする。
もし、エラーが出たら、エラーメッセージの内容に従って、ブラウザから課金を有効にする。

~~~
imac:myapp maho$ gcloud app deploy 
~~~


ブラウザからアクセスして、動作を確認するには、次のコマンドでデフォルトのブラウザが起動して、自動的にURLをアクセスします。

~~~
imac:myapp maho$ gcloud app browse
~~~

実行状態 と URL アドレスを確認するには、次のコマンドを実行する。プロジェクト指定はオプション

~~~
imac:myapp maho$ gcloud app describe --project takara-0005
~~~



## GCP AppEngine のクリーンナップ

AppEngine の課金を止めるには、プロジェクトごと削除するようです。

~~~
imac:myapp maho$ gcloud projects delete takara-0005
Your project will be deleted.

Do you want to continue (Y/n)?  Y

Deleted [https://cloudresourcemanager.googleapis.com/v1/projects/takara-0005].

You can undo this operation for a limited period by running:
  $ gcloud projects undelete takara-0005
~~~

---

## IBM Cloud CFアプリ(旧Bluemix PaaS)へのデプロイ

IBM Cloud にアカウントがあり、パソコンにIBM Cloud CLI がインストールされているものとします。
ibmcloudコマンドは、bx として短縮形を利用できるので、そちらを利用します。

IBM Cloud へのログイン

~~~
imac:myapp maho$ bx login
~~~

組織とスペースを対話で設定します。

~~~
imac:myapp maho$ bx target --cf
~~~

アプリケーション名takara-myapp5 を付与して、アプリケーションをデプロイします。

~~~
imac:myapp maho$ bx cf push takara-myapp5
~~~

実行状態を確認します。

~~~
imac:myapp maho$ bx cf a
<中略>
名前            要求された状態   インスタンス   メモリー   ディスク   URL
takara-myapp5   started          1/1            1G         1G         takara-myapp5.mybluemix.net
~~~

上記のURLアドレス https://takara-myapp5.mybluemix.net/ へアクセスすることで、アプリケーションを利用できます。



## IBM Cloud CFアプリからのクリーンナップ

課金対象が外すために、削除するには、以下のコマンドを実行します。

~~~
imac:myapp maho$ bx cf d takara-myapp5
~~~