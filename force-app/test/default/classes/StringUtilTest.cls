@isTest
public class StringUtilTest {
    @isTest
    static void testReverse() {
        String input = 'abcd';
        String expected = 'dcba';
        System.assertEquals(expected, StringUtil.reverse(input));
    }

    @isTest
    static void testPalindromeTrue() {
        String input = 'Madam';
        System.assertEquals(true, StringUtil.isPalindrome(input));
    }

    @isTest
    static void testPalindromeFalse() {
        String input = 'ChatGPT';
        System.assertEquals(false, StringUtil.isPalindrome(input));
    }

    @isTest
    static void testNullInput() {
        System.assertEquals('', StringUtil.reverse(null));
        System.assertEquals(false, StringUtil.isPalindrome(null));
    }
}
