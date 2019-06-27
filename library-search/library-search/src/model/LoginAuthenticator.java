package model;

import java.time.LocalDateTime;

import beans.Account;
import dao.AccountDao;
import dao.DaoException;

public class LoginAuthenticator {

	public static Account authenticate(String userName, String password) throws DaoException {
        
		Account account = AccountDao.findBy(userName, password);
//		Account account = AccountDaoStub.findBy(userName, password);
		
        if (account.isAuthenticated()) {
            account.setLastLoginTime(LocalDateTime.now());
        }
        
        return account;
    }
}
