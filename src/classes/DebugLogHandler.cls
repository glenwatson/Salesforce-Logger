/*
	@author Glen Watson
	@created Feb 25, 2013
*/
public class DebugLogHandler extends Handler
{
	public override void publish(LogRecord record)
	{
		if(getFilter().isLoggable(record))
			System.debug(getFormatter().format(record));
	}
	
	public override void close() {}
}