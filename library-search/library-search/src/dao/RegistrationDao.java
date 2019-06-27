package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import beans.Account;
import beans.Book;

public class RegistrationDao {
	public static void listRegistration(Book book,Account account) throws DaoException {
		String sql = "SELECT * FROM account WHERE user_name = ?";
		String userID="";
		int userid;

	    try (Connection conn = ConnectionFactory.getConnection();
	       PreparedStatement pstmt = conn.prepareStatement(sql)) {
	      String userName=account.getUserName();
	      pstmt.setString(1, userName);
	
	            
	      try (ResultSet rs = pstmt.executeQuery()) {
	    	  if (rs.next()) {
	          userid= rs.getInt("id");
	          userID=Integer.toString(userid);
	    	  }
	      }
	    	      
	    } catch (NamingException | SQLException e) {
	      throw new DaoException(e);
	    }
	    RegistrationDao.save(book, userID);
	    
	}
	public static int save(Book book,String userID) throws DaoException {
	    
	    String sql = "INSERT INTO registration(id,isbn) VALUES(?, ?)";
	    
	    try (Connection conn = ConnectionFactory.getConnection();
	       PreparedStatement pstmt = conn.prepareStatement(sql)) {
	    	
	    	 pstmt.setString(1,userID);
	    	 pstmt.setString(2, book.getIsbn());
	    	
	      
	      return pstmt.executeUpdate();
	      
	    } catch (NamingException | SQLException e) {
	      throw new DaoException(e);
	    }
	  }
}
