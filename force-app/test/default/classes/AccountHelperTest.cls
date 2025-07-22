@isTest
public class AccountHelperTest {
    @isTest
    static void testGetAccountGreeting() {
        String result1 = AccountHelper.getAccountGreeting('Acme Corp');
        System.assertEquals('Hello, Acme Corp!', result1);

        String result2 = AccountHelper.getAccountGreeting('');
        System.assertEquals('Hello, Guest!', result2);
    }
}
