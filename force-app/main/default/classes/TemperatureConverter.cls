public class TemperatureConverter {
    public static Double celsiusToFahrenheit(Double celsius) {
        return (celsius * 9/5) + 32;
    }

    public static Double fahrenheitToCelsius(Double fahrenheit) {
        return (fahrenheit - 32) * 5/9;
    }
}
