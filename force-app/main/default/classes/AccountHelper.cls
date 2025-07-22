public class AccountHelper {
    public static String getAccountGreeting(String accountName) {
        if (String.isBlank(accountName)) {
            return 'Hello, Guest!';
        }
        return 'Hello, ' + accountName + '!';
    }
}
