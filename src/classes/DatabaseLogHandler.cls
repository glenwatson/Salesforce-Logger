/*
	@author Glen Watson
	@created Feb 25, 2013
*/
public virtual class DatabaseLogHandler extends Handler
{
	public virtual override void publish(LogRecord record)
	{
		if(isLoggable(record))
			insert new DatabaseLogRecord__c(
				Level__c = record.getLevel()+'', //can't get .toString() to compile on enums
				Message__c = record.getMessage(), 
				Exception__c = SimpleFormatter.formatException(record.getException()),
				Timestamp__c = record.getEventTimestamp());
	}
	
	public virtual override void close() {} //nothing to close
}