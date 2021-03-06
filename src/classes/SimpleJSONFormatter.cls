/*
 *  Formats the log in the following format:
 *  {
 *    level: <level>,
 *    timestamp: <timestamp>,
 *    message: <message>,
 *    [exception: <exception>]
 *  }
 *	@author Glen Watson
 *	@created 2013-02-26
 */
public with sharing class SimpleJSONFormatter extends Formatter {
	private JSONGenerator gen;
	
	public SimpleJSONFormatter (boolean pretty) {
		gen = JSON.createGenerator(pretty);
	}
	
	public virtual override String format(LogRecord record) {
		gen.writeStartObject();
		gen.writeStringField('level', String.valueOf(record.getLevel()));
		gen.writeDateTimeField('timestamp', record.getEventTimestamp());
		gen.writeStringField('message', record.getMessage());
		if(record.getException() != null) {
			gen.writeObjectField('exception', record.getException());
		}
		gen.writeEndObject();
		
		return gen.getAsString();
	}
}