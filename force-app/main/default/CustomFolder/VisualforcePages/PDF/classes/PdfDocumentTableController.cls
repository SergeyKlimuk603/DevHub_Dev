public with sharing class PdfDocumentTableController {
    public String mainRecordId { get; set; }
    public String apexParam { get; set; }

    public PdfDocumentTableController() {
        apexParam = ApexPages.currentPage().getParameters().get('param');
    }

    public List<Contact> getRelatedContacts() {
        if (mainRecordId == null) {
            return new List<Contact>();
        }

        List<Contact> contacts = new List<Contact>{
            new Contact(FirstName='John', LastName='Doe', Email='john.doe@example.com'),
            new Contact(FirstName='Jane', LastName='Smith', Email='jane.smith@example.com'),
            new Contact(FirstName='Alice', LastName='Johnson', Email='alice.johnson@example.com')
        };

        return contacts;
    }
    
    // public void setControllerValue (String s) {
    //     controllerValue = s.toUpperCase();
    // }
        
    // public String getControllerValue() {
    //     return controllerValue;
    // }
}