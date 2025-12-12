public with sharing class FlowActionWithParameters_10122025 {
    @InvocableMethod(label='Process FlowRequest' description='Processes the flow request and returns the response.' category='KS Actions')
    public static List<FlowResponse> processFlowRequest(List<FlowRequest> requests) {
        List<FlowResponse> responses = new List<FlowResponse>();
        
        for (FlowRequest request : requests) {
            FlowResponse response = new FlowResponse();
            response.outputString = request.inputString.toUpperCase();  
            response.outputNumber = request.inputNumber * 2;
            
            response.apexDefine = new ApexDefineVariable_101225();
            response.apexDefine.textValue = request.apexDefine.textValue + ' | ' + request.apexDefine.textValue;

            response.responseBody = new FlowResponseBody();
            response.responseBody.outputStrings = new List<String>();
            response.responseBody.outputStrings.add('Default Output String');

            List<String> inputStrings = request.requestBody?.inputStrings;
            if (inputStrings != null) {
                for (String str : request.requestBody.inputStrings) {
                    response.responseBody.outputStrings.add(str.toUpperCase());
                }
            }
            
            responses.add(response);
        }

        TestClass testClass1 = new TestClass();
        testClass1.testString = 'Test String Value';

        return responses;
    }

    public class FlowRequest {
        @InvocableVariable(label='Input String' description='The string to be converted.' required=true)
        public String inputString;

        @InvocableVariable(label='Input Number' description='Number to be convert.' defaultValue='0')
        public Integer inputNumber;

        @InvocableVariable(label='FlowRequestBody' description='Flow RequestBody to be converted.')
        public FlowRequestBody requestBody;

        // This variable will be visible in the Flow Builder
        @InvocableVariable(label='Input ApexDefineVariable' description='Input ApexDefine variable.')
        public ApexDefineVariable_101225 apexDefine;
    }

    // This inner class will not be visible in the Flow Builder, but you will see all the data as a JSON.
    public class FlowRequestBody {
        @InvocableVariable(label='Input Strings' description='The list of strings to be converted.')
        public List<String> inputStrings;
    }

    public class FlowResponse {
        @InvocableVariable(label='Output String' description='The converted string.')
        public String outputString;

        @InvocableVariable(label='Output Number' description='The converted number.')
        public Integer outputNumber;

        @InvocableVariable(label='FlowRequestBody' description='The converted FlowResponseBody.')
        public FlowResponseBody responseBody;

        // This variable will be visible in the Flow Builder
        @InvocableVariable(label='Output ApexDefineVariable' description='Output ApexDefine variable.')
        public ApexDefineVariable_101225 apexDefine;
    }

    // This inner class will not be visible in the Flow Builder, but you will see all the data as a JSON.
    public class FlowResponseBody {
        @InvocableVariable(label='Output Strings' description='The list of converted strings.')
        public List<String> outputStrings;
    }

    public class TestClass {
        // This variable will not be visible in the Flow Builder
        @InvocableVariable(label='Test String' description='Test string in method.')
        public String testString;
    }
}