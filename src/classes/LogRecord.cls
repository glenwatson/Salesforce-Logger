/*
 *	@author Glen Watson
 *	@created 2013-02-25
 *	@see http://docs.oracle.com/javase/6/docs/api/java/util/logging/LogRecord.html
 */
public virtual class LogRecord {
	private System.LoggingLevel level;
	private String message;
	private System.Exception ex;
	private DateTime eventTimestamp;
	
	public LogRecord(System.LoggingLevel level, String message, System.Exception ex) {
		eventTimestamp = System.now();
		this.level = level;
		this.message = message;
		this.ex = ex;
	}
	
	public LogRecord(System.LoggingLevel level, String message) {
		eventTimestamp = System.now();
		this.level = level;
		this.message = message;
	}
	
	public System.LoggingLevel getLevel() {
		return level;
	}
	
	public void setLevel(System.LoggingLevel level) {
		this.level = level;
	}
	
	public String getMessage() {
		return message;
	}
	
	public void setMessage(String message) {
		this.message = message;
	}
	
	public System.Exception getException() {
		return ex;
	}
	
	public void setException(System.Exception ex) {
		this.ex = ex;
	}
	
	public DateTime getEventTimestamp() {
		return eventTimestamp;
	}
	
	public void setEventTimestamp(DateTime eventTime) {
		this.eventTimestamp = eventTime;
	}
}