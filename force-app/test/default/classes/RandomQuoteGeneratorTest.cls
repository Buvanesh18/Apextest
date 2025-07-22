@isTest
public class RandomQuoteGeneratorTest {
    @isTest
    static void testGetQuote() {
        String quote = RandomQuoteGenerator.getQuote();
        System.assertNotEquals(null, quote, 'Quote should not be null');
        System.debug('Random Quote: ' + quote);
    }
}
