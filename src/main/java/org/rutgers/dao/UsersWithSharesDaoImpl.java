package org.rutgers.dao;

import org.rutgers.models.CompanyStock;
import org.rutgers.models.LongTerm;
import org.rutgers.models.UsersWithShares;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import static java.lang.Math.*;

/**
 * Created by Rama,Shabista,Rashmi,Christin,Deepak on 4/23/2016.
 */
@Repository
public class UsersWithSharesDaoImpl implements UsersWithSharesDao {

    public JdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource ds)
    {
        jdbcTemplate = new JdbcTemplate(ds);
    }

    public List<UsersWithShares> getCompanyShares(String Username) {

        String sql = "SELECT * FROM marketrepo.User_shares where Username=?";
        Object[] params={Username};

        List<UsersWithShares> results = jdbcTemplate.query(sql, params, new RowMapper<UsersWithShares>() {

            public UsersWithShares mapRow(ResultSet resultSet, int i) throws SQLException {
                UsersWithShares res = new UsersWithShares();
                res.setUsername(resultSet.getString("Username"));
                res.setCompany(resultSet.getString("Company"));
                res.setDateBought(resultSet.getDate("DateBought"));
                res.setNumberOfShares(resultSet.getInt("NumberOfShares"));
                res.setPricePerShare(resultSet.getInt("PricePerShare"));
                res.setStatus(resultSet.getString("Status"));
                return res;
            }
        }) ;
        if(results.size()==0)
            return null;
        return results;
    }

    public boolean addShares(UsersWithShares s) {
        String sql="insert into marketrepo.User_shares(Username,Company,DateBought,NumberOfShares,PricePerShare,Status) " +
                "values(?,?,?,?,?,?)";
        int rowsAffected = jdbcTemplate.update(sql,s.getUsername(),s.getCompany(),s.getDateBought(),s.getNumberOfShares(),
                s.getPricePerShare(),s.getStatus());

        System.out.println("inserted: "+s.toString() + "\n rows affected: "+rowsAffected);
        if(rowsAffected==0)
            return false;
        else
            return true;
    }

    public boolean deleteShares(UsersWithShares s) {
      /*  String sql="delete from marketrepo.User_shares \n" +
                "where (username=? AND Company=? and \n" +
                "DateBought=? and NumberOfShares=?);";
        int rowsAffected = jdbcTemplate.update(sql,s.getUsername(),s.getCompany(),s.getDateBought(),s.getNumberOfShares());

        System.out.println("deleted: "+s.toString() + "\n rows affected: "+rowsAffected);
        if(rowsAffected==0)
            return false;
        else
            return true;*/

        String sql="update marketrepo.User_shares set status='sold'" +
                "where (username=? AND Company=? and \n" +
                "DateBought=? and NumberOfShares=?);";
        int rowsAffected = jdbcTemplate.update(sql,s.getUsername(),s.getCompany(),s.getDateBought(),s.getNumberOfShares());

        System.out.println("deleted: "+s.toString() + "\n rows affected: "+rowsAffected);
        if(rowsAffected==0)
            return false;
        else
            return true;
    }

    public boolean editShares(UsersWithShares s) {
        return false;
    }

    public  double[] calculateshortTerm(String company,int numvalues) {

        String[] companyCode = {"BAC","CSCO","CVC","FB","GOOG","IBM","MSFT","WFC","YHOO"};
        List<String> companyCodeList = Arrays.asList(companyCode);
        String[] companyName = {"BANK OF AMERICA","CISCO","CABLEVISION","FACEBOOK","GOOGLE","IBM","MICROSOFT","WFC","YAHOO"};
        List<String> companyNameList = Arrays.asList(companyName);
        int index = companyNameList.indexOf(company);
        String code = companyCodeList.get(index);

        String sql = "select * from marketrepo.HIST_DATA where Stock=? order by DateClose desc LIMIT 15";
        Object[] params={code+".csv"};

        System.out.println("short term query: \n"+sql+" code:"+(String)params[0]);
        List<CompanyStock> res = jdbcTemplate.query(sql, params, new RowMapper<CompanyStock>() {
            public CompanyStock mapRow(ResultSet resultSet, int i) throws SQLException {
                CompanyStock stock = new CompanyStock();
                stock.setDateClose(resultSet.getDate("DateClose"));
                stock.setClose(resultSet.getString("Close"));
                stock.setHigh(resultSet.getString("High"));
                stock.setOpen(resultSet.getString("Open"));
                stock.setLow(resultSet.getString("Low"));
                stock.setVolume(resultSet.getString("Volume"));
                stock.setAdj_Close(resultSet.getString("Adj_Close"));
                return stock;
            }
        });
        System.out.println("short term: \n"+res.toString());
        double[] inp=new double[15];
        //int numvalues=5;

        for(int i=0;i<inp.length;i++)
        {
            inp[i]=Double.parseDouble(res.get(i).getClose());
        }
        int kp=0;
        double ret[] = new double[numvalues];
        double[] ActualstockValues = new double[100];
        for (int i = 0; i < inp.length; i++) {
            ActualstockValues[i] = inp[i];
//            ActualstockValues[i] = Double.parseDouble(res.get(i).getClose());
        }
        int count = 1;
        double[] Phi = new double[3];
        double[] Phin = new double[3];
        double[] V = new double[3];
        double[][] Z = new double[3][3];

        double Variance, Mean, Alpha, Beta;
        int N;

        int[] PastInstance = new int[50];
        int PredictedInstance;
        double PredictedValue;

        double[][] Transpose = new double[3][3];
        double[][] Adjoint = new double[3][3];
        double[][] Inverse = new double[3][3];
        double Determinant;

        double[] sumP = new double[3];
        double sumErrors = 0, sumActual = 0;

        count = inp.length;
        N = count - 1;
        //System.out.println("Count is : "+count);

        for (int C = 0; C < numvalues; C++) {
            double errorTemp = 0;
            Alpha = 0.005;
            Beta = 100;
            Mean = 0;
            Variance = 0;
            Determinant = 0;

            for (int i = 0; i < 3; i++) {
                for (int j = 0; j < 3; j++) {
                    Phi[i] = 0;
                    Phin[i] = 0;
                    Z[i][j] = 0;
                    V[i] = 0;
                    Transpose[i][j] = 0;
                    Inverse[i][j] = 0;
                    Adjoint[i][j] = 0;
                    sumP[i] = 0;
                }
            }

            PredictedInstance = N + 1;
            for (int i = 1; i <= N; i++) {
                PastInstance[i] = i;
            }

            for (int i = 0; i < 3; i++) {
                for (int n = 1; n <= N; n++) {
                    Phin[i] += pow(PastInstance[n], i);
                }
            }

            for (int i = 0; i < 3; i++) {
                Phi[i] = pow(PredictedInstance, i);
            }

            for (int i = 0; i < 3; i++) {
                for (int j = 0; j < 3; j++) {
                    Z[i][j] = (Phin[i] * Phi[j] * Beta);
                    if (j == i) {
                        Z[i][j] += Alpha;
                    }
                }
            }

            for (int i = 0, j = 0; j < 3; j++) {
                if (j == 2) {
                    Determinant += Z[i][j] * Z[i + 1][0] * Z[i + 2][1];
                } else if (j == 1) {
                    Determinant += Z[i][j] * Z[i + 1][j + 1] * Z[i + 2][0];
                } else {
                    Determinant += Z[i][j] * Z[i + 1][j + 1] * Z[i + 2][j + 2];
                }
            }

            for (int i = 2, j = 0; j < 3; j++) {
                if (j == 2) {
                    Determinant -= Z[i][j] * Z[i - 1][0] * Z[i - 2][1];
                } else if (j == 1) {
                    Determinant -= Z[i][j] * Z[i - 1][j + 1] * Z[i - 2][0];
                } else {
                    Determinant -= Z[i][j] * Z[i - 1][j + 1] * Z[i - 2][j + 2];
                }
            }

            if (Determinant != 0) {
                Determinant = 1 / Determinant;
            } else {
                System.out.println("Not Compatible with this Data");
            }

            for (int i = 0; i < 3; i++) {
                for (int j = 0; j < 3; j++) {
                    Transpose[i][j] = Z[j][i];
                }
            }

            Adjoint[0][0] = Transpose[1][1] * Transpose[2][2] - (Transpose[2][1] * Transpose[1][2]);
            Adjoint[0][1] = (-1) * (Transpose[1][0] * Transpose[2][2] - (Transpose[2][0] * Transpose[1][2]));
            Adjoint[0][2] = Transpose[1][0] * Transpose[2][1] - (Transpose[2][0] * Transpose[1][1]);
            Adjoint[1][0] = (-1) * (Transpose[0][1] * Transpose[2][2] - Transpose[2][1] * Transpose[0][2]);
            Adjoint[1][1] = Transpose[0][0] * Transpose[2][2] - Transpose[2][0] * Transpose[0][2];
            Adjoint[1][2] = (-1) * (Transpose[0][0] * Transpose[2][1] - Transpose[2][0] * Transpose[0][1]);
            Adjoint[2][0] = Transpose[0][1] * Transpose[1][2] - Transpose[1][1] * Transpose[0][2];
            Adjoint[2][1] = (-1) * (Transpose[0][0] * Transpose[1][2] - Transpose[1][0] * Transpose[0][2]);
            Adjoint[2][2] = Transpose[0][0] * Transpose[1][1] - Transpose[1][0] * Transpose[0][1];

            for (int i = 0; i < 3; i++) {
                for (int j = 0; j < 3; j++) {
                    Inverse[i][j] = Adjoint[i][j] * Determinant;
                }
            }

            for (int i = 0; i < 3; i++) {
                for (int j = 0; j < 3; j++) {
                    V[i] += Phi[j] * Inverse[j][i];
                }
            }

            for (int i = 0; i < 3; i++) {
                Variance += V[i] * Phi[i];
            }
            Variance += 1 / Beta;

            for (int i = 0; i < 3; i++) {
                for (int n = 1; n <= N; n++) {
                    sumP[i] += pow(n, i) * ActualstockValues[n];
                }
            }

            for (int i = 0; i < 3; i++) {
                Mean += V[i] * sumP[i];
            }
            Mean *= Beta;

            PredictedValue = Mean + (2.99 * sqrt(Variance));

            System.out.print(C + 1);
            System.out.print("  :  ");
            System.out.println(PredictedValue);
            if (ActualstockValues[N + 1] == 0) {
                ActualstockValues[N + 1] = PredictedValue;
                ret[kp]=PredictedValue;
                kp++;
            }
            //  System.out.println(ActualstockValues[N + 1]);

            //System.out.println();

            N++;

        }
        //Date d=
        for(int i=0;i<ret.length;i++)
        {
            System.out.print(ret[i]+" ");
        }
        System.out.println();
        return ret;

    }

    public List<CompanyStock> historicalData(String company)
    {
        String[] companyCode = {"BAC","CSCO","CVC","FB","GOOG","IBM","MSFT","WFC","YHOO"};
        List<String> companyCodeList = Arrays.asList(companyCode);
        String[] companyName = {"BANK OF AMERICA","CISCO","CABLEVISION","FACEBOOK","GOOGLE","IBM","MICROSOFT","WFC","YAHOO"};
        List<String> companyNameList = Arrays.asList(companyName);
        int index = companyNameList.indexOf(company);
        String code = companyCodeList.get(index);
        String sql = "select * from marketrepo.HIST_DATA where Stock=? order by DateClose desc LIMIT 600";
        if(code.equals("WFC"))
            code="WAC";

        Object[] params={code+".csv"};
        System.out.println("input to bayes:"+sql+" param: "+params[0]);
        List<CompanyStock> res = jdbcTemplate.query(sql, params, new RowMapper<CompanyStock>() {
            public CompanyStock mapRow(ResultSet resultSet, int i) throws SQLException {
                CompanyStock stock = new CompanyStock();
                stock.setDateClose(resultSet.getDate("DateClose"));
                stock.setClose(resultSet.getString("Close"));
                stock.setHigh(resultSet.getString("High"));
                stock.setOpen(resultSet.getString("Open"));
                stock.setLow(resultSet.getString("Low"));
                stock.setVolume(resultSet.getString("Volume"));
                stock.setAdj_Close(resultSet.getString("Adj_Close"));
                stock.setStock(resultSet.getString("Stock"));
                return stock;
            }
        });
        System.out.println("historical data: \n"+res.toString());
        return res;
    }

    public List<LongTerm> longTermData(String company)
    {
        String[] companyCode = {"BAC","CSCO","CVC","FB","GOOG","IBM","MSFT","WFC","YHOO"};
        List<String> companyCodeList = Arrays.asList(companyCode);
        String[] companyName = {"BANK OF AMERICA","CISCO","CABLEVISION","FACEBOOK","GOOGLE","IBM","MICROSOFT","WFC","YAHOO"};
        List<String> companyNameList = Arrays.asList(companyName);
        int index = companyNameList.indexOf(company);
        String code = companyCodeList.get(index);
        if(code.equals("WFC"))
            code="WAC";

        String sql = "select * from marketrepo.Hist_prediction where Stock=? order by DateClose asc";
        Object[] params={code+".csv"};

        System.out.println("input to bayes:"+sql+" param: "+params[0]);
        List<LongTerm> res = jdbcTemplate.query(sql, params, new RowMapper<LongTerm>() {
            public LongTerm mapRow(ResultSet resultSet, int i) throws SQLException {
                LongTerm stock = new LongTerm();
                stock.setCompany(resultSet.getString("Stock"));
                stock.setValue(resultSet.getDouble("Value"));
                stock.setDate(resultSet.getDate("DateClose"));
                return stock;
            }
        });
        System.out.println("long term: \n"+res.toString());
        return res;
    }

    public List<String> getDistinctCompanies()
    {
        String sql ="SELECT distinct Stock FROM marketrepo.HIST_DATA";
        List<String> res= (List<String>)jdbcTemplate.queryForList(sql,String.class);
        System.out.println("distinct: "+res.toString());
        return res;
    }

    public double getHighestStockPrice()
    {
        String sql ="SELECT MAX(Close) FROM marketrepo.HIST_DATA \n" +
                "WHERE DateClose>'2016-03-18' AND DateClose<'2016-03-29' AND Stock LIKE '%GOOG%'";

        double res = (Double)jdbcTemplate.queryForObject(sql,Double.class);
        System.out.println("highest stock price "+res);
        return res;
    }

    public double getAveragePrice()
    {
        String sql ="SELECT AVG(Close) FROM marketrepo.HIST_DATA WHERE DateClose>'2015-03-18' AND DateClose<'2016-03-29' AND Stock LIKE '%MSFT%'";

        double res = (Double)jdbcTemplate.queryForObject(sql,Double.class);
        System.out.println("average stock price "+res);
        return res;
    }

    public List<Double> getMinPriceForEachCompany()
    {
        String sql ="SELECT MIN(Close) FROM marketrepo.HIST_DATA \n" +
                "WHERE DateClose>'2016-03-18' AND DateClose<'2016-03-29'\n" +
                "group by Stock\n" +
                "order by Stock;";
        String[] companyName={"BANK OF AMERICA","CISCO","CABLEVISION","FACEBOOK","GOOGLE","IBM","MICROSOFT","WFC","YAHOO"};
        List<Double> res= (List<Double>)jdbcTemplate.queryForList(sql,Double.class);
        System.out.println("min price for each company"+res.toString());
        return res;
    }

    public List<String> getIds()
    {
        String sql ="SELECT Stock FROM marketrepo.HIST_DATA \n" +
                "WHERE DateClose>'2015-03-18' AND DateClose<'2016-03-29' \n" +
                "group by Stock\n" +
                "having avg(Close)<(select MIN(Close) from marketrepo.HIST_DATA \n" +
                "where Stock LIKE '%GOOG%' and DateClose>'2015-03-18' AND DateClose<'2016-03-29')\n" +
                "order by Stock";
        String[] companyName={"BANK OF AMERICA","CISCO","CABLEVISION","FACEBOOK","GOOGLE","IBM","MICROSOFT","WFC","YAHOO"};
        List<String> res= (List<String>)jdbcTemplate.queryForList(sql,String.class);
        System.out.println("get ids"+res.toString());
        return res;
    }






}
