<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="UTF-8">
        <!-- このリンクは市町村の図を表示させるcss -->
        <link href="http://calil.jp/public/css/calilapi.css" rel="stylesheet" type="text/css" />
        <!-- cssのフレームワーク -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>アカウント登録</title>
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
                        <h2>アカウントを登録する</h2>
                </div>
                <div class="row">
                        <form class="col s12" action="sign-up.do" method="post">
                                <div class="form-group">
                                        <br>
                                        <button type="button" class="btn btn-outline-info" ><a href="javascript:city_selector.showDlg();" class="alert-link">図書館登録</a></button>
                                        
                                        <div id="change_lib" >
                                                <h3>登録する図書館の市町村: <span class="badge badge-secondary"><strong id="pref_name"> </strong></span></h3>
                                                <h3>図書館システムID: <span class="badge badge-secondary"><strong id="test_name"></span></h3>
                                        </div>
                                        <div class="form-group">
                                                <label for="systemID">system_ID</label>
                                                <input id="systemID" name="system_ID" type="text" class="form-control" 
                                                placeholder="systemIDをコピー" autofocus required>
                                        </div>
                                        
                                        <div class="form-group">
                          
                                                <label for="user_name">Username</label>
                                                <input class="form-control" id="user_name" name="userName" type="text"
                                                placeholder="ユーザー名を入力してください" autofocus required>
                                        </div>
                                        <div class="form-group">
                                                <label for="password">Password</label>
                                                <input id="password1" name="password1" type="password"
                                                class="form-control" placeholder="パスワードを入力してください"　required>
                                        </div>
                                        <div class="form-group">
                                                <label for="password">Password</label>
                                                <input id="password2" name="password2" type="password"
                                                class="form-control" placeholder="パスワードをもう一度入力してください"　required>
                                        </div>
                                        <br>
                                        <button type="submit" class="btn btn-warning">アカウント登録</button>
                                        <button type="submit" class="btn btn-warning" ><a href="loginback.do">ログイン画面に戻る</a></button>
                                        <p class="red-text darken-2">${error}</p>
                                        </form>
                                </div>
                        </div>
                        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
                        <script type="text/javascript" src="http://calil.jp/public/js/calilapi.js">        </script>
                        <script type="text/javascript">                                                                


                        //市町村選択時に実行される関数
                        function on_select_city(systemid, pref){
                                systemid_list = systemid;
                                const system_id=systemid_list[0]
                                //選択市町村の表示
                                console.log(systemid_list);
                                $('#test_name').html(system_id);
                                $('#pref_name').html(pref);
                                
                        }
                        var city_selector = {};
                        $(function(){
                                //市町村選択ダイアログ
                                city_selector = new CalilCitySelectDlg({
                                        'appkey' : '2bc265ea827cb23b11d1ee80a25ef575',
                                        'select_func' : on_select_city
                                });
                                
                        });
                        
                        
                </script>
                
        </body>
        </html>