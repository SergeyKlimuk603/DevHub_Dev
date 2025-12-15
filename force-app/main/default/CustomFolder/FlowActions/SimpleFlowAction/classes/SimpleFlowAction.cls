public with sharing class SimpleFlowAction {
    @InvocableMethod(label='Сonvert To Upper Case' description='Returns the list of strings converted to upper case.' category='KS Actions')
    public static List<String> convertToUpperCase(List<String> inputStrings) {
        List<String> upperCaseStrings = new List<String>();
        
        for (String str : inputStrings) {
            upperCaseStrings.add(str.toUpperCase());
        }

        return upperCaseStrings;
    }
}