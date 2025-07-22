public class AccountHandler {
    public static Account createAccount(String name) {
        Account acc = new Account(Name = name);
        insert acc;
        return acc;
    }

    public static void updateAccountName(Id accId, String newName) {
        Account acc = [SELECT Id, Name FROM Account WHERE Id = :accId LIMIT 1];
        acc.Name = newName;
        update acc;
    }
}
