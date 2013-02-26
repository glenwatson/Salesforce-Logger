/*
	@author Glen Watson
	@created Feb 25, 2013
*/
public class DebugLogHandler extends Handler
{
	public override void publish(LogRecord record)
	{
		System.debug(record.getLevel(), record.getMessage() + record.getException());
	}
	
	public override void close() {}
}