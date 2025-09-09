package vn.iostar.dao;

import vn.iostar.model.User;

public interface UserDao {
	User get (String username);
	void insert(User user); // thêm phương thức mới
	User findByEmail(String email); // Thêm method mới
    
}
