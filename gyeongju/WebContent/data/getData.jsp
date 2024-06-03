<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="path0" value="<%=request.getContextPath() %>" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Gyeongju</title>
<%@ include file="/head.jsp" %>
<style>
	
 	ul { list-style: none; }
	#header #hd #gnb a.dp { color:#101010;}
	hr { box-sizing:content-box; margin-bottom:30px; }
	* {box-sizing:border-box; }
	#contents { clear:both; width:100%; margin-bottom:5rem; box-sizing:border-box; min-width:1400px; min-height:calc(100vh - 610px); margin-top:160px;}
	#contents .page { clear:both; width:1200px; margin:0 auto; font-family: Noto Sans KR; }

	#header #hd #gnb a.dp { color:#101010;}
	.fd-vs { width:100%; height:618px; overflow:hidden; margin:0 auto; font-family: 'HSBombaram'; min-width:1400px; }
	.fd-vs img {width:100%; height:100%; object-fit:cover;}
	.fd-vs .vstit {position:absolute; width:100%; min-width:1400px; color:#fff; top:330px; z-index:998; margin:0 auto; }
	.fd-vs .vstit .ttext {font-size:70px; font-weight:400; width:1200px; min-width:1200px; margin:0 auto; padding-left:25px; letter-spacing:10px; color:#fff; text-shadow: 2px 2px 2px gray;}
	
	#page1 .wrap { color:#101010;}
	.page .page-title { width:50%; margin-top : 2rem; margin-bottom:1.5rem; padding-left:20px; font-family: 'HSBombaram'; font-size:40px; letter-spacing:3px; display:inline-block; box-sizing:border-box;}

	#table {margin:0 auto; width:1200px; border-collapse : collapse;}
	#table #td-title {border-top:3px solid #C1A483; font-size:22px; border-bottom:1px solid #C1A483; padding:15px 0 15px 15px; font-weight:500;}
	#table #td-aid {width:1%; white-space:nowrap; padding:5px 0 5px 15px; text-align:left;}
	#table #td-resdate span {margin:0 15px; color:#b8b8b8;}
	#table #td-visited {text-align:right; padding-right:15px;}
	#table #td-visited span {margin-right:15px; }
	#table #td-aid, #td-resdate, #td-visited {border-bottom:1px solid #C1A483; }
	#table #td-data { padding:5px 0 5px 15px;}
 	#table #td-data span { margin: 0 15px; color:#b8b8b8;}
 	#table #td-data a { color:#101010; text-decoration:underline;}
	#table #td-content {border-top:1px solid #C1A483; padding: 25px; min-height:200px; border-bottom:1px solid #C1A483;}
	#table #td-content .fig {width:900px; margin:0 auto;}
	#table #td-content .fig img {width:100%; height:auto;}
	
	
	.bread-crumb {display:inline-block; width:49%; height:40px; text-align:right; padding-right:10px; margin-top:20px; margin-bottom:20px; box-sizing:border-box;}
	#contents .bread-crumb li {display:inline-block; line-height:40px; color:#b8b8b8;}
	#contents .bread-crumb li a {color:#666;}
	.bread-crumb li a:hover {text-decoration:underline;}
	.bread-crumb li:last-child a {font-weight:500; color:#595959;}
	
	.page .buttons { margin:0 auto; margin-top:50px; text-align:center; margin-bottom:100px;}
	.page .buttons a { display:inline-block;  border:none; text-align:center; padding:7px 20px; border-radius:30px; margin-left:3px; 
		background-color:#333; color:#fff; font-size:20px; font-weight:500;}

	#page2 {width:1200px; margin:0 auto;}
	#page2 * {box-sizing:border-box;}
	#page2 #reply-wrap {width:100%; height:150px; background-color:#f0eae4; padding:20px;}
	#page2 #reply-wrap #rep-input {display:inline-block; width:1020px; height:110px; margin-right:15px; vertical-align:middle; padding:20px;}
	#page2 #reply-wrap #btn-col {display:inline-block; width:115px; height:110px;  }
	#page2 #reply-wrap #btn-col #rep-btn {display:inline-block; width:100%; height:100%; vertical-align:middle;}
</style>
</head>
<body>
<div id="header" class="clr-fix">
 	<%@ include file="/header.jsp" %>
</div>
<div id="contents" class="clr-fix">
	<section class="page">
	<h2 class="page-title">자료실</h2>
		<div class="bread-crumb">
			<ul>
				<li><a href="${path0 }/">홈</a>  >  </li>
				<li><a href="${path0 }/DataList.do">자료실</a>  >  </li>
				<li><a href="${path0 }/GetData2.do?bno=${data.bno}">상세보기</a></li>
			</ul>
		</div>
		<hr>
			<div class="wrap">
					<table class="table" id="table">
						<tbody>
							<tr class="tr-title">
								<td id="td-title" colspan="3" >${data.title }</td>
							</tr>	
							<tr class="tr-row">
								<td id="td-aid">관리자</td><td id="td-resdate"><span>|</span>${data.resdate }</td>
								<td id="td-visited"><span>조회</span>${data.visited }</td>
							</tr>
              <tr>
                	<c:if test="${not empty data.filename }">
                <td id="td-data" colspan="3">첨부파일  <span>|</span>
                <a href="${path0}/dataDownload.do?filename=${data.filename}" >${data.filename}</a></td>
                    </c:if>
                     
                      </tr>
							<tr class="tr-content" >
								<td id="td-content" colspan="3">
									${data.content }<br><br><br>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="buttons">
					  <c:if test="${sid.equals('admin') }">
						  <a role="button" id="delbtn">삭제</a>
						  <a href="${path0 }/EditData.do?bno=${data.bno }">수정</a>
					  </c:if>
					 <a role="button" href="${path0 }/DataList.do" >목록</a>
					</div>
				</div>
		</section>
	</div>
<div id="footer" class="clr-fix">
	<%@ include file="/footer.jsp" %>		
</div>
<script>
	var delbtn = document.getElementById('delbtn');
	delbtn.addEventListener("click", function() {
		if(confirm("삭제 하시겠습니까?")) {
			location.replace("${path0 }/DeleteData.do?bno="+<%=request.getAttribute("bno")%>);
		}
	});
</script>
</body>
</html>