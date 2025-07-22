@isTest
public class SimpleInterestCalculatorTest {
    @isTest
    static void testCalculateInterest() {
        Decimal result = SimpleInterestCalculator.calculateInterest(1000, 5, 2);
        System.assertEquals(100, result, 'Interest should be 100');

        // Test for zero values
        Decimal zeroResult = SimpleInterestCalculator.calculateInterest(0, 5, 2);
        System.assertEquals(0, zeroResult, 'Interest should be 0');

        // Test for negative values
        try {
            SimpleInterestCalculator.calculateInterest(-1000, 5, 2);
            System.assert(false, 'Expected exception for negative input');
        } catch (Exception e) {
            System.assert(e instanceof IllegalArgumentException, 'Should throw IllegalArgumentException');
        }
    }
}
