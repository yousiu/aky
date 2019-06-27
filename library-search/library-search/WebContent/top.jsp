<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--
        <meta http-equiv="Content-Type" content="text/html; charset=Shift_JIS" />
-->
<link href="http://calil.jp/public/css/calilapi.css" rel="stylesheet" type="text/css" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>${account.userName}のマイページ</title>
<style>
        /*　　　　 cssのフレームワーク*/
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</style>
</head>
 
<body class="">
        <div class="container">
                <!-- 　　　<div id ="title"> -->
                        <div class="alert alert-success" role="alert">
                                <h2>図書検索へようこそ!</h2>
                        </div>
                        <br>
                        <h1><span class="badge badge-secondary">${account.userName} </span>さん</h1>
                        
                        <br>
                        <div id="content">
                                <!--a 選択 -->
                                <div id="library" >
                                        <h3>選択している図書館: <strong id="pref_name"></strong><span class="badge badge-secondary">${account.system_ID} </span></h3>
                                        <br>
                                        <!-- 
                                        <div id ="select-lib">
                                                <button type="button" class="btn btn-outline-info" ><a href="javascript:city_selector.showDlg();" class="alert-link">別の市町村から図書館を選択</a></button>
                                        </div>
                                    <br>

                                        <div id="change_lib" >
                                                <button type="button" class="btn btn-outline-info" ><a href="javascript:city_selector.showDlg();" class="alert-link">登録している図書館の変更</a></button>
                                                <strong id="registration_library"> ${library.place}</strong>
                                        </div> -->                                
                                        <div class="btn-group" role="group" aria-label="Basic example">
                                                <button type="button" class="btn btn-outline-info"><a href="javascript:city_selector.showDlg();" class="alert-link">別の市町村から図書館を選択</a></button>
                                                <button type="button" class="btn btn-outline-info"><a href="javascript:city_selector.showDlg();" class="alert-link">登録図書館の変更</a></button>
                                                <strong id="registration_library"> ${library.place}</strong>
                                        </div>
                                </div>
                                <br>
                                <!-- ISBNリスト -->
                                <h4>あなたのBOOK LIST:</h4>                                                                                                        
                                <button type="submit" class="btn btn-warning" ><a href="book-registration.do">本を登録する</a></button>
                                <button type="submit" class="btn btn-warning" ><a href="map-after.jsp">マップを見る</a></button>
                                <div id = booklist>
                                        <table class="table" id="table-all">
                                                <thead class="table-active">
                                                        <tr>
                                                                
                                                                <th>ISBN</th>
                                                                <th>タイトル</th>
                                                                <th>著者</th>
                                                        </tr>
                                                </thead>
                                                <tbody id=book-table>
                                                        <c:forEach var="book" items="${bookList}">
                                                        <tr>
                                                                <td>${book.isbn}</td>
                                                                <td>${book.title}</td>
                                                                <td>${book.author}</td>
                                                        </tr>
                                                    </c:forEach>
                                               </tbody>
                                    </table>
                            </div>
                        <!-- ここでデータベースから本のリストを持ってくる -->
                       
                        　　　<!-- ここまでデータベースから本のリストを持ってくる -->
                        <!-- 結果の表示 -->
                        <div id="calil_booklist" class="clearfix" value ="">
                        </div>
                        <div class="text-right">
                        　　　<button type="submit" class="btn btn-warning">
                                <a href="loginback.do">ログアウト</a>
                        </button>
                　　　 </div>
              <div id="innerHTMLtxt"></div>
        </div>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script type="text/javascript" src="http://calil.jp/public/js/calilapi.js">        
        </script>
        <script type="text/javascript">
        //a デフォルトの図書館ID(sysytemid)
        
        //a デフォルトは登録した図書館を表示したい」
        var systemid_list = ['Tokyo_Setagaya'];
        var book = new Array();
        //a 市町村選択時に実行される関数
        function on_select_city(systemid, pref){
                systemid_list = systemid;
                
                //a 選択市町村の表示
                $('#pref').show();
                $('#pref_name').html(pref);
                apishow();
        }
        var city_selector = {};
        $(function(){
        	
                //a 市町村選択ダイアログ
                city_selector = new CalilCitySelectDlg({
                        'appkey' : '2bc265ea827cb23b11d1ee80a25ef575',
                        'select_func' : on_select_city
                });
                apishow();
                //ISBNリスト選択時
                $('#isbn_list').change(apishow);
        });
        //a 図書館APIの検索結果の表示
        function apishow(){
                listsearch();
                var isbn_list = book;
                console.log(book);
                $('#calil_booklist').html('');
                $(isbn_list).each(function(i, isbn){
                        //Amazonの書影
                        var thumbnail = '<a href="http://www.amazon.co.jp/exec/obidos/ASIN/' + isbn + '" target="_blank"><img border="0" src="https://images-na.ssl-images-amazon.com/images/P/' + isbn +'.09.MZZZZZZ.jpg" style="" alt="" onload="if(this.width==\'1\') this.src=\'/public/img/no-image/middle.gif\'"></a>';
                        //a 検索結果表示場所の追加
                        $('#calil_booklist').append('<div class="calil_book">'+ thumbnail + '<div id="'+isbn+'"></div></div>');
                });
                //a 検索表示用のインスタンス作成
                var calil = new Calil({
                        'appkey' : '2bc265ea827cb23b11d1ee80a25ef575',
                        'render': new CalilRender(),
                        'isbn' : isbn_list,
                        'systemid' : systemid_list
                });
                //a 検索結果の表示 結果は↑で生成した<div id="isbn"></div>に描画されます
                calil.search();
                
        }
        function listsearch(){
        	var tblTbody = document.getElementById('table-all');
        	console.log(tblTbody.rows.length);
    		// td内のtrをループ。rowsコレクションで,行位置取得。
    		for (var i=1, rowLen=tblTbody.rows.length; i<rowLen; i++) {
    			// tr内のtdをループ。cellsコレクションで行内セル位置取得。
    	
    				//i行目のj列目のセルを取得
    				var tbl = document.getElementsByTagName("table").item(0);
					var value = tbl.rows[i].cells[0].innerText;
    				console.log(value);
    				
    				book[i-1] =value;
    				
    				
    				
    				//取得した値をテキストエリアへ表示
    				
    			
    		}
        }
        
        
</script>
</body>
</html>