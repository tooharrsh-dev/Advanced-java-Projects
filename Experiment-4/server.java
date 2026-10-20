import java.rmi.Naming;
import java.rmi.registry.LocateRegistry;

public class server {

    public static void main(String[] args) {

        try {

            // Start RMI Registry
            LocateRegistry.createRegistry(1099);

            // Create implementation object
            CalculatorImplementation obj =
                    new CalculatorImplementation();

            // Bind object with RMI Registry
            Naming.rebind(
                    "rmi://localhost/Calculator",
                    obj
            );

            System.out.println(
                    "RMI Server Started Successfully..."
            );

        } catch (Exception e) {

            e.printStackTrace();

        }

    }

}