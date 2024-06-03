package org.gyeongju.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.gyeongju.dto.Place;

public class PlaceDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//장소 목록
	public List<Place> getPlaceList(int curPage) {
		List<Place> placeList = new ArrayList<>();
		MariaDB maria = new MariaDB();
		try {
			con = maria.connect();
			pstmt = con.prepareStatement(SqlLang.SELECT_ALL_PLACE);
			
			pstmt.setInt(1, ((curPage-1)*9));
			
			rs = pstmt.executeQuery();
			
		while(rs.next()) {
				Place place = new Place(rs.getInt("pno"),
						rs.getString("pname"),
						rs.getString("ptype"),
						rs.getString("ptel"),
						rs.getString("paddr"),
						rs.getString("pcomm"),
						rs.getString("filename"),
						rs.getString("item")
						);
				placeList.add(place);
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			maria.close(con, pstmt, rs);
		}
		
		return placeList;
	}
	
	//문화재 목록
	public List<Place> getCurturalList(int curPage) {
		List<Place> curturalList = new ArrayList<>();
		MariaDB maria = new MariaDB();
		try {
			con = maria.connect();
			pstmt = con.prepareStatement(SqlLang.SELECT_PLACE_CULTURAL);
			pstmt.setInt(1, ((curPage-1)*9));
			rs = pstmt.executeQuery();
			
		while(rs.next()) {
				Place place = new Place(rs.getInt("pno"),
						rs.getString("pname"),
						rs.getString("ptype"),
						rs.getString("ptel"),
						rs.getString("paddr"),
						rs.getString("pcomm"),
						rs.getString("filename"),
						rs.getString("item")
						);
				curturalList.add(place);
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			maria.close(con, pstmt, rs);
		}
		
		return curturalList;
	}
	
	//테마파크 목록
	public List<Place> getThemeList(int curPage) {
		List<Place> themeList = new ArrayList<>();
		MariaDB maria = new MariaDB();
		try {
			con = maria.connect();
			pstmt = con.prepareStatement(SqlLang.SELECT_PLACE_THEME);
			pstmt.setInt(1, ((curPage-1)*9));
			rs = pstmt.executeQuery();
			
		while(rs.next()) {
				Place place = new Place(rs.getInt("pno"),
						rs.getString("pname"),
						rs.getString("ptype"),
						rs.getString("ptel"),
						rs.getString("paddr"),
						rs.getString("pcomm"),
						rs.getString("filename"),
						rs.getString("item")
						);
				themeList.add(place);
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			maria.close(con, pstmt, rs);
		}
		
		return themeList;
	}
	
	//기타 목록
	public List<Place> getEtcList(int curPage) {
		List<Place> etcList = new ArrayList<>();
		MariaDB maria = new MariaDB();
		try {
			con = maria.connect();
			pstmt = con.prepareStatement(SqlLang.SELECT_PLACE_ETC);
			pstmt.setInt(1, ((curPage-1)*9));
			rs = pstmt.executeQuery();
			
		while(rs.next()) {
				Place place = new Place(rs.getInt("pno"),
						rs.getString("pname"),
						rs.getString("ptype"),
						rs.getString("ptel"),
						rs.getString("paddr"),
						rs.getString("pcomm"),
						rs.getString("filename"),
						rs.getString("item")
						);
				etcList.add(place);
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			maria.close(con, pstmt, rs);
		}
		
		return etcList;
	}
	
	
	//장소 상세보기
	public Place getPlace(int pno) {
		Place place = new Place();
		MariaDB maria = new MariaDB();
		
		try {
			con = maria.connect();
			
			pstmt = con.prepareStatement(SqlLang.SELECT_PLACE_BYNO);
			pstmt.setInt(1, pno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				place.setPno(rs.getInt("pno"));
				place.setPname(rs.getString("pname"));
				place.setPtype(rs.getString("ptype"));
				place.setPtel(rs.getString("ptel"));
				place.setPaddr(rs.getString("paddr"));
				place.setPcomm(rs.getString("pcomm"));
				place.setFilename(rs.getString("filename"));
				place.setItem(rs.getString("item"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			maria.close(con, pstmt, rs);
		}
		return place;
	}
	
	//장소 등록
	public int insertPlace(Place place) {
		int cnt = 0;
		MariaDB maria = new MariaDB();
		try {
			con = maria.connect();
			pstmt = con.prepareStatement(SqlLang.INS_PLACE);
			pstmt.setString(1, place.getPname());
			pstmt.setString(2, place.getPtype());
			pstmt.setString(3, place.getPtel());
			pstmt.setString(4, place.getPaddr());
			pstmt.setString(5, place.getPcomm());
			pstmt.setString(6,  place.getFilename());
			pstmt.setString(7, place.getItem());
			cnt = pstmt.executeUpdate();
			
			//파일 처리 추가
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			maria.close(con, pstmt);
		}
		return cnt;
	}
	
	//장소 수정
	public int updatePlace(Place place) {
		int cnt = 0;
		MariaDB maria = new MariaDB();
		try {
			con = maria.connect();
			//String UPD_FOOD = "update place set pname=?, ptype=?, ptel=?, paddr=?, pcomm=? where pno=?";
			pstmt = con.prepareStatement(SqlLang.UPD_PLACE);
			pstmt.setString(1, place.getPname());
			pstmt.setString(2, place.getPtype());
			pstmt.setString(3, place.getPtel());
			pstmt.setString(4, place.getPaddr());
			pstmt.setString(5, place.getPcomm());
			pstmt.setString(6,  place.getItem());
			pstmt.setInt(7, place.getPno());
			cnt = pstmt.executeUpdate();
			
			//파일 처리 추가
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			maria.close(con, pstmt);
		}
		return cnt;
	}
	
	//장소 삭제
	public int deletePlace(int pno) {
		int cnt = 0;
		MariaDB mysql = new MariaDB();
		try {
			con = mysql.connect();
			pstmt = con.prepareStatement(SqlLang.DEL_PLACE);
			pstmt.setInt(1, pno);
			cnt = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			mysql.close(con, pstmt);
		}
		return cnt;
	}
	
	//여기어때 레코드 개수
	public int cntPage(String ptype) {
		int rcnt = 0;
		int pcnt = 0;
		MariaDB maria = new MariaDB();
		try {
			con = maria.connect();
			if (ptype.equals("all")) {
				pstmt = con.prepareStatement(SqlLang.CNT_ALL_PLACE);
			} else if (ptype.equals("curtural")) {
				pstmt = con.prepareStatement(SqlLang.CNT_ALL_PLACE + " where ptype='문화재'");
			} else if (ptype.equals("theme")) {
				pstmt = con.prepareStatement(SqlLang.CNT_ALL_PLACE + " where ptype='테마파크/공원'");
			} else {
				pstmt = con.prepareStatement(SqlLang.CNT_ALL_PLACE + " where ptype='기타'");
			}
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				rcnt = rs.getInt("count(*)");
			}
			
			if (rcnt%9 != 0) {
				pcnt = rcnt/9 + 1;
			} else {
				pcnt = rcnt/9;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			maria.close(con, pstmt);
		}
		return pcnt;
	}
}
