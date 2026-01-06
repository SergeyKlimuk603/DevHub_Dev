public class DocumentController {
    
    public String boddy {get; set;}

    public DocumentController(){
        boddy = ApexPages.currentPage().getParameters().get('boddy');
    } 
}