/*
 *  Uses to prefix your debug messages with a string
 *  Can be used to prefix the specific class or an entire namespace 
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