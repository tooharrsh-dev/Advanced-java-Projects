import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

public class CalculatorImplementation
        extends UnicastRemoteObject
        implements Calculator {

    public CalculatorImplementation()
            throws RemoteException {

        super();
        
    }

    @Override
    public int add(int a, int b)
            throws RemoteException {

        return a + b;
    }

    @Override
    public int subtraction(int a, int b)
            throws RemoteException {

        return a - b;
    }
}