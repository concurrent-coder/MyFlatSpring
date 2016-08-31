package myflat.dao;

import java.util.List;

import myflat.model.User;
import myflat.model.UserType;

public interface UserDao {

	User addUser(User user);
	List<User> findAllUsers();
	List<User> getAllUsersByType(UserType userType);
	User getUserByEmailIdNType(String email,short type);
	User getUsersById(int uid);
	boolean isValidAdmin(String userName, String password);
	User getUserDetail(String userName, String md5);
}
