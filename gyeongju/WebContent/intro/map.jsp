<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="path0" value="<%=request.getContextPath() %>" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gyeongju</title>
<%@ include file="/head.jsp" %>
<!-- <link href="http://apis.map.daum.net/favicon.ico" rel="shortcut icon"> -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=051be8a0a0d97aac72cd9818f4e664f7"></script>
	<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/v3.js"></script>
	<script type="text/javascript" src="http://s1.daumcdn.net/svc/original/U03/cssjs/jquery/jquery-1.11.0.js"></script>
	<script type="text/javascript" src="http://s1.daumcdn.net/svc/original/U0301/cssjs/JSON-js/fc535e9cc8/json2.min.js"></script>
	<script type="text/javascript" src="http://s1.daumcdn.net/svc/attach/U03/cssjs/mapapidoc/1421136453605/service.min.js"></script>
<style>
	#contents a { text-decoration: none;}
	#contents ol, #contents ul { list-style: none; }
	hr { box-sizing:content-box; margin-bottom:30px; }
	
	#header #hd #gnb a.dp { color:#101010;}
	#contents { width:100%; min-height:calc(100vh - 610px);  box-sizing:border-box; min-width:1200px; margin-top:160px;}
	#contents * {font-family: Noto Sans KR;}
	
	#contents #page1 { clear:both; width:1200px; margin:0 auto;}
	#nav { width: 1200px; height: auto; float: left; margin: 15px 450px; }
	#title { display: block; align-items: center; margin-left: 300px; }
	#page1 .page-title { width:50%; margin-top : 2rem; margin-bottom:1.5rem; padding-left:20px; font-family: 'HSBombaram'; font-size:40px; letter-spacing:3px; display:inline-block; box-sizing:border-box;}
	#container { width: 1200px; padding-left: 400px;  }
	.breadcrumb { clear: both; float: right; margin: 0 auto; padding-right: 50px; }
	.breadcrumb-item { float: left; text-align: left; }
	.breadcrumb-item:after { content: ">"; }
	.breadcrumb-item:last-child:after { content: " "; }

	#page2 { width: 100%; height: auto; font-family: Noto Sans KR;}
	#page2 .wrap {width:100%; padding-left:20px;}
	#page2 .wrap .sub-title {font-size:25px; font-weight:500; list-style:square; padding-left:20px;}
	h4 { }
	#map { width: 1200px;  }
	
	#coment { clear: both; width: 100%; padding-top:20px; text-align: left;  }
	#com1 { font-size: 17px; }
	#com2 { font-size: 17px; }
	#coment p {padding-bottom:10px;}
	
		.bread-crumb {display:inline-block; width:49%; height:40px; text-align:right; padding-right:10px; margin-top:20px; margin-bottom:20px; box-sizing:border-box;}
	#contents .bread-crumb li {display:inline-block; line-height:40px; color:#b8b8b8;}
	#contents .bread-crumb li a {color:#666;}
	.bread-crumb li a:hover {text-decoration:underline;}
	.bread-crumb li:last-child a {font-weight:500; color:#595959;}
	
</style>
</head>
<body>
<div id="header" class="clr-fix">
	<%@ include file="/header.jsp" %>		
</div>
<div id="contents" class="clr-fix">	
	<section id="page1">
	<h2 class="page-title">오시는 길</h2>
		
		<div class="bread-crumb">
			<ul>
				<li><a href="${path0 }/">홈</a>  >  </li>
				<li><a>고객지원</a>  >  </li>
				<li><a href="${path0 }/intro/map.jsp">오시는 길</a></li>
			</ul>
		</div>
		<hr>
	    <section id="page2">
	    	<div class="wrap">
	    	<ul class="sub-title">
	    		<li><p>경주시청</p></li>
	    	</ul>
			    <div class="map" id="map">
		    		<div class="root_daum_roughmap root_daum_roughmap_landing" id="daumRoughmapContainer1639966341978">&nbsp;</div>
				</div>
			<script class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
			<script charset="UTF-8" src="https://t1.daumcdn.net/kakaomapweb/place/jscss/roughmap/9148b03e/roughmapLander.js"></script>
			<script>
			    new daum.roughmap.Lander({
			        "timestamp" : "1639966341978",
			        "key" : "28hfi",
			        "mapWidth" : "1160",
			        "mapHeight" : "400"
			    }).render();
			</script>
				<div id="coment">
			        <div id="com1" >
			    		<p><i class="xi-maker xi-x"></i> [38102] 경상북도 경주시 양정로 260 (동천동, 경주시청) </p>
			    		<p><i class="xi-call xi-x"></i> 054-779-8585 </p>
			    	</div>
			    	<div id="com2" >
			    		<p><i class="xi-bus xi-x"></i> 60번, 61번, 70번, 260번 </p>
			    		<p><i class="xi-car xi-x"></i> 경상북도 경주시 동천동 800번지(지번) </p>
					</div>
				</div>
		    </div>
	    </section>
	</section>
</div>
<div id="footer" class="clr-fix">
	<%@ include file="/footer.jsp" %>		
</div>
</body>
</html>