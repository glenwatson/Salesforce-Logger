/*
 *	@author Glen Watson
 *	@created 2013-02-25
 */
public virtual class DatabaseLogHandler extends Handler {
	
	public virtual override void publish(LogRecord record) {
		if(isLoggable(record)) {
			insert new DatabaseLogRecord__c(
				Level__c = String.valueOf(record.getLevel()),
				Message__c = record.getMessage(), 
				Exception__c = SimpleFormatter.formatException(record.getException()),
				Timestamp__c = record.getEventTimestamp());
		}
	}
	
	public virtual override void close() {} //nothing to close
}