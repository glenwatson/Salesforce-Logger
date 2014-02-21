/*
 *	@author Glen Watson
 *	@created 2013-02-25
 *	@see http://docs.oracle.com/javase/6/docs/api/java/util/logging/Formatter.html
 */
public abstract class Formatter {
	public abstract String format(LogRecord record);
}