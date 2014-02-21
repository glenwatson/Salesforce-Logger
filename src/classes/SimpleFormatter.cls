/*
 *	@author Glen Watson
 *	@created 2013-02-25
 */
public virtual class SimpleFormatter extends Formatter {
	public static final String LINE_BREAK = '\r\n';
	
	public virtual override String format(LogRecord record) {
		if(record.getException() == null) {
			return record.getMessage();
		} else {
			return record.getMessage() + LINE_BREAK + formatException(record.getException());
		}
	}
	
	public static String formatException(Exception ex) {
		String out = ex.getTypeName() +
				LINE_BREAK + 
				ex.getMessage() + 
				LINE_BREAK + 
				ex.getStackTraceString();
		if(ex.getCause() != null) {
			out =+ LINE_BREAK + 'Caused by: ' + formatException(ex.getCause());
		} 
		
		return out;
	}
}