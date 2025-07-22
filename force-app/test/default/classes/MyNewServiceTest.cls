@isTest
public class MyNewServiceTest {
    @isTest
    static void testAddNumbers() {
        Integer result = MyNewService.addNumbers(5, 7);
        System.assertEquals(12, result, 'The sum should be 12');
    }
}
