package org.gyeongju.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.gyeongju.dto.Community;



public class CommunityDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//문의하기 목록
	public List<Community> getQnaList(){
		List<Community> qnaList = new ArrayList<>();
		MariaDB maria = new MariaDB();
		try {
			con = maria.connect();
			pstmt = con.prepareStatement(SqlLang.SELECT_ALL_QNA);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Community com = new Community(
						rs.getInt("bno"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getString("aid"),
						rs.getString("filename"),
						rs.getString("resdate"),
						rs.getInt("visited"));
				qnaList.add(com);
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			maria.close(con, pstmt, rs);
		}
		return qnaList;
	}
	
	//공지사항 목록
		public List<Community> getNoticeList(){
			List<Community> noticeList = new ArrayList<>();
			MariaDB maria = new MariaDB();
			try {
				con = maria.connect();
				pstmt = con.prepareStatement(SqlLang.SELECT_ALL_NOTICE);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Community com = new Community(
							rs.getInt("bno"),
							rs.getString("title"),
							rs.getString("content"),
							rs.getString("aid"),
							rs.getString("filename"),
							rs.getString("resdate"),
							rs.getInt("visited"));
					noticeList.add(com);
				}
			} catch(Exception e){
				e.printStackTrace();
			} finally {
				maria.close(con, pstmt, rs);
			}
			return noticeList;
		}
	
	public Community getCommunity(int bno) {
		Community com = new Community();
		MariaDB maria = new MariaDB();
		
		try {
			con = maria.connect();
			pstmt = con.prepareStatement(SqlLang.VISITED_UPD_COMMUNITY);
			pstmt.setInt(1, bno);
			pstmt.executeUpdate();
			pstmt = null;
			pstmt = con.prepareStatement(SqlLang.SELECT_COMMUNITY_BYNO);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				com.setBno(rs.getInt("bno"));
				com.setTitle(rs.getString("title"));
				com.setContent(rs.getString("content"));
				com.setAid(rs.getString("aid"));
				com.setFilename(rs.getString("filename"));
				com.setResdate(rs.getString("resdate"));
				com.setVisited(rs.getInt("visited"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			maria.close(con, pstmt, rs);
		}
		return com;
	}
	
	public int insCommunity(Community com) {
		int cnt = 0;
		MariaDB maria = new MariaDB();
		try {
			con = maria.connect();
			pstmt = con.prepareStatement(SqlLang.INS_COMMUNITY);
			pstmt.setString(1, com.getTitle());
			pstmt.setString(2, com.getContent());
			pstmt.setString(3, com.getAid());
			pstmt.setString(4, com.getFilename());
			cnt = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			maria.close(con, pstmt);
		}
		return cnt;
	}
	
	public int editProCommunity(Community com) {
		int cnt = 0;
		MariaDB maria = new MariaDB();
		try {
			con = maria.connect();
			pstmt = con.prepareStatement(SqlLang.UPD_COMMUNITY);
			pstmt.setString(1, com.getTitle());
			pstmt.setString(2, com.getContent());
			pstmt.setInt(3, com.getBno());
			pstmt.setString(4, com.getFilename());
			cnt = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			maria.close(con, pstmt);
		}
		return cnt;
	}
	
	public int delCommunity(int bno){
		int cnt = 0;
		MariaDB maria = new MariaDB();
		try {
			con = maria.connect();
			pstmt = con.prepareStatement(SqlLang.DEL_COMMUNITY);
			pstmt.setInt(1, bno);
			cnt = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			maria.close(con, pstmt);
		}
		return cnt;
	}

	public Community getCommunity2(int no) {
		Community com = new Community();
		MariaDB maria = new MariaDB();
		
		try {
			con = maria.connect();
			pstmt = null;
			pstmt = con.prepareStatement(SqlLang.SELECT_COMMUNITY_BYNO);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				com.setBno(rs.getInt("bno"));
				com.setTitle(rs.getString("title"));
				com.setContent(rs.getString("content"));
				com.setAid(rs.getNString("aid"));
				com.setFilename(rs.getNString("filename"));
				com.setResdate(rs.getString("resdate"));
				com.setVisited(rs.getInt("visited"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			maria.close(con, pstmt, rs);
		}
		return com;
	}
	
	//상위 4개 공지사항
	public List<Community> newNotice() {
		List<Community> newNoti = new ArrayList<>();
		MariaDB maria = new MariaDB();
		try {
			con = maria.connect();
			pstmt = con.prepareStatement(SqlLang.LATEST_NOTICE);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Community com = new Community(
						rs.getInt("bno"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getString("aid"),
						rs.getString("filename"),
						rs.getString("resdate"),
						rs.getInt("visited"));
				newNoti.add(com);
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			maria.close(con, pstmt, rs);
		}
		return newNoti;
	}
	/*
	//문의하기 목록
		public List<Community> getQnaList(){
			List<Community> qnaList = new ArrayList<>();
			OracleDB oracle = new OracleDB();
			try {
				con = oracle.connect();
				pstmt = con.prepareStatement(SqlLang.SELECT_ALL_QNA);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Community com = new Community(
							rs.getInt("bno"),
							rs.getString("title"),
							rs.getString("content"),
							rs.getString("aid"),
							rs.getString("filename"),
							rs.getString("resdate"),
							rs.getInt("visited"));
					qnaList.add(com);
				}
			} catch(Exception e){
				e.printStackTrace();
			} finally {
				oracle.close(con, pstmt, rs);
			}
			return qnaList;
		}
		
		//공지사항 목록
			public List<Community> getNoticeList(){
				List<Community> noticeList = new ArrayList<>();
				OracleDB oracle = new OracleDB();
				try {
					con = oracle.connect();
					pstmt = con.prepareStatement(SqlLang.SELECT_ALL_NOTICE);
					rs = pstmt.executeQuery();
					while(rs.next()) {
						Community com = new Community(
								rs.getInt("bno"),
								rs.getString("title"),
								rs.getString("content"),
								rs.getString("aid"),
								rs.getString("filename"),
								rs.getString("resdate"),
								rs.getInt("visited"));
						noticeList.add(com);
					}
				} catch(Exception e){
					e.printStackTrace();
				} finally {
					oracle.close(con, pstmt, rs);
				}
				return noticeList;
			}
		
		public Community getCommunity(int bno) {
			Community com = new Community();
			OracleDB oracle = new OracleDB();
			
			try {
				con = oracle.connect();
				pstmt = con.prepareStatement(SqlLang.VISITED_UPD_COMMUNITY);
				pstmt.setInt(1, bno);
				pstmt.executeUpdate();
				pstmt = null;
				pstmt = con.prepareStatement(SqlLang.SELECT_COMMUNITY_BYNO);
				pstmt.setInt(1, bno);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					com.setBno(rs.getInt("bno"));
					com.setTitle(rs.getString("title"));
					com.setContent(rs.getString("content"));
					com.setAid(rs.getString("aid"));
					com.setFilename(rs.getString("filename"));
					com.setResdate(rs.getString("resdate"));
					com.setVisited(rs.getInt("visited"));
				}
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				oracle.close(con, pstmt, rs);
			}
			return com;
		}
		
		public int insCommunity(Community com) {
			int cnt = 0;
			OracleDB oracle = new OracleDB();
			try {
				con = oracle.connect();
				pstmt = con.prepareStatement(SqlLang.INS_COMMUNITY);
				pstmt.setString(1, com.getTitle());
				pstmt.setString(2, com.getContent());
				pstmt.setString(3, com.getAid());
				pstmt.setString(4, com.getFilename());
				cnt = pstmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				oracle.close(con, pstmt);
			}
			return cnt;
		}
		
		public int editProCommunity(Community com) {
			int cnt = 0;
			OracleDB oracle = new OracleDB();
			try {
				con = oracle.connect();
				pstmt = con.prepareStatement(SqlLang.UPD_COMMUNITY);
				pstmt.setString(1, com.getTitle());
				pstmt.setString(2, com.getContent());
				pstmt.setInt(3, com.getBno());
				pstmt.setString(4, com.getFilename());
				cnt = pstmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				oracle.close(con, pstmt);
			}
			return cnt;
		}
		
		public int delCommunity(int bno){
			int cnt = 0;
			OracleDB oracle = new OracleDB();
			try {
				con = oracle.connect();
				pstmt = con.prepareStatement(SqlLang.DEL_COMMUNITY);
				pstmt.setInt(1, bno);
				cnt = pstmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				oracle.close(con, pstmt);
			}
			return cnt;
		}

		public Community getCommunity2(int no) {
			Community com = new Community();
			OracleDB oracle = new OracleDB();
			
			try {
				con = oracle.connect();
				pstmt = null;
				pstmt = con.prepareStatement(SqlLang.SELECT_COMMUNITY_BYNO);
				pstmt.setInt(1, no);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					com.setBno(rs.getInt("bno"));
					com.setTitle(rs.getString("title"));
					com.setContent(rs.getString("content"));
					com.setAid(rs.getNString("aid"));
					com.setFilename(rs.getNString("filename"));
					com.setResdate(rs.getString("resdate"));
					com.setVisited(rs.getInt("visited"));
				}
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				oracle.close(con, pstmt, rs);
			}
			return com;
		}
		
		//상위 4개 공지사항
		public List<Community> newNotice() {
			List<Community> newNoti = new ArrayList<>();
			OracleDB oracle = new OracleDB();
			try {
				con = oracle.connect();
				pstmt = con.prepareStatement(SqlLang.LATEST_NOTICE);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Community com = new Community(
							rs.getInt("bno"),
							rs.getString("title"),
							rs.getString("content"),
							rs.getString("aid"),
							rs.getString("filename"),
							rs.getString("resdate"),
							rs.getInt("visited"));
					newNoti.add(com);
				}
			} catch(Exception e){
				e.printStackTrace();
			} finally {
				oracle.close(con, pstmt, rs);
			}
			return newNoti;
		}*/
}