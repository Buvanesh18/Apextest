@isTest
private class AccountHandlerTest {
    @isTest
    static void testCreateAccount() {
        Test.startTest();
        Account acc = AccountHandler.createAccount('Test Account');
        Test.stopTest();
        System.assertNotEquals(null, acc.Id);
    }

    @isTest
    static void testUpdateAccountName() {
        Account acc = new Account(Name = 'Old Name');
        insert acc;

        Test.startTest();
        AccountHandler.updateAccountName(acc.Id, 'New Name');
        Test.stopTest();

        Account updated = [SELECT Name FROM Account WHERE Id = :acc.Id];
        System.assertEquals('New Name', updated.Name);
    }
}
