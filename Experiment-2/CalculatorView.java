import javax.swing.*;

public class CalculatorView extends JFrame {

    JTextField txtNum1, txtNum2, txtResult;

    JButton add, sub, mul, div;

    public CalculatorView() {

        setTitle("Calculator");
        setSize(400, 400);

        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        setLayout(null);


        // First Number

        JLabel l1 = new JLabel("First Number");
        l1.setBounds(50, 30, 100, 25);
        add(l1);

        txtNum1 = new JTextField();
        txtNum1.setBounds(170, 30, 150, 25);
        add(txtNum1);


        // Second Number

        JLabel l2 = new JLabel("Second Number");
        l2.setBounds(50, 80, 100, 25);
        add(l2);

        txtNum2 = new JTextField();
        txtNum2.setBounds(170, 80, 150, 25);
        add(txtNum2);


        // Buttons

        add = new JButton("+");
        add.setBounds(100, 140, 60, 30);
        add(add);


        sub = new JButton("-");
        sub.setBounds(180, 140, 60, 30);
        add(sub);


        mul = new JButton("*");
        mul.setBounds(100, 190, 60, 30);
        add(mul);


        div = new JButton("/");
        div.setBounds(180, 190, 60, 30);
        add(div);


        // Result

        JLabel l3 = new JLabel("Result");
        l3.setBounds(50, 250, 100, 25);
        add(l3);


        txtResult = new JTextField();
        txtResult.setBounds(170, 250, 150, 25);
        txtResult.setEditable(false);
        add(txtResult);


        setLocationRelativeTo(null);

        setVisible(true);
    }
}