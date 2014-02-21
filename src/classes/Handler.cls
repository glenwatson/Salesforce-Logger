/*
 *	@author Glen Watson
 *	@created 2013-02-25
 *	@see http://docs.oracle.com/javase/6/docs/api/java/util/logging/Handler.html
 */
public abstract class Handler {
	private Filter filter;
	private Formatter formatter;
	private System.LoggingLevel level;
	
	public Handler() {}
	
	public abstract void publish(LogRecord record);
	public abstract void close();
	
	public boolean isLoggable(LogRecord record) {
		return filter == null ? true : filter.isLoggable(record);
	}
	
	public void setLevel(System.LoggingLevel l) {
		level = l;
	}
	public System.LoggingLevel getLevel() {
		return level;
	}
	
	public void setFilter(Filter f) {
		filter = f;
	}
	public Filter getFilter() {
		return filter;
	}
	
	public void setFormatter(Formatter f) {
		formatter = f;
	}
	public Formatter getFormatter() {
		return formatter;
	}
}