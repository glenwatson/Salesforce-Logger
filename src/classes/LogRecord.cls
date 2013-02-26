/*
	@author Glen Watson
	@created Feb 25, 2013
	@see http://docs.oracle.com/javase/1.4.2/docs/api/java/util/logging/LogRecord.html
*/
public class LogRecord
{
	private System.LoggingLevel level;
	private String message;
	private System.Exception ex;
	private Date eventTime;

	public LogRecord(System.LoggingLevel level, String message, System.Exception ex)
	{
		this.level = level;
		this.message = message;
		this.ex = ex;
	}

	public LogRecord(System.LoggingLevel level, String message)
	{
		this.level = level;
		this.message = message;
	}

	public System.LoggingLevel getLevel()
	{
		return level;
	}

	public void setLevel(System.LoggingLevel level)
	{
		this.level = level;
	}

	public String getMessage()
	{
		return message;
	}

	public void setMessage(String message)
	{
		this.message = message;
	}

	public System.Exception getException()
	{
		return ex;
	}

	public void setException(System.Exception ex)
	{
		this.ex = ex;
	}

	public Date getEventTime()
	{
		return eventTime;
	}

	public void setEventTime(Date eventTime)
	{
		this.eventTime = eventTime;
	}
}