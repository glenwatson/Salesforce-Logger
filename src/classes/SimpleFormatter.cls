public  class SimpleFormatter extends Formatter
{
	private static final String LINE_BREAK = '\r\n';
	public override String format(LogRecord record)
	{
		if(record.getException() == null)
			return record.getMessage();
		else
			return record.getMessage() + LINE_BREAK + record.getException().getMessage() + LINE_BREAK + record.getException().getStackTraceString();
	}
}