@isTest
public class TemperatureConverterTest {
    @isTest
    static void testCelsiusToFahrenheit() {
        Double result = TemperatureConverter.celsiusToFahrenheit(0);
        System.assertEquals(32.0, result, '0°C should be 32°F');
    }

    @isTest
    static void testFahrenheitToCelsius() {
        Double result = TemperatureConverter.fahrenheitToCelsius(32);
        System.assertEquals(0.0, result, '32°F should be 0°C');
    }
}
