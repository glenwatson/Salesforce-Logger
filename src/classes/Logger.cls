/*
	@author Glen Watson
	@created Feb 25, 2013
	@see http://docs.oracle.com/javase/1.4.2/docs/api/java/util/logging/Logger.html
*/
public class Logger
{
	private static List<Handler> handlers = new List<Handler>();
	static
	{
		handlers.add(new DebugLogHandler(new SimpleFormatter()));
	}
	private static Filter filter;
	
	public Logger() 
	{}
		
	public static void log(LogRecord record)
	{
		publish(record);
	}
	
	public static void log(System.LoggingLevel lvl, String msg)
	{
		publish(new LogRecord(lvl, msg));
	}
	
	public static void log(System.LoggingLevel lvl, String msg, Exception ex)
	{
		publish(new LogRecord(lvl, msg, ex));
	}
	
	public static void log(String msg, Exception ex)
	{
		publish(new LogRecord(System.LoggingLevel.ERROR, msg, ex));
	}
	
	/* Convenience Methods */
	/*
		To replace System.debug()
	*/
	public static void debug(System.LoggingLevel lvl, String msg)
	{
		publish(new LogRecord(lvl, msg));
	}
	/* Method for each level */
	public static void error(String msg)
	{
		publish(new LogRecord(System.LoggingLevel.ERROR, msg));
	}
	public static void warn(String msg)
	{
		publish(new LogRecord(System.LoggingLevel.WARN, msg));
	}
	public static void debug(String msg)
	{
		publish(new LogRecord(System.LoggingLevel.DEBUG, msg));
	}
	public static void info(String msg)
	{
		publish(new LogRecord(System.LoggingLevel.INFO, msg));
	}
	public static void fine(String msg)
	{
		publish(new LogRecord(System.LoggingLevel.FINE, msg));
	}
	public static void finer(String msg)
	{
		publish(new LogRecord(System.LoggingLevel.FINER, msg));
	}
	public static void finest(String msg)
	{
		publish(new LogRecord(System.LoggingLevel.FINEST, msg));
	}
	
	
	public static void addHandler(Handler handler)
	{
		handlers.add(handler);
	}
	
	public static void setFilter(Filter f)
	{
		filter = f;
	}
	public static Filter getFilter()
	{
		return filter;
	}
	
	private static void publish(LogRecord record)
	{
		if(getFilter() == null || (getFilter() != null && getFilter().isLoggable(record)))
		{
			for(Handler handler : handlers)
			{
				handler.publish(record);
			}
		}
	}
}