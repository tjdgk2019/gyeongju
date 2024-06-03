<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path0" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gyeongju</title>
    <%@ include file="/head.jsp" %>
<style>
* {box-sizing:border-box; }
#header #hd #gnb a.dp { color:#101010;} 
#contents ol, #contents ul { list-style: none; }
hr { box-sizing:content-box; margin-bottom:30px; }
#contents a {color:#101010;}

#contents { width:100%; min-height:calc(100vh - 610px);  box-sizing:border-box; min-width:1200px; margin-top:160px;}
#contents * {font-family: Noto Sans KR;}

#contents #page1 { clear:both; width:1200px; margin:0 auto;  margin-bottom: 50px; font-family: Noto Sans KR;}
#page1 .page-title { width:50%; margin-top : 2rem; margin-bottom:1.5rem; padding-left:20px; font-family: 'HSBombaram'; font-size:40px; letter-spacing:3px; display:inline-block; box-sizing:border-box;}


	.head { clear: both; width: 100%; height: 300px; overflow: hidden; }
	#nav { width: 100%; float: left; }
	#title { float:left; text-align: left; margin-top: 3rem; margin-left: 15%; display: flex; align-items: center; }
	
	table { border: 1px #a39485 solid; font-size: 18px; box-shadow: 0 2px 5px rgba(0,0,0,.25); width: 1200px; margin: 0 auto; border-collapse: collapse; border-radius: 5px; overflow: hidden; margin-bottom:40px;}
	thead { font-weight: bold; color: #fff; background-color: #C1A483; }
	td, th { padding: 1em .5em; vertical-align: middle; text-align: center; }
  	td { border-bottom: 1px solid rgba(0,0,0,.1); background: #fff; }
	
	#table .td-title {text-align:left; padding-left:30px; text-decoration:none;}
  	#table .td-title a:hover {font-weight:500; text-decoration:underline;}
  
 	
 	/*
    
 	table, thead, tbody, th, td, tr { display: block; }
	th { text-align: right; }
	table { position: relative; padding-bottom: 0; border: none; box-shadow: 0 0 10px rgba(0,0,0,.2); }
	thead { float: left; white-space: nowrap; }
	tbody { overflow-x: auto; overflow-y: hidden; position: relative; white-space: nowrap; }
	tr { display: inline-block; vertical-align: top; }
	th { border-bottom: 1px solid #a39485; }
	td { border-bottom: 1px solid #e5e5e5; }*/
	
	#page2 { clear: both; width: 100%; height: auto; }
	
	
	#contents .buttons #insbtn {border:none; text-align:center; padding:7px 20px; border-radius:30px; margin-left:3px; 
		background-color:#333; color:#fff; float:right; font-size:20px; font-weight:500;}
	
	.bread-crumb {display:inline-block; width:49%; height:40px; text-align:right; padding-right:10px; margin-top:20px; margin-bottom:20px; box-sizing:border-box;}
	#contents .bread-crumb li {display:inline-block; line-height:40px; color:#b8b8b8;}
	#contents .bread-crumb li a {color:#666;}
	.bread-crumb li a:hover {text-decoration:underline;}
	.bread-crumb li:last-child a {font-weight:500; color:#595959;}

#board-search { margin: 0 auto;}
 		.container { clear:both; margin: 0 auto; margin-bottom: 50px;  }
.search-window form { text-align:center;  }
.search-wrap {display:inline-block; margin:0 auto; text-align:center;}
.search-wrap input, button {display: inline-block;}
#btn { clear: both;  margin-right: 50px; margin-bottom: 50px; border: solid 1px #333;  border-radius: 20px; width: 100px; height: 40px; color: #fff; background-color: #ab9c8e; font-weight: bold; text-align: center; line-height: 35px; }
.btn btn-secondary {  border: solid 1px;  width:20px; height: 20px; }

</style>
<!-- include -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">

</head>
<body>
<div id="header" class="clr-fix">
	<%@ include file="/header.jsp" %>		
</div>
<div id="contents">
	<section id="page1">
	<h2 class="page-title">자료실</h2>
		<div class="bread-crumb">
			<ul>
				<li><a href="${path0 }/">홈</a>  >  </li>
				<li><a >고객지원</a>  >  </li>
				<li><a href="${path0 }/DataList.do">자료실</a>
				</li>
			</ul>
		</div>
			<hr>
		<div>
			<table id="table" class="table table-hover">
				<colgroup>
					<col style="width:88px">
					<col>
					<col style="width:220px">
					<col style="width:80px">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성일</th>
						<th scope="col">조회</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${not empty dataList }">
						<c:forEach var="dto" items="${dataList }">
						<tr>
							<td>${dto.bno }</td>
							<td class="td-title">
								<c:if test="${empty sid }">
									${dto.title }
								</c:if>
								<c:if test="${not empty sid }">
								<a href="${path0 }/GetData.do?bno=${dto.bno }">${dto.title }</a>
								</c:if>
							</td>
							<td>${dto.resdate }</td>
							<td>${dto.visited }</td>
						</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty dataList }">
						<tr>
							<td colspan="4">
								<strong>자료가 존재하지 않습니다.</strong>
							</td>
						</tr>
					</c:if>
				</tbody>
			</table>
			</div>
			<div class="buttons">
			<c:if test="${sid.equals('admin') }">
			<a id="insbtn" role="button" href="${path0 }/DataInsert.do">자료 등록</a>
			</c:if>
		</div>
			</section>
			<section id="page2">
			<div id="board-search">
       			<div class="container">
		            <div class="search-window">
		                <form action="" method="post">
		                    <div class="search-wrap">
		                        <h6></h6>
		                        <input id="search" type="search" name="search" size="40" placeholder="검색어를 입력해주세요." >
                          
		                        <button type="submit" class="btn btn-dark">검색</button>
		                    </div>
		                </form>
		            </div>
		        </div>
		    </div>
			<div>
				<c:if test="${aid.equals('admin') }">
					<div id="btn">
						<a href="${path0 }/Da">글 등록</a>
					</div>
				</c:if>
			</div>
		</section>
</div>
<div id="footer" class="clr-fix">
	<%@ include file="/footer.jsp" %>		
</div>
</body>
</body>
</html>