# rails-vue-todo-spa-backend

「rails-vue-todo-spa」のバックエンド部分。

## セットアップ

```
$ docker-compose build
$ docker-compose up -d
$ docker-compose run api rails db:create
$ docker-compose run api rails db:migrate
$ docker-compose run api rails db:seed
```

<img width="1590" alt="68747470733a2f2f71696974612d696d6167652d73746f72652e73332e61702d6e6f727468656173742d312e616d617a6f6e6177732e636f6d2f302f3638383835342f33613639663439332d383939372d623563362d636261342d3938343465313936306137312e706e67" src="https://user-images.githubusercontent.com/51913879/125202565-15edeb00-e2af-11eb-90f9-ce1c0e38c729.png">


[http://localhost/3000](http://localhost/3000) にアクセスしていつもの画面が表示されればOK。
