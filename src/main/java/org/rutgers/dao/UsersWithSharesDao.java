package org.rutgers.dao;

import org.rutgers.models.UsersWithShares;

import java.util.List;

/**
 * Created by Rama,Shabista,Rashmi,Christin,Deepak on 4/23/2016.
 */
public interface UsersWithSharesDao {

    public List<UsersWithShares> getCompanyShares(String Username);
    public boolean addShares(UsersWithShares s);
    public boolean deleteShares(UsersWithShares s);
    public boolean editShares(UsersWithShares s);

}
