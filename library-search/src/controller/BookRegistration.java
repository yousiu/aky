package controller;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import beans.Account;
import beans.Book;
import dao.AccountDao;
import dao.BookDao;
import dao.DaoException;
import dao.RegistrationDao;
public class BookRegistration implements Action {
	@Override
	public Dispatcher execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String isbn= request.getParameter("isbn");//システムIDをとってくる
		String title = request.getParameter("title");
		String author = request.getParameter("author");
	    Account account = (Account) session.getAttribute("account");
	    
	    byte[] bytes = title.getBytes( "ISO-8859-1" );//文字コード変換
	    title = new String( bytes, "UTF-8" );	
	    bytes = author.getBytes( "ISO-8859-1" );
	    author = new String( bytes, "UTF-8" );//
	    
		Book book=new Book(isbn,title,author);
		
		try {
			
//			 book = BookDao.findBy(book.getIsbn());
//			if (book.getIsbn() != null) {
//			
//			}
//			else {			
//				book.setIsbn(isbn);
				BookDao.saveBook(book, account);
//			}
			
		} catch (DaoException e) {
			throw new ServletException(e);
		}
		
		
		try {
			 
			RegistrationDao.listRegistration(book,account);
		
		}
		catch (DaoException e) {
			throw new ServletException(e);
		}
		  try {
              
              ArrayList<Book> bookList = null;
              
              
              bookList = BookDao.findAll(account.getUserName());
              session.setAttribute("bookList", bookList);
              
      } catch (DaoException e) {
              throw new ServletException(e);
      }                
		 
		return new Redirector(request, response, "top");
	}
}