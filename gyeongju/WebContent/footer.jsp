<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="path0" value="<%=request.getContextPath() %>" /> 
<style>
	#ft { width: 100%; height: 300px; background: rgba(34,34,34,1); opacity: 1;  position: absolute; overflow: hidden; margin-top:150px; min-width:1400px;}
.ft_box { clear:both; width:1400px; margin: 0 auto;}
.ft_logo { position: absolute; top: 140px; left: 260px;}
.line { width: 1400px; height: 1px; background: rgba(255,255,255,0.10000000149011612); position: absolute; top: 104px; left: 260px;}
.ft_txt { width: 230px; height: 24px; position: absolute; top: 135px; left: 410px;}
.terms { color: #999; position: absolute; font-family: Noto Sans KR; font-weight: 600; font-size: 14pt; text-align: left;}
.Personal { color:#FFF; left: 80px; position: absolute; font-family: Noto Sans KR; font-weight: 400; font-size: 14pt; text-align: left;}

.icons { position: absolute; top: 37px; left: 262px;}
.icon2 { margin-left: 20px;}
.icon3 { margin-left: 20px;}
.icon4 { margin-left: 20px;}

#btn3 { float:right; margin-top: 38px; right: -10px;}
#btn3 p a { padding: 6px 20px; border: 1px solid #666; color:#FFF; border-radius: 5px; font-family: Noto Sans KR; font-size:14pt; font-weight: 600;}
#btn3 p a:hover { border: 1px solid #999; color:#ef7070; }

.copyright { color: #666; position: absolute; font-family: Noto Sans KR; font-weight: 400; font-size: 12.4pt; top: 198px; left: 261px;}
.subscription { color: #777; position: absolute; top: 38px; left: 1268px; font-family: Noto Sans KR; font-weight: DemiLight; font-size: 16pt;}
</style>
<footer id="ft">
	<div class="ft_box">
      <a href="${path0 }" class="ft_logo"><img src="${path0 }/images/logo2.png" alt="로고"></a>
      <div class="icons">
        <a href="https://www.facebook.com/gj.tour1/" class="icon1"><img src="${path0 }/images/icon1.png" alt="페이스북"></a>
        <a href="https://www.instagram.com/gj_tour/" class="icon2"><img src="${path0 }/images/icon2.png" alt="인스타그램"></a>
        <a href="https://blog.naver.com/gj_tour" class="icon3"><img src="${path0 }/images/icon3.png" alt="블로그"></a>
        <a href="https://www.youtube.com/channel/UCQh-jbXM1DkVnC8vUYqfkVw" class="icon4"><img src="${path0 }/images/icon4.png" alt="유튜브"></a>
    </div>
      <div class="ft_txt">
        <a href="${path0 }/member/term2.jsp" class="Personal">개인정보처리방침</a>
        <a href="${path0 }/member/policy.jsp" class="terms">회원약관</a>
      </div>
      <a href="https://www.youtube.com/channel/UCQh-jbXM1DkVnC8vUYqfkVw" class="subscription">경주관광 정보 & 소식 구독</a>
      <div id="btn3">
        <p><a href="https://knto.or.kr/index">관광 안내</a></p>
      </div>
      <span class="copyright">38102 경상북도 경주시 양정로 260 (동천동, 경주시청)<br>
                              © COPYRIGHT 2019 Gyeongju Tourguide. All rights reserved.</span>
      <div class="line"></div>
    </div>
</footer>