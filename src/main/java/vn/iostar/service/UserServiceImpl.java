package vn.iostar.service;

import vn.iostar.dao.UserDao;
import vn.iostar.dao.UserDaoImpl;
import vn.iostar.model.User;

public class UserServiceImpl implements UserService {
    UserDao userDao = new UserDaoImpl();

    @Override
    public User login(String username, String password) {
        User user = this.get(username);
        if (user != null && password.equals(user.getPassWord())) {
            return user;
        }
        return null;
    }

    @Override
    public User get(String username) {
        return userDao.get(username);
    }

    @Override
    public void register(User user) {
        userDao.insert(user);
    }

    // Các method mới đã thêm

    @Override
    public User getPasswordByEmail(String email) {
        return userDao.findByEmail(email);
    }

    
}