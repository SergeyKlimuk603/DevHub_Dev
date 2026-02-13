public with sharing class CheckCaseStatusBot {
    public class CaseInput {
        @InvocableVariable (required=true)
        public String caseStatus;
    }

    public class CaseOutput {
        @InvocableVariable (required=true)
        public String caseNumber;
    }

    @InvocableMethod(label='Check Case Status' description='Checks the status of a case and returns the case number if it is open.')
    public static List<CaseOutput> checkCaseStatus(List<CaseInput> caseInputs) {
        Set<String> caseNumbers = new Set<String>();

        for (CaseInput caseImp : caseInputs) {
            caseNumbers.add(caseImp.caseNumber);
        }

        List<Case> cases = [SELECT Status, Subject, CaseNumber FROM Case WHERE CaseNumber IN :caseNumbers];

        Map<String, String> mapNameStatus = new Map<String, String>();
        for (Case vCase : cases) { 
            mapNameStatus.put(vCase.CaseNumber, vCase.Status); 
        }

        List<CaseOutput> caseOutputs = new List<CaseOutput>();
        for (CaseInput caseInput : caseInputs) {
            CaseOutput caseOutput = new CaseOutput();
            output.caseNumber = caseNumber;
            outputs.add(output);
        }
        return outputs;
    }