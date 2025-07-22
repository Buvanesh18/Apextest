@isTest
private class TemperatureConverterTest {
    @isTest
    static void testCelsiusToFahrenheit() {
        Decimal result = TemperatureConverter.celsiusToFahrenheit(0);
        System.assertEquals(32, result, '0°C should equal 32°F');
    }

    @isTest
    static void testFahrenheitToCelsius() {
        Decimal result = TemperatureConverter.fahrenheitToCelsius(32);
        System.assertEquals(0, result, '32°F should equal 0°C');
    }

    @isTest
    static void testNegativeTemperature() {
        Decimal result = TemperatureConverter.celsiusToFahrenheit(-40);
        System.assertEquals(-40, result, '-40°C equals -40°F');
    }

    @isTest
    static void testDecimalPrecision() {
        Decimal result = TemperatureConverter.fahrenheitToCelsius(98.6);
        System.assert(Math.abs(result - 37.0) < 0.01, '98.6°F should be about 37°C');
    }
}
