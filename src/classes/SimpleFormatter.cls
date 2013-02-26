public virtual class SimpleFormatter extends Formatter
{
	public static final String LINE_BREAK = '\r\n';
	public virtual override String format(LogRecord record)
	{
		if(record.getException() == null)
			return record.getMessage();
		else
			return record.getMessage() + LINE_BREAK + formatException(record.getException());
	}
	
	public static String formatException(Exception ex)
	{
		return ex.getTypeName() +
				LINE_BREAK + 
				ex.getMessage() + 
				LINE_BREAK + 
				ex.getStackTraceString();
	}
}