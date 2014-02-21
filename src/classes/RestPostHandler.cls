/*
 *  POSTs the log to the URL passed in on initalization
 *	@author Glen Watson
 *	@created 2013-02-27
 */
public virtual class RestPostHandler extends Handler {
	private String url;
	private Http httpClient;
	
	public RestPostHandler(String url) {
		this.url = url;
		httpClient = new Http();
	}
	
	public virtual override void publish(LogRecord record) {
		if(isLoggable(record)) {
			HttpRequest request = new HttpRequest();
			request.setEndpoint(url);
			request.setMethod('POST');
			request.setBody(getFormatter().format(record));
			httpClient.send(request);
		}
	}
	
	public virtual override void close() {} //nothing to close
}