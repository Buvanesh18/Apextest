public class LoanEligibilityChecker {
    public static Boolean isEligible(Integer age, Double annualIncome) {
        if (age >= 21 && annualIncome >= 500000) {
            return true;
        }
        return false;
    }
}
