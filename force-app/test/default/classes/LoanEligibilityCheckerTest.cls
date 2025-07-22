@isTest
public class LoanEligibilityCheckerTest {
    @isTest
    static void testIsEligible() {
        // Positive case
        Boolean result1 = LoanEligibilityChecker.isEligible(25, 600000);
        System.assertEquals(true, result1, 'Should be eligible');

        // Negative case - low income
        Boolean result2 = LoanEligibilityChecker.isEligible(30, 300000);
        System.assertEquals(false, result2, 'Should not be eligible');

        // Negative case - low age
        Boolean result3 = LoanEligibilityChecker.isEligible(18, 700000);
        System.assertEquals(false, result3, 'Should not be eligible');
    }
}
