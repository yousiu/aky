package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Account;
import beans.Book;
import dao.BookDao;
import dao.DaoException;
import model.LoginAuthenticator;

public class LoginAction implements Action {
    @Override
    public Dispatcher execute(HttpServletRequest request, HttpServletResponse response)
                    throws ServletException, IOException {
            String userName = request.getParameter("userName");
            String password = request.getParameter("password");
            String forwardPath = "login";
            Account account;
            try {
                    account = LoginAuthenticator.authenticate(userName, password);
                    if (account.isAuthenticated()) {
                            HttpSession session = request.getSession();
                            session.setAttribute("account", account);
                            forwardPath = "top";
                            
                            String title = request.getParameter("title");
                            
                            try {
                                    
                                    ArrayList<Book> bookList = null;
                                    
                                    
                                    bookList = BookDao.findAll(userName);
                                    session.setAttribute("bookList", bookList);
                                    
                            } catch (DaoException e) {
                                    throw new ServletException(e);
                            }                
                            return new Redirector(request, response, forwardPath);
                    } else {
                            request.setAttribute("error", "Invalid username or password.");
                            return new Forwarder(request, response, forwardPath);
                    }
            } catch (DaoException e) {
                    throw new ServletException(e);
            }
    }
}