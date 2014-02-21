/*
 *  Logs the message to Salesforce's logger
 *	@author Glen Watson
 *	@created 2013-02-25
 */
public virtual class DebugLogHandler extends Handler {
	
	public DebugLogHandler(Formatter formatter) {
		setFormatter(formatter);
	}
	
	public virtual override void publish(LogRecord record) {
		if(isLoggable(record)) {
			System.debug(getFormatter().format(record));
		}
	}
	
	public virtual override void close() {} //nothing to close
}