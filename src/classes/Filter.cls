/*
 *	@author Glen Watson
 *	@created 2013-02-25
 *	@see http://docs.oracle.com/javase/1.4.2/docs/api/java/util/logging/Filter.html
 */
public interface Filter {
	boolean isLoggable(LogRecord record);
}