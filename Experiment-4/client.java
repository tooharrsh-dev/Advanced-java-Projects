import java.rmi.Naming;

public class client {
    public static void main(String[]args) {
        try {
            Calculator obj = (Calculator) Naming.lookup("rmi://localhost/Calculator");
            System.out.println("Addition =" + obj.add(10 , 50));
            System.out.println("Subtraction=" + obj.subtraction(50 , 10));

        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
}
