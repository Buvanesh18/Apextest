public class SimpleInterestCalculator {
    public static Decimal calculateInterest(Decimal principal, Decimal rate, Integer time) {
        if (principal < 0 || rate < 0 || time < 0) {
            throw new IllegalArgumentException('Values must be non-negative');
        }
        return (principal * rate * time) / 100;
    }
}
