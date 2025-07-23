@isTest
public class CurrencyFormatterTest {
    @isTest
    static void testFormatCurrency() {
        String formatted = CurrencyFormatter.formatCurrency(1234.5);
        System.assertEquals('$1234.50', formatted, 'Currency should be properly formatted with two decimals');
    }
}
