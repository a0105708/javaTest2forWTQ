/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.xml.datatype.XMLGregorianCalendar;
import javax.xml.ws.WebServiceRef;
//import org.apache.commons.io.IOUtils;
import COM.ibm.db2.jdbc.app.DB2Driver;
import com.ibm.db2.jcc.DB2SimpleDataSource;
import com.ibm.nosql.json.api.BasicDBList;
import com.ibm.nosql.json.api.BasicDBObject;
import com.ibm.nosql.json.util.JSON;
import java.sql.Driver;
import java.io.StringWriter;
import java.util.Set;
import util.*;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "TestServlet", urlPatterns = {"/registerServlet"})

public class TestServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private String dbURL = "jdbc:db2://75.126.155.153:50000/SQLDB";
    private String dbUser = "user04875";
    private String dbPass = "IMAJ8Du8ko3i";

    private static String databaseHost = "localhost";
    private static int port = 50000;
    private static String databaseName = "mydb";
    private static String user = "myuser";
    private static String password = "mypass";
    private static String url = "myurl";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String first = request.getParameter("first");
        String last = request.getParameter("last");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String password = request.getParameter("password");

//        InputStream inputStream = null; // input stream of the upload file
//         
//        // obtains the upload file part in this multipart request
//        Part filePart = request.getPart("photo");
//        if (filePart != null) {
//            // prints out some information for debugging
//            System.out.println(filePart.getName());
//            System.out.println(filePart.getSize());
//            System.out.println(filePart.getContentType());
//             
//            // obtains input stream of the upload file
//            inputStream = filePart.getInputStream();
//        }
////        byte[] bytes = IOUtils.toByteArray(inputStream);
//    
//         // TODO initialize WS operation arguments here
//        String cateName = category;
//       String regionName = region;
//       String wineryName = winery;
//       String itemName = name;
//        String vitage = vintage;
//        XMLGregorianCalendar expiringDate = null;
//        String tastingNote = price;
//        // TODO process result here
//      
       Connection connection = null; // connection to the database
        String message = "AtFirst";  // message will be sent back to client

SQLDBConnection con;
		try {
		   con = new SQLDBConnection ("75.126.155.153",50000,"user04875","IMAJ8Du8ko3i","SQLDB","schema",false);
		} catch (SQLDBConnectionException e) {
			message=message+"sqldbexception";
			return;
		}
		//Connect to the database
		
			
			message = message+"0";
        try {
        	con.connect();
        	connection=con.getConnection();
            message =message+ "1";
            //Driver driver = new COM.ibm.db2.jdbc.app.DB2Driver();
          //  String jdbcClassName = "com.ibm.db2.jcc.DB2Driver";
//            if (processVCAP()) {
//                DB2SimpleDataSource dataSource = new DB2SimpleDataSource();
//                dataSource.setServerName(databaseHost);
//                dataSource.setPortNumber(port);
//                dataSource.setDatabaseName(databaseName);
//                dataSource.setUser(user);
//                dataSource.setPassword(password);
//                dataSource.setDriverType(4);
//                conn = dataSource.getConnection();
//                conn.setAutoCommit(false);

                //Class.forName(jdbcClassName);
                
            //DriverManager.registerDriver(driver);
                //message = "2";
                // connects to the database

                //conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
                message = message+"3";

                // constructs SQL statement
                String sql = "INSERT INTO ACCOUNTENTITY (ID, FIRSTNAME, LASTNAME,EMAIL, SEX, PASSWORD) values (?,?,?,?, ?, ?)";
                PreparedStatement statement = connection.prepareStatement(sql);
                message =message+ "4";

//            if (inputStream != null) {
//                // fetches input stream of the upload file for the blob column
//                statement.setBlob(3, inputStream);
//            }
                statement.setString(1, "00000000");

                statement.setString(2, first);

                statement.setString(3, last);

                statement.setString(4, email);

                statement.setString(5, gender);

                statement.setString(6, password);
                message = "5";

                // sends the statement to the database server
                int row = statement.executeUpdate();
                message = message+"6";
                if (row > 0) {
                    message = "Account saved into database";
                } else {
                    message =message+ "Some error";
                }
            
        } catch (Exception ex) {
            message =message+ "ERROR: " + ex.getMessage();
            StringWriter sw = new StringWriter();
            ex.printStackTrace(new PrintWriter(sw));
            message = message + sw.toString();
            ex.printStackTrace();
        } finally {

            if (connection != null) {

                // closes the database connection
                try {
                    connection.close();
                    con.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            String result = "Account saved into database";

            if (message.equals(result)) // sets the message in request scope
            //request.setAttribute("Message", message);
            {
                response.sendRedirect("register.jsp?registerResult=true");
            } else {
                response.sendRedirect("register.jsp?registerResult=false&message=" + message);
            }
            // forwards to the message page
            //getServletContext().getRequestDispatcher("/Message.jsp").forward(request, response);

        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private static boolean processVCAP() {
        // VCAP_SERVICES is a system environment variable
        // Parse it to obtain the for DB2 connection info
        String VCAP_SERVICES = System.getenv("VCAP_SERVICES");
        System.out.println("VCAP_SERVICES content: " + VCAP_SERVICES);

        if (VCAP_SERVICES != null) {
            // parse the VCAP JSON structure
            BasicDBObject obj = (BasicDBObject) JSON.parse(VCAP_SERVICES);
            String thekey = null;
            Set<String> keys = obj.keySet();
            System.out.println("Searching through VCAP keys");
            // Look for the VCAP key that holds the SQLDB information
            for (String eachkey : keys) {
                System.out.println("Key is: " + eachkey);
                // Just in case the service name gets changed 
                // to lower case in the future, use toUpperCase
                if (eachkey.toUpperCase().contains("SQLDB")) {
                    thekey = eachkey;
                }
            }
            if (thekey == null) {
                System.out.println("Cannot find any SQLDB service in VCAP; exit");
                return false;
            }
            BasicDBList list = (BasicDBList) obj.get(thekey);
            obj = (BasicDBObject) list.get("0");
            System.out.println("Service found: " + obj.get("name"));
            // parse all the credentials from the vcap env variable
            obj = (BasicDBObject) obj.get("credentials");
            databaseHost = (String) obj.get("host");
            databaseName = (String) obj.get("db");
            port = Integer.parseInt(obj.get("port").toString());
            user = (String) obj.get("username");
            password = (String) obj.get("password");
            url = (String) obj.get("jdbcurl");
        } else {
            System.out.println("VCAP_SERVICES is null");
            return false;
        }

        return true;
    }

}
