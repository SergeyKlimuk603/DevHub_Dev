public with sharing class PdfDocumentGenerator {
    public static Blob generatePDF(String recordId, String headerValue, String footerValue, String param) {
        PageReference pdfPage = Page.PdfDocument;
        
        pdfPage.getParameters().put('param', param);
        pdfPage.getParameters().put('headerValue', headerValue);
        pdfPage.getParameters().put('footerValue', footerValue);
        pdfPage.getParameters().put('accountId', recordId);
        
        Blob pdfBlob = pdfPage.getContentAsPDF();

        return pdfBlob;
    }
}