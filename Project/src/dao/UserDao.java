package dao;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.xml.bind.DatatypeConverter;

import model.User;

public class UserDao {
	public User findByLoginInfo(String loginId, String password) {
        Connection conn = null;
        try {
        	 conn = DBManager.getConnection();

        	 String sql = "SELECT * FROM user WHERE login_id = ? and password = ?";

        	 PreparedStatement pStmt = conn.prepareStatement(sql);
             pStmt.setString(1, loginId);
             pStmt.setString(2, encryption(password));
             ResultSet rs = pStmt.executeQuery();

             if (!rs.next()) {
                 return null;
             }

             String loginIdData = rs.getString("login_id");
             String nameData = rs.getString("name");
             return new User(loginIdData, nameData);

         } catch (SQLException e) {
             e.printStackTrace();
             return null;
         } finally {
        	 if (conn != null) {
                 try {
                     conn.close();
                 } catch (SQLException e) {
                     e.printStackTrace();
                     return null;
                 }
             }
		}
	}

	 public List<User> findAll() {
	        Connection conn = null;
	        List<User> userList = new ArrayList<User>();

	        try {
	        	conn = DBManager.getConnection();

	        	String sql = "SELECT * FROM user where id != 1";

	        	Statement stmt = conn.createStatement();
	            ResultSet rs = stmt.executeQuery(sql);

	            while (rs.next()) {
	                int id = rs.getInt("id");
	                String loginId = rs.getString("login_id");
	                String name = rs.getString("name");
	                Date birthDate = rs.getDate("birth_date");
	                String password = rs.getString("password");
	                String createDate = rs.getString("create_date");
	                String updateDate = rs.getString("update_date");
	                User user = new User(id, loginId, name, birthDate, password, createDate, updateDate);

	                userList.add(user);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return null;
	        } finally {
	        	 if (conn != null) {
	                 try {
	                     conn.close();
	                 } catch (SQLException e) {
	                     e.printStackTrace();
	                     return null;
	                 }
	             }
	         }
	         return userList;
	}

	 public List<User> findSearch(String searchLoginId,String searchName,String searchBirthLow,String searchBirthHigh) {
	        Connection conn = null;
	        List<User> userList = new ArrayList<User>();

	        try {
	        	conn = DBManager.getConnection();

	        	String sql = "SELECT * FROM user where id != 1";

	        	if(!searchLoginId.equals("")){
	        		sql += " and login_id = '" + searchLoginId + "'";
	        	}

	        	if(!searchName.equals("")){
	        		sql += " and name like '%" + searchName + "%'";
	        	}

	        	if(!searchBirthLow.equals("")){
	        		sql += " and birth_date >= '" + searchBirthLow + "'";
	        	}

	        	if(!searchBirthHigh.equals("")){
	        		sql += " and birth_date <= '" + searchBirthHigh + "'";
	        	}

	        	//System.out.println(sql);

	        	Statement stmt = conn.createStatement();
	            ResultSet rs = stmt.executeQuery(sql);

	        while (rs.next()) {
	                int id = rs.getInt("id");
	                String loginId = rs.getString("login_id");
	                String name = rs.getString("name");
	                Date birthDate = rs.getDate("birth_date");
	                String password = rs.getString("password");
	                String createDate = rs.getString("create_date");
	                String updateDate = rs.getString("update_date");
	                User user = new User(id, loginId, name, birthDate, password, createDate, updateDate);

	                userList.add(user);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return null;
	        } finally {
	        	 if (conn != null) {
	                 try {
	                     conn.close();
	                 } catch (SQLException e) {
	                     e.printStackTrace();
	                     return null;
	                 }
	             }
	         }
	         return userList;
	}

	 private String encryption(String password) {
			Charset charset = StandardCharsets.UTF_8;
			String algorithm = "MD5";

			byte[] bytes = null;
			try {
				bytes = MessageDigest.getInstance(algorithm).digest(password.getBytes(charset));
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
			String result = DatatypeConverter.printHexBinary(bytes);
			return result;

	}

	 public boolean createCheck(String loginId){
	        Connection conn = null;
	        try {
	        	 conn = DBManager.getConnection();

	        	 String sql = "SELECT * FROM user WHERE login_id = ?";
	        	 PreparedStatement pStmt = conn.prepareStatement(sql);
	             pStmt.setString(1, loginId);
	             ResultSet rs = pStmt.executeQuery();

	             boolean isExists = rs.next();
	             if(isExists == false){
	                 return true;
	             }return false;
	         } catch (SQLException e) {
	             e.printStackTrace();
	             return false;
	         } finally {
	        	 if (conn != null) {
	                 try {
	                     conn.close();
	                 } catch (SQLException e) {
	                     e.printStackTrace();
	                     return false;
	                 }
	             }
			}
	}

	 public void Create(String loginId, String password, String userName, String birthDate) {
	        Connection conn = null;
	        try {
	        	 conn = DBManager.getConnection();

	        	 String sql = "insert into user(login_id,name,birth_date,password,create_date,update_date)values(?,?,?,?,now(),now())";
	        	 PreparedStatement pStmt = conn.prepareStatement(sql);
	             pStmt.setString(1, loginId);
	             pStmt.setString(2, userName);
	             pStmt.setString(3, birthDate);
	             pStmt.setString(4, encryption(password));
	 			 pStmt.executeUpdate();
	        	 pStmt.close();

	        }catch(SQLException e) {
	        	e.printStackTrace();
	        }finally {
	        	if (conn != null) {
	                try {
	                    conn.close();
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                }
	            }
	        }
	}

	 public User detail(String id){
	        Connection conn = null;

	        try {
	        	 conn = DBManager.getConnection();

	        	 String sql = "SELECT * FROM user WHERE id = ?";

	        	 PreparedStatement pStmt = conn.prepareStatement(sql);
	             pStmt.setString(1, id);
	             ResultSet rs = pStmt.executeQuery();

	             if (!rs.next()) {
	                 return null;
	             }


	             int detailId = rs.getInt("id");
	                String loginId = rs.getString("login_id");
	                String name = rs.getString("name");
	                Date birthDate = rs.getDate("birth_date");
	                String password = rs.getString("password");
	                String createDate = rs.getString("create_date");
	                String updateDate = rs.getString("update_date");

	             return new User(detailId, loginId, name, birthDate, password, createDate, updateDate);

	         } catch (SQLException e) {
	             e.printStackTrace();
	             return null;
	         } finally {
	        	 if (conn != null) {
	                 try {
	                     conn.close();
	                 } catch (SQLException e) {
	                     e.printStackTrace();
	                     return null;
	                 }
	             }
			}
	}

	 public boolean Update(String id,String password, String userName, String birthDate) {
		 Connection conn = null;
		 try {
			 conn = DBManager.getConnection();

			 String sql = "update user set name = ?, birth_date = ?, password = ?, update_date = now() where id = ?";
			 PreparedStatement pStmt = conn.prepareStatement(sql);
			 pStmt.setString(1, userName);
			 pStmt.setString(2, birthDate);
			 pStmt.setString(3, encryption(password));
			 pStmt.setString(4, id);
			 pStmt.executeUpdate();
			 pStmt.close();
			 return true;

		 }catch(SQLException e) {
			 e.printStackTrace();
			 return false;
		 }finally {
			 if (conn != null) {
				 try {
					 conn.close();
				 } catch (SQLException e) {
					 e.printStackTrace();
					 return false;
				 }
			 }
		 }
	 }

	 public boolean Delete(String id) {
		 Connection conn = null;
		 try {
			 conn = DBManager.getConnection();

			 String sql = "delete from user where id = ?";
			 PreparedStatement pStmt = conn.prepareStatement(sql);
			 pStmt.setString(1, id);
			 pStmt.executeUpdate();
			 pStmt.close();
			 return true;

		 }catch(SQLException e) {
			 e.printStackTrace();
			 return false;
		 }finally {
			 if (conn != null) {
				 try {
					 conn.close();
				 } catch (SQLException e) {
					 e.printStackTrace();
					 return false;
				 }
			 }
		 }
	 }


}
