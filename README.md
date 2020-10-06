# アプリケーション名 ---------------------------------------------------
  kids chat
# -----------------------------------------------------------------


# アプリケーション概要 -------------------------------------------------
  このアプリケーションではお子様が室内にいながらお友達同士とつながり、チャット
  で会話ができます。さらに、実装されたアニメーションを楽しむこともできます。
# ----------------------------------------------------------------


# URL ------------------------------------------------------------
  https://kids-chat.herokuapp.com/
# ----------------------------------------------------------------


# テスト用アカウント --------------------------------------------------

## テストアカウント
 email:www.rarara@co.jp
 pass:rara1234

## basic認証
 ユーザー名:kidsc
 pass:1238

# -----------------------------------------------------------------


# 利用方法 -----------------------------------------------------------------------
  ①まずはトップ画面の「とうろく」からアカウント登録をしてください。各項目は必須入力事項です。
  登録完了後はトップ画面に戻ります。名前が表示されているはずです。

  ②同時に「るーむ」というタブが出ているはずですので、クリックしてください。これでチャットの
  ルームに移動します。

  ③左上に、「おへやをつくる」というタブがありますのでクリックしてください。
  ルーム作成画面に移動します。ここで、ルーム名の記入と誰と繋がるかメンバーを選択します。
  「create room」をクリックしてチャットルーム画面に戻ってください。作成したルーム名がサイドバー
  に表示されているはずです。

  ④このルーム名をクリックすると右側がチャット画面になり、ここでメッセージのやりとりができます。
  下部にある白いメッセージ投稿欄にメッセージを入力し送信しましょう。中央の青いコメント欄に投稿
  内容が表示されていれば成功です。また、この画面からルームの削除ができます。ルームを削除する場合は
  黄色いエリアの「またね」をクリックしてください。サイドバーのルームが消えます。
  
  ## 利用にあたって
  利用規約を遵守いただいた上で正しくアプリをご利用ください。
# --------------------------------------------------------------------------------


# 目指した課題解決 -----------------------------------------------------------------------
  このアプリでは３〜５才程度のお子様の課題２点ほどについての解決を目指しました。
  まず１点目はこのコロナ禍の影響で外出が思うようにできず自宅に籠もっている時間が増え、なかなか幼稚園や保育所、近所のお友達と繋がる機会が減ってしまったという課題です。
  ２点目は室内で遊ぶものもありふれた定番のものでは時間を持て余した場合に退屈してしまうという課題です。
  この２点を解決すべく、お子様方のお友達とつながりつつその画面を大いに楽しんで頂き退屈もしないこのアプリを
  開発しました。
# --------------------------------------------------------------------------------------


# 洗い出した用件 --------------------------------------------------------------------------
  以下をご参照ください。
  https://gyazo.com/1632e5457eb0443339901e305f14a247
# --------------------------------------------------------------------------------------


# 実装した機能についてのGIFと説明 -------------------------------------------------------------

## ユーザー管理機能
  ・トップ画面から「とうろく」をクリックするとアカウント登録画面に遷移します。
    https://gyazo.com/9324f7d25d2388deba97641d40c58300
    https://gyazo.com/1d0ba5fb8d75c1c4786b07a3a2d69ef0
  ・アカウントをもっている方は、「ろぐいん」をクリックするとログイン画面に遷移します。
    https://gyazo.com/89924ea65bf1e127d4265cd5dfb5c0d8
  ・アカウント登録またはログインが完了すると、名前が表示されて「るーむ」というタブが出現します。
    https://gyazo.com/f3d933faa89c9b84556279ae0ea70ba4

## ルーム作成機能
  ・トップ画面の「るーむ」をクリックすることで、チャットルーム画面へ遷移します。
    https://gyazo.com/a3ae762e6b1b253ef3b65b0d1157c040
  ・「おへやをつくる」をクリックすることで、ルーム作成画面に遷移します。
    https://gyazo.com/f851b915a2acc79a06c378f0e64ea7a1
  ・左側の白いエリアにルーム名が表示されています。これでルーム作成は完了です。
    https://gyazo.com/c83bb291b0255754f676d56c5e365142

## メッセージ投稿機能
  ・ルーム名をクリックしてください。チャットルーム画面の右側にチャット画面が出現します。
    https://gyazo.com/9913392a2d30e63398474c617bb04c98
  ・下部にある白いコメント欄にメッセージを入力し、送信すると青いエリアに投稿内容が表示されます。
    https://gyazo.com/c4dc05eaedf0a2b3628a0e7c4e5f692b

# ---------------------------------------------------------------------------------


# 実装予定の機能 --------------------------------------------------------------------
  現在は、音声入力機能及びアニメーションの実装ができていないため随時実装していきます。
# --------------------------------------------------------------------------------


# データベース設計 --------------------------------------------------- 

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user


## ER図、画面遷移図

--ER図--
https://gyazo.com/25e5dc0ae1e2574fc5d21c1bb4c59014

--画面遷移図--
https://gyazo.com/4624eb6c7a6ea4ae71955109b437a999

# ---------------------------------------------------------------------


# ローカルでの動作方法 -----------------------------------------------------
  ・クローンするディレクトリ上で以下を実行してください。
    % git clone https://github.com/george-men/kids-chat.git
  ・以下のコマンド入力をお願います。
    % bundle install
    % yarn install
  ・続けて以下のコマンド入力もお願いします。
    % rails db:create
    % rails db:migrate
  ・サーバーを起動してください。
    rails s
  ・ブラウザにて「localhost:3000」へのアクセスをお願いします。

## rubyのバージョンについて
  ruby 2.6.5

## 各種パッケージについて
  autoconf		jpeg			openssl@1.1
  docbook			libde265		pcre
  docbook-xsl		libffi			pkg-config
  freetype		libheif			python@3.8
  gdbm			liblqr			rbenv
  gettext			libomp			readline
  ghostscript		libpng			ruby-build
  glib			libtiff			shared-mime-info
  gnu-getopt		libtool			sqlite
  heroku			little-cms2		webp
  heroku-node		mysql@5.6		x265
  icu4c			node			xmlto
  ilmbase			openexr			xz
  imagemagick		openjpeg		yarn
# ----------------------------------------------------------------------
