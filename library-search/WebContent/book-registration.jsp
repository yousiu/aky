<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="http://calil.jp/public/css/calilapi.css" rel="stylesheet"
        type="text/css" />
<meta name="viewport"
        content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
<title>本の登録ページ</title>
<style>
        /*　　　　 cssのフレームワーク*/
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</style>
</head>
<body class="">
        <div class="container">
                <div class="alert alert-success" role="alert">
                        <h2>${account.userName}さんの気になる本を登録する</h2>
                </div>
                <div class="row">
                        <form class="col s12" action="bookRegistration.do" method="post">
                                <div class="form-group">
                                        <br>
                                        <div class="form-group">
                                                <label for="isbn">本のISBNコード</label> <input id="book-isbn"
                                                        name="isbn" type="text" class="form-control"
                                                        placeholder="ISBNコードを入力してください('-'抜き)" autofocus required>
                                        </div>
                                        <div class="form-group">
                                                <label for="title">書名</label> <input class="form-control"
                                                        id="title" name="title" type="text" placeholder="書名を入力してください"
                                                        autofocus required>
                                        </div>
                                        <div class="form-group">
                                                <label for="password">著者</label> <input id="author" name="author"
                                                        type="text" class="form-control" placeholder="著者を入力してください"
                                                        　required>
                                        </div>　
                                        <br>
                                        <button type="submit" class="btn btn-warning">本を登録</button>
                                        <button type="button" class="btn btn-warning"><a href="top">マイページに戻る</a></button>
                                        <p class="red-text darken-2">${error}</p>
                        </form>
                </div>
        </div>
</body>
</html>