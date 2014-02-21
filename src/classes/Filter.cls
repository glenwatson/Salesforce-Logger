/*
 *	@author Glen Watson
 *	@created 2013-02-25
 *	@see http://docs.oracle.com/javase/6/docs/api/java/util/logging/Filter.html
 */
public interface Filter {
	boolean isLoggable(LogRecord record);
}