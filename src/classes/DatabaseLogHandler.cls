/*
	@author Glen Watson
	@created Feb 25, 2013
*/
public class DatabaseLogHandler extends Handler
{
	public override void publish(LogRecord record)
	{
		if(isLoggable(record))
			insert new DatabaseLogRecord__c(
				Level__c = record.getLevel()+'', //can't get .toString() to compile on enums
				Message__c = record.getMessage(), 
				Exception__c = SimpleFormatter.formatException(record.getException()),
				Timestamp__c = record.getEventTimestamp());
	}
	
	public override void close() {} //nothing to close
}