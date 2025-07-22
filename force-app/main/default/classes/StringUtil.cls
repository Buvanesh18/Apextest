public class StringUtil {
    public static String reverse(String input) {
        if (String.isBlank(input)) return '';
        return input.reverse();
    }

    public static Boolean isPalindrome(String input) {
        if (input == null) return false;
        String cleaned = input.replaceAll('[^A-Za-z0-9]', '').toLowerCase();
        return cleaned == cleaned.reverse();
    }
}
