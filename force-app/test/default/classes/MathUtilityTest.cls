@isTest
private class MathUtilityTest {
    @isTest
    static void testSquare() {
        Integer input = 5;
        Integer expected = 25;
        Integer result = MathUtility.square(input);
        System.assertEquals(expected, result, 'The square calculation is incorrect');
    }
}
