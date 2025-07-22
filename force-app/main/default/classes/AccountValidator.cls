public class AccountValidator {
    public static Boolean isValidAccountName(String name) {
        return name != null && name.length() >= 3;
    }
}
