/*
	@author Glen Watson
	@created Feb 25, 2013
	@see http://docs.oracle.com/javase/1.4.2/docs/api/java/util/logging/Logger.html
*/
public class Logger
{
	protected List<Handler> handlers;
	protected Filter filter;
	protected System.LoggingLevel level;
	
	public Logger() 
	{
		handlers = new List<Handler>();
	}
		
	public void log(LogRecord record)
	{
		publish(record);
	}
	
	public void log(System.LoggingLevel level, String msg)
	{
		publish(new LogRecord(level, msg));
	}
	
	public void log(System.LoggingLevel level, String msg, Exception ex)
	{
		publish(new LogRecord(level, msg, ex));
	}
	
	/* Convenience Methods */
	/*
		To replace System.debug
	*/
	public void debug(System.LoggingLevel level, String msg)
	{
		publish(new LogRecord(System.LoggingLevel.DEBUG, msg));
	}
	/* Method for each level */
	public void error(String msg)
	{
		publish(new LogRecord(System.LoggingLevel.ERROR, msg));
	}
	public void warn(String msg)
	{
		publish(new LogRecord(System.LoggingLevel.WARN, msg));
	}
	public void debug(String msg)
	{
		publish(new LogRecord(System.LoggingLevel.DEBUG, msg));
	}
	public void info(String msg)
	{
		publish(new LogRecord(System.LoggingLevel.INFO, msg));
	}
	public void fine(String msg)
	{
		publish(new LogRecord(System.LoggingLevel.FINE, msg));
	}
	public void finer(String msg)
	{
		publish(new LogRecord(System.LoggingLevel.FINER, msg));
	}
	public void finest(String msg)
	{
		publish(new LogRecord(System.LoggingLevel.FINEST, msg));
	}
	
	
	public void addHandler(Handler handler)
	{
		handlers.add(handler);
	}
	
	public void setLevel(System.LoggingLevel l)
	{
		level = l;
	}
	
	public void setFilter(Filter f)
	{
		filter = f;
	}
	public Filter getFilter()
	{
		return filter;
	}
	
	private void publish(LogRecord record)
	{
		for(Handler handler : handlers)
		{
			handler.publish(record);
		}
	}
}