public class StringUtil {
    public static Boolean isPalindrome(String input) {
        if (String.isBlank(input)) return false;
        String cleaned = input.replaceAll('[^A-Za-z0-9]', '').toLowerCase();
        String reversed = cleaned.reverse();
        return cleaned == reversed;
    }
}
