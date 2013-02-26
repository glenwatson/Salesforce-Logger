/*
	@author Glen Watson
	@created Feb 25, 2013
*/
public virtual class DebugLogHandler extends Handler
{
	public DebugLogHandler(Formatter formatter)
	{
		setFormatter(formatter);
	}
	public virtual override void publish(LogRecord record)
	{
		if(isLoggable(record))
			System.debug(getFormatter().format(record));
	}
	
	public virtual override void close() {} //nothing to close
}