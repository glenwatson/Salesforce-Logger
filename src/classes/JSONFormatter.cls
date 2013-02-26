public with sharing class JSONFormatter extends Formatter
{
	private JSONGenerator gen;
	public JSONFormatter(boolean pretty)
	{
		gen = JSON.createGenerator(pretty);
	}
	public virtual override String format(LogRecord record)
	{
		
		gen.writeStartObject();
		gen.writeStringField('level', String.valueOf(record.getLevel()));
		gen.writeDateTimeField('timestamp', record.getEventTimestamp());
		gen.writeStringField('message', record.getMessage());
		if(record.getException() != null)
			gen.writeObjectField('exception', record.getException());
		gen.writeEndObject();
		
		return gen.getAsString();
	}
}