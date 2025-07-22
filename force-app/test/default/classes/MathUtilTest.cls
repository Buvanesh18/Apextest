@IsTest
private class MathUtilTest {
    @IsTest
    static void testAdd() {
        Integer result = MathUtil.add(5, 3);
        System.assertEquals(8, result, 'Add method failed');
    }

    @IsTest
    static void testSubtract() {
        Integer result = MathUtil.subtract(10, 4);
        System.assertEquals(6, result, 'Subtract method failed');
    }
}
