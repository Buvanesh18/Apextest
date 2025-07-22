@isTest
private class AccountValidatorTest {
    @isTest
    static void testValidName() {
        System.assert(AccountValidator.isValidAccountName('Acme Inc'));
    }

    @isTest
    static void testInvalidName() {
        System.assertEquals(false, AccountValidator.isValidAccountName(''));
        System.assertEquals(false, AccountValidator.isValidAccountName(null));
        System.assertEquals(false, AccountValidator.isValidAccountName('AB'));
    }
}
