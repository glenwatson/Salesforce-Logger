/*
	@author Glen Watson
	@created Feb 25, 2013
	@see http://docs.oracle.com/javase/1.4.2/docs/api/java/util/logging/Logger.html
*/
public class Logger
{
	private static final System.LoggingLevel DEFAULT_LEVEL = System.LoggingLevel.DEBUG;
	private static List<Handler> handlers = new List<Handler>();
	static
	{
		handlers.add(new DebugLogHandler(new SimpleJSONFormatter(true)));
	}
	private static Filter filter;
	
	public Logger() 
	{}
	
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
	/* Method for each level */
	public static void error(String msg)
	{
		log(System.LoggingLevel.ERROR, msg);
	}
	public static void warn(String msg)
	{
		log(System.LoggingLevel.WARN, msg);
	}
	public static void debug(String msg)
	{
		log(System.LoggingLevel.DEBUG, msg);
	}
	public static void info(String msg)
	{
		log(System.LoggingLevel.INFO, msg);
	}
	public static void fine(String msg)
	{
		log(System.LoggingLevel.FINE, msg);
	}
	public static void finer(String msg)
	{
		log(System.LoggingLevel.FINER, msg);
	}
	public static void finest(String msg)
	{
		log(System.LoggingLevel.FINEST, msg);
	}
	/*
		To replace System.debug()
	*/
	/* all single types */
	public static void debug(System.LoggingLevel lvl, Object obj)
	{
		log(lvl, toString(obj));
	}
	public static void debug(Object obj)
	{
		log(DEFAULT_LEVEL, toString(obj));
	}
	/* lists */
	public static void debug(List<Object> objs)
	{
		log(DEFAULT_LEVEL, toString(objs));
	}
	public static void debug(System.LoggingLevel lvl, List<Object> objs)
	{
		log(lvl, toString(objs));
	}
	/* sets */
	public static void debug(Set<Object> objs)
	{
		log(DEFAULT_LEVEL, toString(objs));
	}
	public static void debug(System.LoggingLevel lvl, Set<Object> objs)
	{
		log(lvl, toString(objs));
	}
	/* maps */
	public static void debug(Map<Object, Object> objs)
	{
		log(DEFAULT_LEVEL, toString(objs));
	}
	public static void debug(System.LoggingLevel lvl, Map<Object, Object> objs)
	{
		log(lvl, toString(objs));
	}
	
	private static String toString(Object obj)
	{
		return String.valueOf(obj);
	}
	private static String toString(List<Object> objs)
	{
		return '{'+String.join(objs, ', ')+'}';
	}
	private static String toString(Set<Object> objs)
	{
		return '{'+String.join(new List<Object>(objs), ', ')+'}';
	}
	private static String toString(Map<Object, Object> objs)
	{
		return '{'+String.join(new List<Object>(objs.keySet()), ', ')+'}';
	}
}