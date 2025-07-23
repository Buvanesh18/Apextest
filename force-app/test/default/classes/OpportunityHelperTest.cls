@isTest
public class OpportunityHelperTest {
    @isTest
    static void testCalculateDiscount() {
        Decimal discounted = OpportunityHelper.calculateDiscount(1000, 10);
        System.assertEquals(900, discounted);
    }
}
