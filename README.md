# browserify_rails_app
browserify-rails サンプル

## 使い方

```bash
% git clone https://github.com/maangie/browserify_rails_app.git
% cd browserify_rails_app
% bin/bundle install --without=production
% bin/rake bower:install
% npm install
% bin/rails server -d
% open http://localhost:3000
```

## ローカルサーバのシャットダウン

```bash
% kill `cat tmp/pids/server.pid`
```

## テスト

```bash
% bin/rake
% open open coverage/rcov/index.html
```

## heroku へのデプロイ

```bash
% heroku create
% heroku config:set BUILDPACK_URL=https://github.com/heroku/heroku-buildpack-multi.git
% git push heroku master
% heroku run rake db:migrate
% heroku open
```

## heroku から削除

```bash
% app=`heroku info --json | jq '.app.name' | sed 's/"//g'` \
  sh -c 'heroku destroy --confirm $app --confirm $app'
```
