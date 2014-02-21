/*
 *	@author Glen Watson
 *	@created 2013-02-25
 */
public virtual class HeaderFooterFormatter extends SimpleFormatter {
	private String header;
	private String footer;
	
	public HeaderFooterFormatter(String header, String footer) {
		this.header = header;
		this.footer = footer;
	}
	
	public HeaderFooterFormatter(String headerFooter) {
		header = headerFooter;
		footer = headerFooter;
	}
	
	public virtual override String format(LogRecord record) {
		return SimpleFormatter.LINE_BREAK + 
				header + 
				SimpleFormatter.LINE_BREAK + 
				super.format(record) + 
				SimpleFormatter.LINE_BREAK + 
				footer;
	}
}