package org.gyeongju.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.gyeongju.dto.Food;

public class FoodDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//식도락 목록
	public List<Food> getFoodList(int curPage) {
		List<Food> foodList = new ArrayList<>();
		MariaDB oracle = new MariaDB();
		try {
			con = oracle.connect();
			pstmt = con.prepareStatement(SqlLang.SELECT_ALL_FOOD);
			
			pstmt.setInt(1, ((curPage-1)*9));
			rs = pstmt.executeQuery();
			
		while(rs.next()) {
				Food food = new Food(rs.getInt("fno"),
						rs.getString("fname"),
						rs.getString("ftype"),
						rs.getString("ftel"),
						rs.getString("faddr"),
						rs.getString("fcomm"),
						rs.getString("filename")
						);
				foodList.add(food);
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			oracle.close(con, pstmt, rs);
		}
		
		return foodList;
	}
	
	//음식점 목록
	public List<Food> getRestList(int curPage) {
		List<Food> restList = new ArrayList<>();
		MariaDB oracle = new MariaDB();
		try {
			con = oracle.connect();
			pstmt = con.prepareStatement(SqlLang.SELECT_FOOD_REST);
			pstmt.setInt(1, ((curPage-1)*9));
			rs = pstmt.executeQuery();
			
		while(rs.next()) {
				Food food = new Food(rs.getInt("fno"),
						rs.getString("fname"),
						rs.getString("ftype"),
						rs.getString("ftel"),
						rs.getString("faddr"),
						rs.getString("fcomm"),
						rs.getString("filename")
						);
				restList.add(food);
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			oracle.close(con, pstmt, rs);
		}
		
		return restList;
	}
	
	//카페 목록
	public List<Food> getCafeList(int curPage) {
		List<Food> cafeList = new ArrayList<>();
		MariaDB oracle = new MariaDB();
		try {
			con = oracle.connect();
			pstmt = con.prepareStatement(SqlLang.SELECT_FOOD_CAFE);
			pstmt.setInt(1, ((curPage-1)*9));
			rs = pstmt.executeQuery();
			
		while(rs.next()) {
				Food food = new Food(rs.getInt("fno"),
						rs.getString("fname"),
						rs.getString("ftype"),
						rs.getString("ftel"),
						rs.getString("faddr"),
						rs.getString("fcomm"),
						rs.getString("filename")
						);
				cafeList.add(food);
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			oracle.close(con, pstmt, rs);
		}
		
		return cafeList;
	}
	
	//기타 목록
	public List<Food> getEtcList(int curPage) {
		List<Food> etcList = new ArrayList<>();
		MariaDB oracle = new MariaDB();
		try {
			con = oracle.connect();
			pstmt = con.prepareStatement(SqlLang.SELECT_FOOD_ETC);
			pstmt.setInt(1, ((curPage-1)*9));
			rs = pstmt.executeQuery();
			
		while(rs.next()) {
				Food food = new Food(rs.getInt("fno"),
						rs.getString("fname"),
						rs.getString("ftype"),
						rs.getString("ftel"),
						rs.getString("faddr"),
						rs.getString("fcomm"),
						rs.getString("filename")
						);
				etcList.add(food);
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			oracle.close(con, pstmt, rs);
		}
		
		return etcList;
	}
	
	
	//식도락 상세보기
	public Food getFood(int fno) {
		Food food = new Food();
		MariaDB oracle = new MariaDB();
		
		try {
			con = oracle.connect();
			
			pstmt = con.prepareStatement(SqlLang.SELECT_FOOD_BYNO);
			pstmt.setInt(1, fno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				food.setFno(rs.getInt("fno"));
				food.setFname(rs.getString("fname"));
				food.setFtype(rs.getString("ftype"));
				food.setFtel(rs.getString("ftel"));
				food.setFaddr(rs.getString("faddr"));
				food.setFcomm(rs.getString("fcomm"));
				food.setFilename(rs.getString("filename"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			oracle.close(con, pstmt, rs);
		}
		return food;
	}
	
	//식도락 등록
	public int insertFood(Food food) {
		int cnt = 0;
		MariaDB oracle = new MariaDB();
		try {
			con = oracle.connect();
			pstmt = con.prepareStatement(SqlLang.INS_FOOD);
			pstmt.setString(1, food.getFname());
			pstmt.setString(2, food.getFtype());
			pstmt.setString(3, food.getFtel());
			pstmt.setString(4, food.getFaddr());
			pstmt.setString(5, food.getFcomm());
			pstmt.setString(6,  food.getFilename());
			cnt = pstmt.executeUpdate();
			
			//파일 처리 추가
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			oracle.close(con, pstmt);
		}
		return cnt;
	}
	
	//식도락 수정
	public int updateFood(Food food) {
		int cnt = 0;
		MariaDB oracle = new MariaDB();
		try {
			con = oracle.connect();
			//String UPD_FOOD = "update food set fname=?, ftype=?, ftel=?, faddr=?, fcomm=? where no=?";
			pstmt = con.prepareStatement(SqlLang.UPD_FOOD);
			pstmt.setString(1, food.getFname());
			pstmt.setString(2, food.getFtype());
			pstmt.setString(3, food.getFtel());
			pstmt.setString(4, food.getFaddr());
			pstmt.setString(5, food.getFcomm());
			pstmt.setInt(6, food.getFno());
			cnt = pstmt.executeUpdate();
			
			//파일 처리 추가
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			oracle.close(con, pstmt);
		}
		return cnt;
	}
	
	//식도락 삭제
	public int deleteFood(int fno) {
		int cnt = 0;
		MariaDB oracle = new MariaDB();
		try {
			con = oracle.connect();
			pstmt = con.prepareStatement(SqlLang.DEL_FOOD);
			pstmt.setInt(1, fno);
			
			
			cnt = pstmt.executeUpdate();
			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			oracle.close(con, pstmt);
		}
		return cnt;
	}
	
	//식도락 레코드 개수
	public int cntPage(String ftype) {
		int rcnt = 0;
		int pcnt = 0;
		MariaDB oracle = new MariaDB();
		try {
			con = oracle.connect();
			if (ftype.equals("all")) {
				pstmt = con.prepareStatement(SqlLang.CNT_ALL_FOOD);
			} else if (ftype.equals("rest")) {
				pstmt = con.prepareStatement(SqlLang.CNT_ALL_FOOD + " where ftype='음식점'");
			} else if (ftype.equals("cafe")) {
				pstmt = con.prepareStatement(SqlLang.CNT_ALL_FOOD + " where ftype='카페'");
			} else {
				pstmt = con.prepareStatement(SqlLang.CNT_ALL_FOOD + " where ftype='기타'");
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
			oracle.close(con, pstmt);
		}
		return pcnt;
	}
}
