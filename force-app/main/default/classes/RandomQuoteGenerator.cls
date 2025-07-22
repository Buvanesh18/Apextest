public class RandomQuoteGenerator {
    public static String getQuote() {
        List<String> quotes = new List<String>{
            'The journey of a thousand miles begins with one step.',
            'Code is like humor. When you have to explain it, it’s bad.',
            'In the middle of difficulty lies opportunity.',
            'Stay hungry. Stay foolish.'
        };

        Integer index = Math.mod(Crypto.getRandomInteger(), quotes.size());
        return quotes[index];
    }
}
