/*
    @author Glen Watson
    @created Feb 26, 2013
*/
public with sharing class SimpleXMLFormatter extends Formatter
{
    private XmlStreamWriter xmlWriter;
    public SimpleXMLFormatter()
    {
        xmlWriter = new XmlStreamWriter();
    }
    public virtual override String format(LogRecord record)
    {
        
        xmlWriter.writeStartDocument('UTF-8', '1.0');
        xmlWriter.writeStartElement('', 'logRecord', '');
        writeElement(xmlWriter, 'level', String.valueOf(record.getLevel()));
        writeElement(xmlWriter, 'timestamp', String.valueOf(record.getEventTimestamp()));
        writeElement(xmlWriter, 'message', record.getMessage());
        if(record.getException() != null)
            writeElement(xmlWriter, 'exception', String.valueOf(record.getException()));
        xmlWriter.writeEndElement();
        xmlWriter.writeEndDocument();
        
        return xmlWriter.getXmlString();
    }
    private void writeElement(XmlStreamWriter xmlWriter, String eleName, String characters)
    {
        xmlWriter.writeStartElement('', eleName, '');
        xmlWriter.writeCharacters(characters);
        xmlWriter.writeEndElement();
    }
}