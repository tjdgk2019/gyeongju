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
 
	#header #hd #gnb a.dp { color:#101010;} 
	 
	* {margin: 0;padding: 0;}
	body,html {width: 100%; }
	a { text-decoration: none;}
	ol { list-style: none; }
	
	#contents {margin-top:160px;}
	
	hr { box-sizing:content-box; margin-bottom:30px; }
	
	#contents { width:100%; min-height:calc(100vh - 610px);  box-sizing:border-box; min-width:1200px; margin-top:160px;}
	#contents .page { clear:both; width:1200px; margin:0 auto;}
	.page .page-title { width:50%; margin-top : 2rem; margin-bottom:1.5rem; padding-left:20px; font-family: 'HSBombaram'; font-size:40px; letter-spacing:3px; display:inline-block; box-sizing:border-box;}
	
	
	#table { width: 1000px; margin: 0 auto; }
	#table * {font-family: Noto Sans KR;}
	#table td {padding-bottom:10px; }
	#table input:not([type=file]) {width:100%; height:40px; padding:10px;  border:1px solid #101010;  font-size:16px;}
	#table textarea {width:100%; height:200px; resize:none; padding:10px; font-size:16px;}
	#table .td-filename .btn-upload {width:100px; text-align:center; padding:5px; display:inline-block;
		border:1px solid #6b717b; border-radius:3px;}
	#table .td-filename #filename {width:500px; padding-left:10px; font-size:14px; text-align:left;}
	#table .td-filename #filename::file-selector-button {display:none;}
	#table .td-submit .btn-group { width:300px; margin:0 auto; text-align:center;}
	#table .td-submit #submit {display:inline-block;  border:none; text-align:center; padding:7px 20px; border-radius:30px; margin-left:3px; 
		background-color:#333; color:#fff; font-size:20px; font-weight:500;font-family: Noto Sans KR;}
	#table .td-submit .btn-back {display:inline-block;  border:none; text-align:center; padding:7px 20px; border-radius:30px; margin-left:3px; 
		background-color:#595959; color:#fff; font-size:20px; font-weight:500; }
	
	
	#btn_group {  margin: 5% auto; width: 100%; display: block; float: left; }
	.btn-primar, .btn-secondary { }
	
	.bread-crumb {display:inline-block; width:49%; height:40px; text-align:right; padding-right:10px; margin-top:20px; margin-bottom:20px; box-sizing:border-box;}
	#contents .bread-crumb li {display:inline-block; line-height:40px; color:#b8b8b8;}
	#contents .bread-crumb li a {color:#666;}
	.bread-crumb li a:hover {text-decoration:underline;}
	.bread-crumb li:last-child a {font-weight:500; color:#595959;}
</style>
<!-- include -->
</head>
<body>
<%
	String sid = (String) session.getAttribute("sid");
	if(sid == null) {
		response.sendRedirect("/gyeongju/Login.do");
	} 
%>	
	
<div id="header" class="clr-fix">
	<%@ include file="/header.jsp" %>		
</div>
<div id="contents" class="clr-fix">	
	
	<section class="page">
		<h2 class="page-title">자료실</h2>
		
		<div class="bread-crumb">
			<ul>
				<li><a href="${path0 }/">홈</a>  >  </li>
				<li><a >고객지원</a>  >  </li>
				<li><a href="${path0 }/DataList.do">자료실</a>   >  </li>
				<li><a href="${path0 }/DataInsert.do">등록</a></li>
			</ul>
		</div>
		<hr>
		<form action="${path0 }/DataInsertPro.do" method="post" enctype="multipart/form-data" >
			<table id="table">
				<tr>
					<td><input type="text" name="title" id="title" maxlength="100" required placeholder="제목" /></td>
				</tr>
				<tr>
					<td><textarea  name="content" id="content" required placeholder="내용을 입력하세요"></textarea></td>
				</tr>
				<tr>
					<td class="td-filename">
					<label for="filename">
								<div class="btn-upload">파일 첨부</div>
						</label>
					<input required type="file" name="filename" id="filename" accept=".jpg, .png, .jpeg, .svg, .PNG, .JPG, .JPEG, .SVG, .hwp, .pdf, .xls, .xlsx, .ppt, .pptx, .doc, .docx, .zip, .txt"/>
					</td>
				</tr>
				<tr>
						<td class="td-submit">
							<div class="btn-group">
								<a class="btn-back" href="${path0 }/DataList.do">취소</a>
								<button id="submit" type="submit">등록</button>
							</div>
							
						</td>
					</tr>
			</table>
		</form>
		
	</section>
</div>
<div id="footer" class="clr-fix">
	<%@ include file="/footer.jsp" %>		
</div>
</body>
</html>