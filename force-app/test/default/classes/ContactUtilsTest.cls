@isTest
public class ContactUtilsTest {
    @isTest
    static void testIsEmailValid() {
        Contact c = new Contact(FirstName='Test', LastName='User', Email='test@example.com');
        System.assert(ContactUtils.isEmailValid(c));
    }
    //change
}
