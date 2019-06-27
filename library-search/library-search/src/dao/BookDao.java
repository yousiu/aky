package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import beans.Account;
import beans.Book;


public class BookDao {
	static String BASE_SQL = " select * from account a JOIN book b JOIN registration r WHERE b.isbn=r.isbn AND r.id =a.id AND a.user_name='?';";

	public static Book findBy(String isbn) throws DaoException {
		return findBy(isbn, null);
	}

	public static Book findBy(String isbn, String password) throws DaoException {
		
		Book book = new Book();
		String sql = "SELECT * FROM book WHERE isbn = ?";
		
		
		
		try (Connection conn = ConnectionFactory.getConnection();
			 PreparedStatement pstmt = conn.prepareStatement(sql)) {
			
			pstmt.setString(1, isbn);
		
						
			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					book.setIsbn(rs.getString("isbn"));
				}
			}
			
		} catch (NamingException | SQLException e) {
			throw new DaoException(e);
		}
		
		return book;
	}
   
	public static ArrayList<Book> findAll(String userName) throws DaoException {
		ArrayList<Book> bookList = new ArrayList<>();
		String sql = "select * from account a JOIN book b JOIN registration r WHERE b.isbn=r.isbn AND r.id =a.id "
				+ "AND user_name = ?";

		try (Connection conn = ConnectionFactory.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, userName);
			try (ResultSet rs = pstmt.executeQuery()) {

				while (rs.next()) {
					Book book = new Book();
					book.setIsbn(rs.getString("isbn"));
					book.setTitle(rs.getString("title"));
					book.setAutor(rs.getString("author"));
					bookList.add(book);

				}
			}
		} catch (NamingException | SQLException e) {
			throw new DaoException(e);
		}
		return bookList;
	}
	public static int saveBook(Book book,Account account) throws DaoException {
		
//		String isbn= book.getIsbn();		//
//		int isbnlengh = isbn.length();		//a 文字列を13文字と指定したい
	
		 String sql = "INSERT INTO book(isbn,title,author) VALUES(?, ?, ?)";
			
			try (Connection conn = ConnectionFactory.getConnection();
			       PreparedStatement pstmt = conn.prepareStatement(sql)) {
			 
			      pstmt.setString(1, book.getIsbn());
			      pstmt.setString(2, book.getTitle());
			      pstmt.setString(3, book.getAuthor());
	
			      
			      return pstmt.executeUpdate();
			     
		    
		      
		    } catch (NamingException | SQLException e) {
		      throw new DaoException(e);
		    }
		}
		
	

}