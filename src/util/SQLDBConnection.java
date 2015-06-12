package util;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Set;

import javax.servlet.ServletContext;

import com.ibm.db2.jcc.DB2SimpleDataSource;
import com.ibm.nosql.json.api.BasicDBList;
import com.ibm.nosql.json.api.BasicDBObject;
import com.ibm.nosql.json.util.JSON;

public class SQLDBConnection {
	private String name = "";
	private String label = "";
	private String plan = "";
	private String hostName = "";
	private String host = "";
	private int port = 0;
	private String databaseName = "";
	private String username = "";
	private String password = "";
	private String jdbcurl = "";
	private String uri = "";
	private String vcapKey = null;
	private String vcapServices = null;
	private String schema = "";
	private boolean autoCommit = false;
	private Connection con = null;

	// Clears all local variables 
	private void clearAll() {
		name = ""; label = ""; plan = ""; hostName = "";
		host= ""; port = 0; databaseName = "";
		username = ""; password = "";
		jdbcurl = ""; uri = "";
		vcapKey = null; vcapServices = null;
		schema = "";
		autoCommit = false;
		con = null;
	}
	
	// returns false if a mandatory subset of the connection fields is not set, true otherwise
	public boolean mandatorySet () {
		if ((host == "" && hostName == "") || port == 0 || databaseName == "" || username == "" || password == "")
			return false;
		else 
			return true;
	}
	
	// Constructor to Initiate from Servlet Context
	public SQLDBConnection(ServletContext context) throws SQLDBConnectionException {
		clearAll();
		// Set all values to the ones provided in the servlet context
		setHost(context.getInitParameter(Constants.CHOST));
		setPort(Integer.parseInt(context.getInitParameter(Constants.PORT)));
		setUsername(context.getInitParameter(Constants.CUSERNAME));
		setPassword(context.getInitParameter(Constants.CPASSWORD));
		setDatabaseName(context.getInitParameter(Constants.CDBNAME));
		setSchema(context.getInitParameter(Constants.CSCHEMA));
		setJdbcUrl(context.getInitParameter(Constants.CJDBCURL));
		setUri(context.getInitParameter(Constants.CURI));
		if (!mandatorySet())
			throw new SQLDBConnectionException ("Missing Mandatory fields");
	}

	// Constructor to Initiate from VCAP
	public SQLDBConnection(final String serviceName) throws SQLDBConnectionException {
		clearAll();
		vcapServices = System.getenv("VCAP_SERVICES");
		if (vcapServices == null) {
			throw new SQLDBConnectionException("VCAP_SERVICES environment variable not found");
		} else {
			// parse the VCAP JSON structure
			BasicDBObject obj = (BasicDBObject) JSON.parse(vcapServices);
			// get all the keys from the JSON structure
			Set<String> keys = obj.keySet();
			// Look for the VCAP key that holds the serviceName information
			for (String eachkey : keys) {
				// iterate and look for the key, stop on the first match
				if (eachkey.toUpperCase().contains(serviceName.toUpperCase())) {
					setVCAPKey(eachkey);
					break;
				}
			}
			if (getVCAPKey() == null) {
				throw new SQLDBConnectionException("ServiceName " + serviceName
						+ "not found");
			} else {
				BasicDBList list = (BasicDBList) obj.get(getVCAPKey());
				obj = (BasicDBObject) list.get("0");
				// if values are not found they'll be set to null
				setName((String) obj.get(Constants.NAME));
				setLabel((String) obj.get(Constants.LABEL));
				setPlan((String) obj.get(Constants.PLAN));
				obj = (BasicDBObject) obj.get(Constants.CREDENTIALS);
				setHostName((String) obj.get(Constants.HOSTNAME));
				setHost((String) obj.get(Constants.HOST));
				setPort((Integer) obj.get(Constants.PORT));
				setUsername((String) obj.get(Constants.USERNAME));
				setPassword((String) obj.get(Constants.PASSWORD));
				setDatabaseName((String) obj.get(Constants.DBNAME));
				setJdbcUrl((String) obj.get(Constants.JDBCURL));
				setUri((String) obj.get(Constants.URI));
				if (!mandatorySet())
					throw new SQLDBConnectionException ("Missing Mandatory fields");
			}
		}
	}

	// Constructor from input params
	public SQLDBConnection(String host, int port, String username, String password,
			String dbname, String schema, boolean autoCommit) throws SQLDBConnectionException {
		clearAll();
		setHost(host);
		setPort(port);
		setUsername(username);
		setPassword(password);
		setDatabaseName(dbname);
		setSchema(schema);
		setAutoCommit(autoCommit);
		setJdbcUrl("jdbc:db2://" + host + ":" + port + "/" + dbname);
		if (!mandatorySet())
			throw new SQLDBConnectionException ("Missing Mandatory fields");
	}

	public void close() throws SQLException {
		// Connection must be on a unit-of-work boundary to allow close
		con.commit();
		// Close the connection
		con.close();
	}

	public void connect() throws SQLException, SQLDBConnectionException {
		if (!mandatorySet())
			throw new SQLDBConnectionException ("Missing Mandatory fields");
		DB2SimpleDataSource dataSource = new DB2SimpleDataSource();
		if (getHost() != "" ) {
			dataSource.setServerName(getHost());
		} else {
			dataSource.setServerName(getHostName());
		}
		dataSource.setPortNumber(getPort());
		dataSource.setDatabaseName(getDatabaseName());
		dataSource.setUser(getUsername());
		dataSource.setPassword(getPassword());
		dataSource.setDriverType(4);
		con = dataSource.getConnection();
		con.setAutoCommit(autoCommit);
	}

	public boolean getAutoCommit() {
		return this.autoCommit;
	}

	public String getDatabaseName() {
		return databaseName;
	}

	public String getHost() {
		return this.host;
	}

	public String getHostName() {
		return hostName;
	}

	public String getJDBCUrl() {
		return jdbcurl;
	}

	public String getLabel() {
		return label;
	}

	public String getName() {
		return name;
	}

	public String getPassword() {
		return password;
	}

	public String getPlan() {
		return this.plan;
	}

	public int getPort() {
		return port;
	}

	public String getSchema() {
		return schema;
	}

	public String getUri() {
		return uri;
	}

	public String getUsername() {
		return username;
	}

	public String getVCAPKey() {
		return this.vcapKey;
	}

	public String getVCAPServices() {
		return this.vcapServices;
	}

	public void setAutoCommit(boolean autoCommit) {
		this.autoCommit = autoCommit;
	}

	public void setDatabaseName(String databaseName) {
		this.databaseName = databaseName;
	}

	public void setHost(String host) {
		this.host = host;
	}

	public void setHostName(String hostName) {
		this.hostName = hostName;
	}

	public void setJdbcUrl(String jdbcurl) {
		this.jdbcurl = jdbcurl;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setPlan(String plan) {
		this.plan = plan;
	}

	public void setPort(int port) {
		this.port = port;
	}

	public void setSchema(String schema) {
		this.schema = schema;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	private void setVCAPKey(String vcapKey) {
		this.vcapKey = vcapKey;
	}

	public Connection getConnection() {
		return this.con;
	}

	public String toString(){
		return toString(false);
	}
	
	// Returns a string with all the settings, formatted for HTML if the
	// parameter is set to true
	public String toString(boolean html) {
		String htmlBreak = "";
		String nbspx2 = "  ";
		if (html) {
			nbspx2 = "&nbsp;&nbsp;";
			htmlBreak = "<br>";
		}
		String s = new String();
		s = s + "VCAP Key: " + getVCAPKey() + htmlBreak + "\n";
		s = s + "Instance Name: " + getName() + htmlBreak + "\n";
		s = s + "Label: " + getLabel() + htmlBreak + "\n";
		s = s + "Plan: " + getPlan() + htmlBreak + "\n";
		s = s + "Credentials" + htmlBreak + "\n";
		s = s + nbspx2 + "Host: " + getHost() + htmlBreak + "\n";
		s = s + nbspx2 + "Host name: " + getHostName() + htmlBreak + "\n";
		s = s + nbspx2 + "Port: " + getPort() + htmlBreak + "\n";
		s = s + nbspx2 + "Username: " + getUsername() + htmlBreak + "\n";
		s = s + nbspx2 + "Password: " + getPassword() + htmlBreak + "\n";
		s = s + nbspx2 + "Database name: " + getDatabaseName() + htmlBreak + "\n";
		s = s + nbspx2 + "JDBC URL: " + getJDBCUrl() + htmlBreak + "\n";
		s = s + nbspx2 + "URI: " + getUri() + htmlBreak + "\n";
		return s;
	}
}
