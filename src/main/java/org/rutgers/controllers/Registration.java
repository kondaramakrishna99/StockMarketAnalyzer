package org.rutgers.controllers;

import org.rutgers.dao.UsersWithSharesDao;
import org.rutgers.dao.UsersWithSharesDaoImpl;
import org.rutgers.models.CompanyStock;
import org.rutgers.models.LongTerm;
import org.rutgers.models.User;
import org.rutgers.models.UsersWithShares;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.MultiValueMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.rutgers.dao.UserDaoImpl;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import java.net.PasswordAuthentication;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import javax.servlet.http.*;
import javax.servlet.*;

/**
 * Created by Rama on 4/16/2016.
 * Created by Shabista on 4/16/2016.
 * Created by Rashmi on 4/16/2016.
 * Created by Deepak on 4/16/2016.
 * Created by Christin on 4/16/2016.
 */

@Controller
public class Registration {

    @Autowired
    UserDaoImpl userDaoImpl;
    @Autowired
    UsersWithSharesDaoImpl usersWithSharesDaoImpl;
    boolean errors = false;
    User loggedInUser;
    String comapanyAnalyze;
    @RequestMapping(value="/",method = RequestMethod.GET)
    public String home(Model model)
    {
        String errors1 = "false";
        model.addAttribute("user",new User());
        model.addAttribute("errors",errors1);
        return "home";
    }

    @RequestMapping(value="/login",method = RequestMethod.POST)
    public String register(@ModelAttribute("user") User user,Model model)
    {

        System.out.println("entered in login post methodd....");
        System.out.println("login: "+user.getUsername());
        // userDaoImpl.insertUser(user);
        User user1 = userDaoImpl.get(user.getUsername(),user.getPassword());
        String errors1 = "false";
        if(user1==null)
        {
            errors1="true";
            model.addAttribute("errors",errors1);
            return "home";
        }
        loggedInUser = user1;
        model.addAttribute("loggedInUser",loggedInUser);
        model.addAttribute("errors",errors1);
        System.out.println("From database: "+user1);
        return "redirect:/dashboard";
    }

    @RequestMapping(value = "/register",method = RequestMethod.GET)
    public String registerNewUser(Model model)
    {
        model.addAttribute("user",new User());
        errors=false;
        model.addAttribute("errors",errors);
        return "Register";
    }

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String registerNewUserPost(@ModelAttribute("user")User user,Model model)
    {
        System.out.println("entered post");
        boolean success =  userDaoImpl.insertUser(user);
        if(!success)
        {
            errors=true;
            model.addAttribute("errors",errors);
            System.out.println("user already exist");
            return "Register";
        }
        loggedInUser = user;
        System.out.println(user.toString());
        return "redirect:/dashboard";
    }

    @RequestMapping(value = "/profile",method = RequestMethod.GET)
    public String profile(Model model)
    {
        User user = loggedInUser;
        System.out.println("profile user: "+user.toString());
        model.addAttribute("user",user);
        return "Profile";
    }

    @RequestMapping(value = "/updateProfile",method = RequestMethod.GET)
    public String updateProfile(Model model)
    {
        User user = loggedInUser;
        System.out.println("profile user: "+user.toString());
        model.addAttribute("user",user);
        return "updateProfile";
    }


    @RequestMapping(value = "/updateProfile",method = RequestMethod.POST)
    public String updateProfilePost(Model model,@ModelAttribute("user")User user)
    {
        user.setUsername(loggedInUser.getUsername());
        System.out.println("profile user: "+user.toString());
        boolean success =  userDaoImpl.update(user);
        if(!success)
        {
            errors=true;
            model.addAttribute("errors",errors);
            System.out.println("cannout update");
            return "Profile";
        }
        loggedInUser = user;
        System.out.println("profile user: after update :"+user.toString());
        model.addAttribute("user",user);
        return "Profile";
    }

    @RequestMapping(value="/emailSend",method = RequestMethod.POST)
    public String emailSend(Model model,HttpServletRequest request)
    {
        if(loggedInUser==null)
        {
            return "redirect:/";
        }

        errors=false;
        model.addAttribute("user",new User());
        model.addAttribute("errors",errors);

        String result;
        // Get recipient's email-ID, message & subject-line from index.html page
        System.out.println("request: "+request.getParameter("email"));
        String to = request.getParameter("email");
        System.out.println("to "+to);
        String subject = "Password reset";
        String messg = "Your pwd: Abcd@1234";

        // Sender's email ID and password needs to be mentioned
        final String from = "satyanarayana.veejay@gmail.com";
        final String pass ="9666320489";

        // Defining the gmail host
        String host = "smtp.gmail.com";

        // Creating Properties object
        Properties props = new Properties();

        // Defining properties
        props.put("mail.smtp.host", host);
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");

        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.user", from);
        props.put("mail.password", pass);
        props.put("mail.port", "465");

        // Authorized the Session object.
        Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                return new javax.mail.PasswordAuthentication(from, pass);
            }
        });

        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(mailSession);
            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));
            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO,
                    new InternetAddress(to));
            // Set Subject: header field
            message.setSubject(subject);
            // Now set the actual message
            message.setText(messg);
            // Send message
            Transport.send(message);
            result = "Your mail sent successfully....";
        } catch (MessagingException mex) {
            mex.printStackTrace();
            result = mex+"Error: unable to send mail....";
        }

        return "home";
    }

    @RequestMapping(value="/dashboard",method = RequestMethod.GET)
    public String dashboard(Model model)
    {
        if(loggedInUser==null)
        {
            return "redirect:/";
        }
        System.out.println("dashboard user: "+loggedInUser.toString());
        List<UsersWithShares> shares = usersWithSharesDaoImpl.getCompanyShares(loggedInUser.getUsername());
        System.out.println("dashboard user: "+loggedInUser.toString());
        errors=false;
        model.addAttribute("errors",errors);
        if(shares==null)
        {
            model.addAttribute("shares",new ArrayList<UsersWithShares>());
            return "dashboard";
        }

        //System.out.println(shares.get(0).toString());
        System.out.println("all shares: "+shares.toString());
        model.addAttribute("shares",shares);
        return "dashboard";
    }

    @RequestMapping(value="/addStock",method = RequestMethod.GET)
    public String addStock(HttpServletRequest request, Model model)
    {
        if(loggedInUser==null)
        {
            return "redirect:/";
        }
        errors=false;
        model.addAttribute("errors",errors);
        List<UsersWithShares> shares = usersWithSharesDaoImpl.getCompanyShares(loggedInUser.getUsername());
        if(shares==null)
        {
            model.addAttribute("shares",new ArrayList<UsersWithShares>());
            return "AddStocks";
        }
        model.addAttribute("shares",shares);
        return "AddStocks";
    }

    @RequestMapping(value="/addStock",method = RequestMethod.POST)
    public String addStockPost(HttpServletRequest request, Model model)
    {
        if(loggedInUser==null)
        {
            return "redirect:/";
        }

        UsersWithShares stock = new UsersWithShares();
        stock.setUsername(loggedInUser.getUsername());
        stock.setCompany(request.getParameter("company"));
        stock.setNumberOfShares(Integer.parseInt(request.getParameter("number")));
        stock.setDateBought(Calendar.getInstance().getTime());
        stock.setPricePerShare(Integer.parseInt(request.getParameter("price")));
        stock.setStatus("active");
        System.out.println(stock.toString());

        System.out.println(usersWithSharesDaoImpl.addShares(stock));
        System.out.println(stock.toString());

        List<UsersWithShares> shares = usersWithSharesDaoImpl.getCompanyShares(loggedInUser.getUsername());
        System.out.println("dashboard user: "+loggedInUser.toString());
        errors=true;
        model.addAttribute("errors",errors);
        if(shares==null)
        {
            model.addAttribute("shares",new ArrayList<UsersWithShares>());
            return "AddStocks";
        }

        //System.out.println(shares.get(0).toString());
        System.out.println("all shares: "+shares.toString());
        model.addAttribute("shares",shares);
        return "AddStocks";
    }

    @RequestMapping(value="/watchList",method = RequestMethod.POST)
    public String watchListStockPost(HttpServletRequest request, Model model)
    {
        if(loggedInUser==null)
        {
            return "redirect:/";
        }
        UsersWithShares stock = new UsersWithShares();
        stock.setUsername(loggedInUser.getUsername());
        stock.setCompany(request.getParameter("company"));
        stock.setNumberOfShares(Integer.parseInt(request.getParameter("number")));
        stock.setDateBought(Calendar.getInstance().getTime());
        stock.setPricePerShare(Integer.parseInt(request.getParameter("price")));
        stock.setStatus("watchlist");
        System.out.println(stock.toString());

        System.out.println(usersWithSharesDaoImpl.addShares(stock));
        System.out.println(stock.toString());

        List<UsersWithShares> shares = usersWithSharesDaoImpl.getCompanyShares(loggedInUser.getUsername());
        System.out.println("dashboard user: "+loggedInUser.toString());
        errors=true;
        model.addAttribute("errors",errors);
        if(shares==null)
        {
            model.addAttribute("shares",new ArrayList<UsersWithShares>());
            return "AddStocks";
        }

        //System.out.println(shares.get(0).toString());
        System.out.println("all shares: "+shares.toString());
        model.addAttribute("shares",shares);
        return "AddStocks";
    }

    @RequestMapping(value="/delete/{id}",method = RequestMethod.GET)
    public String deleteStock(HttpServletRequest request, Model model, @PathVariable("id") String id)
    {
       // request.
        System.out.println("pathvariable i:"+id);
        int i= Integer.parseInt(id);
        System.out.println("delete i:"+i);
        List<UsersWithShares> shares = usersWithSharesDaoImpl.getCompanyShares(loggedInUser.getUsername());

        UsersWithShares stock = shares.get(i);
        System.out.println(stock.toString());


        System.out.println(usersWithSharesDaoImpl.deleteShares(stock));
        if(!usersWithSharesDaoImpl.deleteShares(stock))
        {
            System.out.println("not deleted"+i);
        }
        shares = usersWithSharesDaoImpl.getCompanyShares(loggedInUser.getUsername());
        if(shares==null)
        {
            model.addAttribute("shares",new ArrayList<UsersWithShares>());
            return "AddStocks";
        }
        model.addAttribute("shares",shares);
        return "AddStocks";
    }

    @RequestMapping(value="/indicators",method=RequestMethod.GET)
    public String indicators(Model model)
    {
        if(loggedInUser==null)
        {
            return "redirect:/";
        }
        double[] res = new double[200];
        String display="false";
        model.addAttribute("display",display);
        model.addAttribute("res",res);
        String td="";
        model.addAttribute("td",td);
        return "Indicator";
    }

    @RequestMapping(value="/indicators",method=RequestMethod.POST)
    public String indicatorsPost(Model model,HttpServletRequest request)
    {

        System.out.println("company: "+request.getParameter("company"));

        String company = request.getParameter("company");
        String indicator = request.getParameter("indicator");
        String td = request.getParameter("values");
        System.out.println("indicator: "+indicator);
        if(loggedInUser==null)
        {
            return "redirect:/";
        }
        System.out.println("came here indicators post");
        double[] res = new double[600];
        List<CompanyStock> list = usersWithSharesDaoImpl.historicalData(company);
        System.out.println("list: "+list.toString());
        for(int i=0;i<res.length;i++)
        {
            res[i] = Double.parseDouble(list.get(i).getClose());
            System.out.print(res[i]+" ");
        }
        System.out.println("done");
        model.addAttribute("res",res);
        String display="true";
        model.addAttribute("indicator",indicator);
        model.addAttribute("display",display);
        model.addAttribute("td",td);
        System.out.println("td: "+td);
        model.addAttribute("company",company);
        return "Indicator";
    }

    @RequestMapping(value="/analyze/{id}",method=RequestMethod.GET)
    public String analyzeShortTerm(Model model,@PathVariable("id") String id)
    {
        if(loggedInUser==null)
        {
            return "redirect:/";
        }
        errors=false;
        model.addAttribute("user",new User());
        model.addAttribute("errors",errors);

        //double[] inp = {10,10.5,11,10.74,10.78,10.8,11,10.3,10.5,10.6,10.8};
        int numvalues =5;
        List<UsersWithShares> shares = usersWithSharesDaoImpl.getCompanyShares(loggedInUser.getUsername());
        String company = shares.get(Integer.parseInt(id)).getCompany();

        double[] res = usersWithSharesDaoImpl.calculateshortTerm(company,numvalues);
        for(double d:res)
        {
            System.out.print(d+" ");
        }
        model.addAttribute("res",res);

        List<LongTerm> resLongTerm = usersWithSharesDaoImpl.longTermData(company);
        System.out.print("res long term: "+resLongTerm);
        model.addAttribute("resLongTerm",resLongTerm);

        List<CompanyStock> resHistoricalData = usersWithSharesDaoImpl.historicalData(company);
        System.out.println("resHistoricalData: "+resHistoricalData.toString());
        model.addAttribute("resHistoricalData",resHistoricalData);
        return "Analyze";
    }

    @RequestMapping(value="/queries",method = RequestMethod.GET)
    public String queries(Model model)
    {
        List<String> first = usersWithSharesDaoImpl.getDistinctCompanies();
        double second = usersWithSharesDaoImpl.getHighestStockPrice();
        double third =usersWithSharesDaoImpl.getAveragePrice();
        List<Double> fourth =usersWithSharesDaoImpl.getMinPriceForEachCompany();
        List<String> fifth = usersWithSharesDaoImpl.getIds();
        model.addAttribute("first",first);
        model.addAttribute("second",second);
        model.addAttribute("third",third);
        model.addAttribute("fourth",fourth);
        model.addAttribute("fifth",fifth);

        return "Queries";
    }

}
