package org.gyeongju.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.gyeongju.dto.Data;

public class DataDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//자료실 목록
	public List<Data> getDataList(){
		List<Data> dataList = new ArrayList<>();
		MariaDB maria = new MariaDB();
		try {
			con = maria.connect();
			pstmt = con.prepareStatement(SqlLang.SELECT_ALL_DATA);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Data data = new Data(rs.getInt("bno"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getString("filename"),
						rs.getString("resdate"),
						rs.getInt("visited"));
				dataList.add(data);
			}
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			maria.close(con, pstmt, rs);
		}
		return dataList;
	}
	
	//자료실 상세보기
	public Data getData(int bno) {
		Data data = new Data();
		MariaDB maria = new MariaDB();
		
		try {
			con = maria.connect();
			pstmt = con.prepareStatement(SqlLang.VISITED_UPD_DATA);
			pstmt.setInt(1, bno);
			pstmt.executeUpdate();
			pstmt = null;
			pstmt = con.prepareStatement(SqlLang.SELECT_DATA_BYBNO);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				data.setBno(rs.getInt("bno"));
				data.setTitle(rs.getString("title"));
				data.setContent(rs.getString("content"));
				data.setFilename(rs.getString("filename"));
				data.setResdate(rs.getString("resdate"));
				data.setVisited(rs.getInt("visited"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			maria.close(con, pstmt, rs);
		}
		return data;
	}
	
	//자료 등록
	public int insData(Data data) {
		int cnt = 0;
		MariaDB maria = new MariaDB();
		try {
			con = maria.connect();
			pstmt = con.prepareStatement(SqlLang.INS_DATA);
			pstmt.setString(1, data.getTitle());
			pstmt.setString(2, data.getContent());
			pstmt.setString(3, data.getFilename());
			cnt = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			maria.close(con, pstmt);
		}
		return cnt;
	}
	
	public int editProData(Data data) {
		int cnt = 0;
		MariaDB maria = new MariaDB();
		try {
			con = maria.connect();
			pstmt = con.prepareStatement(SqlLang.UPD_DATA);
			pstmt.setString(1, data.getTitle());
			pstmt.setString(2, data.getContent());
			pstmt.setInt(3, data.getBno());
			cnt = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			maria.close(con, pstmt);
		}
		return cnt;
	}
	
	public int delData(int bno){
		int cnt = 0;
		MariaDB maria = new MariaDB();
		try {
			con = maria.connect();
			pstmt = con.prepareStatement(SqlLang.DEL_DATA);
			pstmt.setInt(1, bno);
			cnt = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			maria.close(con, pstmt);
		}
		return cnt;
	}

	public Data getData2(int bno) {
		Data data = new Data();
		MariaDB maria = new MariaDB();
		
		try {
			con = maria.connect();
			pstmt = null;
			pstmt = con.prepareStatement(SqlLang.SELECT_DATA_BYBNO);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				data.setBno(rs.getInt("bno"));
				data.setTitle(rs.getString("title"));
				data.setContent(rs.getString("content"));
				data.setFilename(rs.getString("filename"));
				data.setResdate(rs.getString("resdate"));
				data.setVisited(rs.getInt("visited"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			maria.close(con, pstmt, rs);
		}
		return data;
	}
}
