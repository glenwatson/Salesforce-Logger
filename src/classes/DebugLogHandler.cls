/*
	@author Glen Watson
	@created Feb 25, 2013
*/
public class DebugLogHandler extends Handler
{
	public DebugLogHandler(Formatter formatter)
	{
		setFormatter(formatter);
	}
	public override void publish(LogRecord record)
	{
		if(isLoggable(record))
			System.debug(getFormatter().format(record));
	}
	
	public override void close() {} //nothing to close
}