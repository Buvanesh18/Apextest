@isTest
public class StringUtilTest {
    @isTest
    static void testPalindromeTrue() {
        System.assertEquals(true, StringUtil.isPalindrome('Madam'));
    }

    @isTest
    static void testPalindromeFalse() {
        System.assertEquals(false, StringUtil.isPalindrome('Hello'));
    }

    @isTest
    static void testEmptyString() {
        System.assertEquals(false, StringUtil.isPalindrome(''));
    }

    @isTest
    static void testWithSpecialCharacters() {
        System.assertEquals(true, StringUtil.isPalindrome('A man, a plan, a canal: Panama'));
    }
}
