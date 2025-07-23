public class OpportunityHelper {
    public static Decimal calculateDiscount(Decimal amount, Decimal rate) {
        return amount - (amount * rate / 100);
    }
}
