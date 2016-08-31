package myflat.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import myflat.dao.UserDao;
import myflat.model.User;
import myflat.model.UserType;

@Repository
public class UserDaoImpl implements UserDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	@Transactional
	public User addUser(User user) {
		return entityManager.merge(user);
	}

	@Override
	public List<User> findAllUsers() {
		return entityManager.createQuery("from user", User.class).getResultList();
	}

	@Override
	public User getUserByEmailIdNType(String email, short type) {
		List<User> users = entityManager
				.createQuery("from User where email='" + email + "' and userType=" + type + "", User.class)
				.getResultList();

		if (!users.isEmpty())
			return users.get(0);

		return null;
	}

	@Override
	public List<User> getAllUsersByType(UserType userType) {
		List<User> users = entityManager
				.createQuery("from User where userType=" + userType.getUserType() + "", User.class).getResultList();

		return users;
	}

	@Override
	public User getUsersById(int uid) {
		User user = entityManager.createQuery("from User where Id=" + uid + "", User.class).getSingleResult();

		return user;
	}

	@Override
	public boolean isValidAdmin(String email, String strPassword) {
		return !entityManager.createQuery(
				"from User where email = '" + email + "' and userType =1 and password = '" + strPassword + "' ",
				User.class).getResultList().isEmpty();
	}

	@Override
	public User getUserDetail(String email, String strPassword) {
		return entityManager.createQuery(
				"from User where email = '" + email + "' and userType =1 and password = '" + strPassword + "' ",
				User.class).getSingleResult();
	}
}
