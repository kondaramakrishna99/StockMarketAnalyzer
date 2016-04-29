package org.rutgers.dao;
import org.rutgers.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Rama,Shabista,Rashmi,Christin,Deepak on 4/17/2016.
 */
@Repository
public class UserDaoImpl implements UserDao {


    //public DataSource dataSource;
    public JdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource ds)
    {
        jdbcTemplate = new JdbcTemplate(ds);
    }

    public User get(String username,String password) {
       // jdbcTemplate = new JdbcTemplate(dataSource);
        String sql = "select * from marketrepo.users where Username=? and Password=?";
        Object[] params = {username,password};
         List<User> user = jdbcTemplate.query(sql,params, new RowMapper<User>() {
            public User mapRow(ResultSet resultSet, int i) throws SQLException {
                User user1 = new User();
                user1.setUsername(resultSet.getString("Username"));
                user1.setEmail(resultSet.getString("Email"));
                user1.setName(resultSet.getString("Name"));
                user1.setGender(resultSet.getString("Gender"));
                user1.setDateOfBirth(resultSet.getString("DateOfBirth"));
                user1.setCountry(resultSet.getString("Country"));
                user1.setCity(resultSet.getString("City"));
                user1.setOccupation(resultSet.getString("Occupation"));
                user1.setMobile(resultSet.getString("Mobile"));
                user1.setAnnualIncome(resultSet.getInt("AnnualIncome"));
                user1.setAddress(resultSet.getString("Address"));
                return user1;
            }
        });
        System.out.println("result: "+user.toString());
        if(user.size()!=0)
            return user.get(0);
        else
            return null;
    }

    public boolean insertUser(User user) {
            String sql = "insert into marketrepo.users(Username,Password,Name,Email,Gender,DateOfBirth,Address,City,Occupation,Country,\n" +
                    "Mobile,AnnualIncome) \n" +
                    "values(?,?,?,?,?,?,?,?,?,?,?,?)";
            int rowsAffected = jdbcTemplate.update(sql,user.getUsername(),user.getPassword(),user.getName(),
                    user.getEmail(),user.getGender(),user.getDateOfBirth(),user.getAddress(),user.getCity(),user.getOccupation(),
                    user.getCountry(),user.getMobile(),user.getAnnualIncome());
            System.out.println("user: "+user.toString()+ "\nrows affected: "+rowsAffected);
            if(rowsAffected==0)
                return false;
            else
                return true;
    }

    public boolean update(User user) {
        String sql = "update marketrepo.users set Name=?,Email=?,Gender=?,DateOfBirth=?,Address=?," +
                "City=?,Occupation=?,Country=?,Mobile=?,AnnualIncome=? where Username=?";
        int rowsAffected = jdbcTemplate.update(sql,user.getName(),user.getEmail(),user.getGender(),
                user.getDateOfBirth(),user.getAddress(),user.getCity(),user.getOccupation(),
                user.getCountry(),user.getMobile(),user.getAnnualIncome(),user.getUsername());
        System.out.println("user: "+user.toString()+ "\nrows affected: "+rowsAffected);
        if(rowsAffected==0)
            return false;
        else
            return true;
    }

    public void delete(String Username) {
        String sql ="delete from marketrepo.users where Username=?";
        int rows= jdbcTemplate.update(sql,Username);
        System.out.println("rows: "+rows);
        return;
    }

    public List<User> getUsers() {
        return null;
    }
}
