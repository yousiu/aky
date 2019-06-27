package beans;
import java.time.LocalDateTime;
public class Account {
	private String userName;
	private String password;
	private String system_ID;
	private LocalDateTime lastLoginTime;
	private boolean isAuthenticated = false;
	public Account(String userName, String password, String system_ID) {
		this.userName = userName;
		this.password = password;
		this.system_ID = system_ID;
	}
	public Account() {
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSystem_ID() {
		return system_ID;
	}
	public void setSystem_ID(String system_ID) {
		this.system_ID = system_ID;
	}
	public LocalDateTime getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(LocalDateTime lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	public boolean isAuthenticated() {
		return isAuthenticated;
	}
	public void setAuthenticated(boolean isAuthenticated) {
		this.isAuthenticated = isAuthenticated;
	}
	@Override
	public String toString() {
		return "Account [userName=" + userName + ", password=" + password + ", lastLoginTime=" + lastLoginTime
				+ ", isAuthenticated=" + isAuthenticated + "]";
	}
}