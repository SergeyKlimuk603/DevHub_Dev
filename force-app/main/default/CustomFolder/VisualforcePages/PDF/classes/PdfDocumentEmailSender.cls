public with sharing class PdfDocumentEmailSender {
    public static void sendEmailWithPDF(String recordId, String headerValue, String footerValue, String param) {
        Blob pdfBlob = PdfDocumentGenerator.generatePDF(recordId, headerValue, footerValue, param);

        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setToAddresses(new String[] { 'sergeyklimuk79@gmail.com', 'siarhei_klimuk@senla.eu' });
        email.setSubject('PdfDocument');
        email.setPlainTextBody('Please find attached details in PDF format.');

        Messaging.EmailFileAttachment attachment = new Messaging.EmailFileAttachment();
        attachment.setFileName('PdfDocument.pdf');
        attachment.setBody(pdfBlob);
        email.setFileAttachments(new Messaging.EmailFileAttachment[] { attachment });

        Messaging.SendEmailResult[] res = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });

        System.debug(res[0].isSuccess());
        System.debug(res[0].getErrors());
    }

    // Script
    // Для отправки Email не забудь верифицировать email пользователя от которого отправляется письмо в настройках Salesforce.
    // PdfDocumentEmailSender.sendEmailWithPDF('001recordId', 'Some Header Value', 'Some Footer Value', 'Some Param Value');
}