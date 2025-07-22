@isTest
private class StringUtilsTest {
    @isTest
    static void testReverse() {
        System.assertEquals('cba', StringUtils.reverse('abc'));
        System.assertEquals('', StringUtils.reverse(null));
    }

    @isTest
    static void testCapitalize() {
        System.assertEquals('Hello', StringUtils.capitalize('hello'));
        System.assertEquals('World', StringUtils.capitalize('WORLD'));
        System.assertEquals('', StringUtils.capitalize(''));
    }
}
