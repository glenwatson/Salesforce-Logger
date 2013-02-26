/*
	@author Glen Watson
	@created Feb 25, 2013
	@see http://docs.oracle.com/javase/1.4.2/docs/api/java/util/logging/LogManager.html
*/
public virtual class LogManager
{
	private List<Logger> loggers;
	protected LogManager()
	{
		loggers = new List<Logger>();
	}
}