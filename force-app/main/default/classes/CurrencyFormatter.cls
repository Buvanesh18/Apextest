public class CurrencyFormatter {
    public static String formatCurrency(Decimal amount) {
        return '$' + String.valueOf(amount.setScale(2));
    }
}
