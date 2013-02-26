/*
	@author Glen Watson
	@created Feb 25, 2013
	@see http://docs.oracle.com/javase/1.4.2/docs/api/java/util/logging/Formatter.html
*/
public abstract class Formatter
{
	public abstract String format(LogRecord record);
}