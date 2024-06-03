package org.gyeongju.dao;

public interface SqlLang {
	//식도락
	//String SELECT_ALL_FOOD = "select * from food order by fno desc";
	String SELECT_ALL_FOOD = "select * from food order by fno desc limit ?, 9";
	String SELECT_FOOD_BYNO = "select * from food where fno=?";
	String SELECT_FOOD_REST = "select * from food where ftype='음식점' order by fno desc limit ?, 9";
	String SELECT_FOOD_CAFE = "select * from food where ftype='카페' order by fno desc limit ?, 9";
	String SELECT_FOOD_ETC = "select * from food where ftype='기타' order by fno desc limit ?, 9";
	String UPD_FOOD = "update food set fname=?, ftype=?, ftel=?, faddr=?, fcomm=? where fno=?";
	String INS_FOOD = "insert into food values(default, ?, ?, ?, ?, null, ?, ?)";
	String DEL_FOOD = "delete from food where fno=?";
	String CNT_ALL_FOOD = "select count(*) from food";
	
	//여기어때
	String SELECT_ALL_PLACE = "select * from place order by pno desc limit ?, 9";
	String SELECT_PLACE_BYNO = "select * from place where pno=?";
	String SELECT_PLACE_CULTURAL = "select * from place where ptype='문화재' order by pno desc limit ?, 9";
	String SELECT_PLACE_THEME = "select * from place where ptype='테마파크/공원' order by pno desc limit ?, 9";
	String SELECT_PLACE_ETC = "select * from place where ptype='기타' order by pno desc limit ?, 9";
	String UPD_PLACE = "update place set pname=?, ptype=?, ptel=?, paddr=?, pcomm=?, item=? where pno=?";
	String INS_PLACE = "insert into place values(default, ?, ?, ?, ?, null, ?, ?, ?)";
	String DEL_PLACE = "delete from place where pno=?";
	String CNT_ALL_PLACE = "select count(*) from place";
	
	//회원관리
	String SELECT_ALL_MEMBER = "select * from member order by regdate desc";
	String SELECT_ONE_MEMBER = "select * from member where id=?";
	String INS_MEMBER = "insert into member values(?, ?, ?, ?, ?, ?, default)";
	String UPD_MEMBER = "update member set pw=?, email=?, tel=?, postcode=?, address=? where id=?";
	String DEL_MEMBER = "delete from member where id=?";
	
	//커뮤니티
	//문의하기
	String SELECT_ALL_QNA = "select * from community where not aid='admin' order by resdate desc";
	//공지사항
	String SELECT_ALL_NOTICE = "select * from community where aid='admin' order by resdate desc";
	String LATEST_NOTICE = "select * from community where aid='admin' order by resdate desc limit 0, 4";
	//Oracle
	//String LATEST_NOTICE = "select * from (select rownum rnum, c.* from community c where aid='admin' order by resdate desc) where rownum between 1 and 4";
	//공용
	String SELECT_COMMUNITY_BYNO = "select * from community where bno=?";
	String INS_COMMUNITY = "insert into community values(default, ?, ?, ?, ?, default, 0)";
	//Oracle
	//String INS_COMMUNITY = "insert into community values(comm_seq.nextval, ?, ?, ?, ?, default, 0)";
	String UPD_COMMUNITY = "update community set title=?, content=? where bno=?";
	String DEL_COMMUNITY = "delete from community where bno=?";
	String VISITED_UPD_COMMUNITY = "update community set visited=visited+1 where bno=?";

	//자료실
	String SELECT_ALL_DATA = "select * from data order by resdate desc";
	String VISITED_UPD_DATA = "update data set visited=visited+1 where bno=?";
	String SELECT_DATA_BYBNO = "select * from data where bno=?";
	String INS_DATA = "insert into data values(default, ?, ?, ?, default, default)";
	String UPD_DATA = "update data set title=?, content=? where bno=?";
	String DEL_DATA = "delete from data where bno=?";
}
