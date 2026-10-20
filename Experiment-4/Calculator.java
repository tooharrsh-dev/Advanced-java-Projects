import java.rmi.Remote;
import java.rmi.RemoteException;

public interface Calculator extends Remote {
    int add(int a , int b ) throws RemoteException;
    int subtraction(int a , int b ) throws RemoteException;

}