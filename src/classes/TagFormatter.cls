/*
 *	@author Glen Watson
 *	@created 2013-02-25
 */
public virtual class TagFormatter extends SimpleFormatter {
	private String tag;
	
	public TagFormatter(String tag) {
		this.tag = tag;
	}
	
	public virtual override String format(LogRecord record) {
		return tag + ':' + super.format(record);
	}
}