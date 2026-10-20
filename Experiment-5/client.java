import java.io.*; 
 import java.net.*;  
 public class client {  
    public static void main(String[] args) { 
         try {  Socket serverSocket = new Socket("localhost", 5000);  
            System.out.println("Connected to server."); 
             BufferedReader input = new BufferedReader(new InputStreamReader(serverSocket.getInputStream()));  
               PrintWriter output = new PrintWriter(serverSocket.getOutputStream(), true); 
                String message = input.readLine();  System.out.println("Client says: " + message);  
                output.println("Hello Client"); 
                 serverSocket.close(); 
                   System.out.println("Connection closed.");        
                  } catch (IOException e) {  System.out.println(e);         

                   }    
                  }  
                } 