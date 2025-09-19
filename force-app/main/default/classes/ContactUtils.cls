public class ContactUtils {
    public static Boolean isEmailValid(Contact con) {
        return con.Email != null && con.Email.contains('@');
    }
    //change ..............................................................
}
