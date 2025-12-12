public with sharing class EmailDataProvider {

    // Data provider to get Email for Experience Cloud components
    @AuraEnabled(cacheable=true scope = 'global')
    public static EmailMessage getEmail(String recordId) {
        if (String.isBlank(recordId)) {
            return null;
        }

        List<EmailMessage> emails = [
            SELECT Id, Name, ActivityId, AttachmentIds, AutomationType, BccAddress,
                Case_Communication_Status__c, Case_Status__c, CcAddress, ClientThreadIdentifier, CreatedById, CreatedDate,
                CS_Case_Status__c, Einstein_Email_Summary__c, Email_Message_Process__c, EmailRoutingAddressId,
                EmailTemplateId, FirstOpenedDate, FromAddress, FromId, FromName, HasAttachment, Headers,
                HtmlBody, Incoming, IsBounced, IsClientManaged, IsDeleted, IsExternallyVisible, IsOpened,
                IsTracked, LastModifiedById, LastModifiedDate, LastOpenedDate, MessageDate,
                MessageIdentifier, ParentId, RelatedToId, ReplyToEmailMessageId, Source, Status, Subject,
                SystemModstamp, TextBody, ThreadIdentifier, ToAddress, ValidatedFromAddress
            FROM EmailMessage
            WHERE Id = :recordId
            LIMIT 1
        ];

        return emails.isEmpty() ? null : emails[0];
    }
}