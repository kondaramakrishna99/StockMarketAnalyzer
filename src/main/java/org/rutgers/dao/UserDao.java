package org.rutgers.dao;
import org.rutgers.models.User;

import java.util.List;
import javax.sql.DataSource;

/**
 * Created by Rama,Shabista,Rashmi,Christin,Deepak on 4/17
 * /2016.
 */
public interface UserDao {

    public void setDataSource(DataSource ds);

    public User get(String Username,String Password);

    public boolean insertUser(User user);

    public boolean update(User user);

    public void delete(String Username);

    public List<User> getUsers();

}
