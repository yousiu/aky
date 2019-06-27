<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="myapp">
<head>
	<title>検索した住所の近くの図書館</title>
	<!-- <meta name="viewport" content="initial-scale=1.0, user-scalable=no"> -->
	<meta charset="utf-8">
	<style>
		html{
			background: #DDEBC4;
		}
		.button {
			display       : inline-block;
			border-radius : 5%;          /* 角丸       */
			font-size     : 12pt;        /* 文字サイズ */
			text-align    : center;      /* 文字位置   */
			cursor        : pointer;     /* カーソル   */
			padding       : 12px 12px;   /* 余白       */
			background    : #000066;     /* 背景色     */
			color         : #ffffff;     /* 文字色     */
			line-height   : 1em;         /* 1行の高さ  */
			transition    : .3s;         /* なめらか変化 */
			box-shadow    : 2px 2px 1px #666666;  /* 影の設定 */
			border        : 2px solid #000066;    /* 枠の指定 */
		}
		#map {
			height: 90%;
			width: 60%; 
			left: 20%;
			position: absolute;
			top: 100px;
		}
		#floating-panel {
			position: absolute;
			top: 25px;
			left: 30%;
			z-index: 5;
			background-color: #b0ca5f;
			padding: 5px;
			border: 1px solid #999;
			text-align: center;
			font-family: 'Roboto','sans-serif';
			line-height: 30px;
			/*padding-left: 250px;*/

		}
		.textbox {
			width: 450px;
			height: 30px;
			font-size: 15pt;
			font-weight: bold;        
		}
   /* #left-panel {
      font-family: 'Roboto','sans-serif';
      line-height: 30px;
      padding-left: 10px;
    }

    #left-panel select, #left-panel input {
      font-size: 15px;
    }

    #left-panel select {
      width: 100%;
    }

    #left-panel i {
      font-size: 12px;
    }
    #left-panel {
      font-family: Arial, Helvetica, sans-serif;
      position: absolute;
      left: 25px;
      top: 72%;
      margin-top: -195px;
      height: 340px;
      width: 200px;
      padding: 5px;
      z-index: 5;
      border: 1px solid #999;
      background: #fff;
      }*/

      #right-panel {
      	font-family: 'Roboto','sans-serif';
      	line-height: 20px;
      	padding-left: 10px;
      }

      #right-panel select, #left-panel input {
      	font-size: 10px;
      }

      #right-panel select {
      	width: 100%;
      }

      #right-panel i {
      	font-size: 12px;
      }
      #right-panel {
      	font-family: Arial, Helvetica, sans-serif;
      	position: absolute;
      	right: 25px;
      	top: 60%;
      	margin-top: -195px;
      	height: 350px;
      	width: 200px;
      	padding: 5px;
      	z-index: 10;
      	border: 1px solid #999;
      	background: #fff;
      }

      html, body {
      	height: 100%;
      	margin: 0;
      	padding: 0;
      }
      .header {
      	position: absolute;
      	right: 25px;
      }
      h2 {
      	font-size: 22px;
      	margin: 0 0 5px 0;
      }
      h3 {
      	font-size: 18px;
      	margin: 0 0 5px 0;
      } 
      ul {
      	list-style-type: none;
      	padding: 0;
      	margin: 0;
      	height: 271px;
      	width: 200px;
      	overflow-y: scroll;
      }
      li {
      	background-color: #f1f1f1;
      	padding: 10px;
      	text-overflow: ellipsis;
      	white-space: nowrap;
      	overflow: hidden;
      }
      li:nth-child(odd) {
      	background-color: #fcfcfc;
      }
      #more {
      	width: 100%;
      	margin: 5px 0 0 0;
      }
      #morebook {
      	width: 100%;
      	margin: 5px 0 0 0;
      }
      .wrap
      {
      	width: 800px;
      	max-width: 90%;
      	margin: 5px auto;
      	position: absolute;
      	left: 25px;
      	top: 30%;
      }
      .wrap div
      {
      	margin: 2em 0;
      }
      button:disabled {
      	background: #A2D7DD;
      }
      /*.li{
      	background: 
      }*/
     

  </style>
</head>
<body ng-controller="app">
	<div class="header">
		<h2><a href="login">ログイン</a></h2>
	</div>


	<!-- 住所検索 -->
	<div id="floating-panel">
		<input id="address" type="textbox" class="textbox" placeholder="小伝馬町, 東京">
		<input id="submit" type="button" value="検索開始" class="button" onclick="deleteMarkers();history()">
	</div>
	<div id="map"> </div>

	<!-- 近くの図書館の検索結果の表示 -->
	<div id="right-panel">
		<h2>検索の結果</h2>
		<h3><div id ="address-pl"></div></h3>
		<ul id="places"></ul>
		<button id="more" class="button">さらに見る</button>
	</div>

	<!-- 図書館の所蔵の表示 -->
 <!--  <div id="right-panel">
    <h2>図書館の所蔵</h2>
    <ul id="book"></ul>
    <button id="morebook">さらに見る</button>
</div> -->

<!-- 郵便番号で住所検索 -->
<div class="wrap">
	<div class="form-inline">
		<span class="help-block" style="display: block;">郵便番号を入力してください。</span>
		<p>
			<input type="text" class="form-control" placeholder="例: 1000014" ng-model="code" ng-change="input()"> 
		</p>
		<button ng-click="click()" class="button">郵便番号で住所を確認</button>
		<!-- <input type="button" class="button" ng-click="click()" value="郵便番号で住所を確認">  -->
	</div>

	<div ng-if="data.error" class="alert-danger">住所が存在しません。</div>

	<div ng-repeat="address in data.addresses">

		<div class="content">
			<label>都道府県</label>
			<span class="content_form">
				{{ address.ja.prefecture }}
			</span>
		</div>
		<div class="content">
			<label>市区町村</label>
			<span class="content_form">
				{{ address.ja.address1 }}
			</span>
		</div>
	</div>


	<script>
		var map;

    // マーカーを消す
    　 var markers = [];
    　function deleteMarkers() {
    	setMapOnAll(null);
    }
    function setMapOnAll(map) {
    	for (var i = 0; i < markers.length; i++) {
    		markers[i].setMap(map);
    	}
    }

    function history(){
      //リストではないときに表示したいときに使います
      // const name = document.getElementById('address').value;
      // target=document.getElementById("address-pl");
      // target.innerHTML=name;
  };

    // 住所検索機能
    function initMap() {
    	var pyrmont = {lat:35.6915854, lng: 139.77862719999996};
    	map = new google.maps.Map(document.getElementById('map'), {
    		zoom: 18,
    		center: pyrmont,
    	});
    	var geocoder = new google.maps.Geocoder();
    	document.getElementById('submit').addEventListener('click', function() {
    		geocodeAddress(geocoder, map);

    	});
    }

    function geocodeAddress(geocoder, resultsMap) {
    	var address = document.getElementById('address').value;
    	geocoder.geocode({'address': address}, function(results, status) {
    		if (status === 'OK') {
    			resultsMap.setCenter(results[0].geometry.location);
    			var marker = new google.maps.Marker({
    				map: resultsMap,
    				position: results[0].geometry.location
    			});
    			markers.push(marker);

       // Create the places service.
       var service = new google.maps.places.PlacesService(map);
       var getNextPage = null;
       var moreButton = document.getElementById('more');
       moreButton.onclick = function() {
       	moreButton.disabled = true;
       	if (getNextPage) getNextPage();
       };

        // Perform a nearby search.
        service.nearbySearch(
        	{location: results[0].geometry.location, 
        		radius: 1000, 
        		type: ['library']},
        		function(results, status, pagination) {
        			if (status !== 'OK') return;

        			createMarkers(results);
        			moreButton.disabled = !pagination.hasNextPage;
        			getNextPage = pagination.hasNextPage && function() {
        				pagination.nextPage();
        			};
        		});
    } else {
    	alert('郵便番号あるいは住所が正しくありません。再度確認してください');
    }
　　　});
    　}


  // 建物結果

  function createMarkers(places) {

  	var bounds = new google.maps.LatLngBounds();

  	var placesList = document.getElementById('places');

  	for (var i = 0, place; place = places[i]; i++) {

  		var image = {
  			url: place.icon,
  			size: new google.maps.Size(71, 71),
  			origin: new google.maps.Point(0, 0),
  			anchor: new google.maps.Point(17, 34),
  			scaledSize: new google.maps.Size(25, 25)
  		};

  		var marker = new google.maps.Marker({
  			map: map,
  			icon: image,
  			title: place.name,
  			position: place.geometry.location
  		});
  		markers.push(marker);

  		var li = document.createElement('li');
  		li.textContent = place.name;
  		placesList.prepend(li);
  		bounds.extend(place.geometry.location);
  	}
  	const name = document.getElementById('address').value;
  	var li = document.createElement('li');
  	li.textContent = name;
  	li.style.color = "red";
  	placesList.prepend(li);
  	map.fitBounds(bounds);
   // console.log(name);
   
}
</script>



<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.5/angular.min.js"></script>
<script type="text/javascript">
	angular.module('myapp', [])
	.service('getAddress', ['$http', function ($http) {
		this.getdata = function (url, callback) {

			$http({
				url: url,
				method: 'GET'
			})
			.success(function (data, status, headers, config) {
				callback(data);
			})
			.error(function () {
				callback({error: true});
			})
		};
	}])
	.controller('app', ['$scope', 'getAddress', function ($scope, getAddress) {
		$scope.input = function() {
			if ($scope.code && $scope.code.match(/^[0-9]{3}\-?[0-9]{4}$/)) {
				angular.element(document).find('button').attr('disabled', false);
			} else {
				angular.element(document).find('button').attr('disabled', true);
				// alert('郵便番号あるいは住所が正しくありません。再度確認してください');
			}
		}
		$scope.click = function () {
			if ( ! $scope.code || ! $scope.code.match( /^[0-9]{3}\-?[0-9]{4}$/ ) ) {
				return;
			}
			var endpoint = 'https://madefor.github.io/postal-code-api/api/v1';
			var code1 = $scope.code.replace(/^([0-9]{3}).*/, "$1");
			var code2 = $scope.code.replace(/.*([0-9]{4})$/, "$1");
			$scope.data = {};
			$scope.data.url = endpoint + '/' + code1 +'/' + code2 + '.json';
			getAddress.getdata($scope.data.url, function (res) {
				if (res.error) {
					$scope.data.error = true;
				} else {
					// $scope.data.json = json = JSON.stringify( res, null, "    " );
					$scope.data.addresses = res.data;
				}
			});
		}
	}]);
</script>


<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback&libraries=places&callback=initMap" async defer></script>
</body>
</html>