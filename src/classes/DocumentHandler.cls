/*
	@author Glen Watson
	@created Feb 26, 2013
*/
public virtual class DocumentHandler extends Handler
{
	private Document doc;
	public DocumentHandler(String name, Id folderId, Formatter formatter)
	{
		setFormatter(formatter);
		doc = new Document(Name = name, FolderId = folderId, Type = 'txt');
		insert doc;
	}
	
	public DocumentHandler(Id documentId, Formatter formatter)
	{
		setFormatter(formatter);
		doc = [SELECT Id, Body FROM Document WHERE Id = :documentId];
	}
	
	public Id getDocumentId()
	{
		return doc.Id;
	}
	
	public virtual override void publish(LogRecord record)
	{
		if(isLoggable(record))
			appendToDoc(getFormatter().format(record));
	}
	
	private void appendToDoc(String logMsg)
	{
		doc.Body = Blob.valueOf(doc.Body.toString() + logMsg + '\r\n');
	}
	
	public virtual override void close()
	{
		doc = null;
	}
}