@isTest
public class LeadProcessorTest {
    @isTest
    static void testProcessLead() {
        String result = LeadProcessor.processLead('John');
        System.assertEquals('Processed Lead: John', result);
    }
}
