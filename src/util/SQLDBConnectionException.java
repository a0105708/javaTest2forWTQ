package util;

public class SQLDBConnectionException extends Exception {

	private static final long serialVersionUID = 1L;
	public SQLDBConnectionException () {}
	public SQLDBConnectionException (String message) {
		super(message);
	}

}
