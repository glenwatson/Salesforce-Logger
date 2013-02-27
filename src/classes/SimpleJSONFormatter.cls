/*
    @author Glen Watson
    @created Feb 26, 2013
*/
public with sharing class SimpleJSONFormatter extends Formatter
{
    private JSONGenerator gen;
    public SimpleJSONFormatter (boolean pretty)
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