package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bbs.Bbs;


public class UserDAO {

	private Connection conn;//데이터 접근 객체
	private PreparedStatement pstmt;
	private ResultSet rs;//어떠한 정보를 담을 수 있는 객체
	
	//생성자 mysql 접속 부분
	public UserDAO(){
		try{
			String dbURL = "jdbc:mysql://localhost:3306/BBS?useUnicode=true&characterEncoding=utf8";
			String dbID ="root";
			String dbPassword = "root";
			Class.forName("com.mysql.jdbc.Driver");//접속 라이브러리
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword); //conn 객체 안에 mysql Dㅠ가 담김
			
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	
	
	
	//로그인시도 함수
	public int login(String userID, String userPassword){
		String SQL ="SELECT userPassword FROM USER WHERE userID = ?";
		try{
			pstmt = conn.prepareStatement(SQL); //정해진 SQL문을 인스턴스를 가져옴
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()){
				if(rs.getString(1).equals(userPassword)){
					return 1; //로그인 성공
				}
				else 
					return 0; //비밀번호 불일치
			}
				return -1; //아이디가 없다.
		} catch (Exception e){
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류
	}
	
	//아이디 중복체크
	public int idCheck(String userID){
		String SQL="select userId from user where userId = ?";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()){
				return 1; //중복아이디
			}
			else 
				return -1; //등록 가능
	} catch (Exception e){
		e.printStackTrace();
	}
	return -2; //데이터베이스 오류
}

		
	
	//로그인 회원가입
	public int join(User user){
		String SQL ="INSERT INTO USER VALUES (?,?,?,?,?,?,?,?)";
		try{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserEmail());
			pstmt.setString(5, user.getuserZipCode());
			pstmt.setString(6, user.getUserAddress());
			pstmt.setString(7, user.getUserPhone());
			pstmt.setInt(8, user.getIsAdmin());
			return pstmt.executeUpdate();
		} catch(Exception e){
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	//user 데이터 가져오기
	
	public User getUser(String userID){
		String SQL = "SELECT * from USER WHERE userID = ?";
		try{
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()){
				User user = new User();
				user.setUserID(rs.getString(1));
				user.setUserPassword(rs.getString(2));
				user.setUserAddress(rs.getString(5));
				user.setUserName(rs.getString(3));
				user.setUserEmail(rs.getString(4));
				user.setUserPhone(rs.getString(6));
				user.setIsAdmin(rs.getInt(8));
				return user;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	
	//회원수정
	public int userUpdate(String userID, String userPassword, String userName, String userAddress, String userZipCode,  String userEmail, String userPhone ) {
		String SQL="update user set userPassword = ?, userName = ?,  userEmail = ?, userZipCode =?, userAddress = ?, userPhone = ? where userID = ?";//특정한 아이디에 해당하는 제목과 내용을 바꿔준다. 
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, userPassword);
			pstmt.setString(2, userName);
			pstmt.setString(3, userEmail);
			pstmt.setString(5, userAddress);
			pstmt.setString(4, userZipCode);
			pstmt.setString(6, userPhone);
			pstmt.setString(7, userID);
			return pstmt.executeUpdate();		
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}
	
//회원 삭제
	public int delete(String userID) {
		String SQL="delete from user where userID = ?";//아이디 삭제 
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			return pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
			
		}
		return -1;//데이터베이스 오류
	}	
	
	//회원 리스트
	public ArrayList<User> getList(String userID){ 
		String SQL = "select userID, userName, userEmail, userPhone, isAdmin from user ";
		ArrayList<User> list = new ArrayList<User>();
		
		try{
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			
			rs=pstmt.executeQuery();//select
			
			while (rs.next()){ //게시글 목록을 담기
				User user = new User();
	        	user.setUserID(rs.getString(1));
	        	user.setUserName(rs.getString(2));
	        	user.setUserEmail(rs.getString(3));
	        	user.setUserPhone(rs.getString(4));
	        	user.setIsAdmin(rs.getInt(5));
				list.add(user);//게시글 번호 1씩 늘어남
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;// 게시판 리스트 글
	}
	
	
	/*//회원 검색 기능 리스트
	public ArrayList<User> getSearch(String userID, String userName, String searchField, String searchText){//특정한 리스트를 받아서 반환
	      ArrayList<User> list = new ArrayList<User>();
	      String SQL ="select * from userNo WHERE "+searchField.trim();
	      try {
	            if(searchText != null && !searchText.equals("") ){
	                SQL +=" LIKE '%"+searchText.trim()+"%' order by userID desc limit 10";
	            }
	            PreparedStatement pstmt=conn.prepareStatement(SQL);
				rs=pstmt.executeQuery();//select
	         while(rs.next()) {
	        	 User user = new User();
		        	user.setUserID(rs.getString(1));
		        	user.setUserName(rs.getString(2));
		        	user.setUserEmail(rs.getString(3));
		        	user.setUserPhone(rs.getString(4));
		        	user.setIsAdmin(rs.getInt(5));
	            list.add(user);//list에 해당 인스턴스를 담는다.
	         }         
	      } catch(Exception e) {
	         e.printStackTrace();
	      }
	      return list;
	   }
	*/

	
	
	}