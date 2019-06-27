<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<title>Login</title>
		<style>
		/*a　　　　 cssのフレームワーク*/
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	</style>
	</head>
	<body class="#efebe9 brown lighten-5 brown-text">
	    <div class="container ">
	    	<div class="alert alert-success" role="alert">
			   <h1>Login</h1>
		   </div>

	        <div class="row">
	            <form class="col s12" action="login.do" method="post">
	                <div class="form-group">
	                	<div class="form-group">
	                		 <label for="user_name">Username</label>
	                    	<input id="user_name" name="userName" type="text" class="form-control"
	                               placeholder="ユーザー名を入力してください" autofocus> 
	                    
	                    </div>
                	</div>
					<div class="form-group">
						<div class="form-group">
							<label for="password">Password</label>
							<input id="password" name="password" type="password" class="form-control"　 placeholder="パスワードを入力してください">
							
						</div>
					</div>
					<button type="submit" class="btn btn-warning">ログイン</button>
					<!-- <input class="btn waves-effect #d7ccc8 brown lighten-4" type="submit" value="Login"> -->
					<button type="button" class="btn btn-warning" ><a href="mapback.do">マップに戻る</a></button>
					<p class="red-text darken-2">${error}</p>
					<div>新しいアカウントを登録する: <a href="sign-up">Sign-Up</a></div>
					
				</form>
				
			</div>
		</div>
	</body>
</html>


