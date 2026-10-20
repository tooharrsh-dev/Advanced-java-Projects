import java.awt.event.*;
import javax.swing.*;

public class CalculatorController implements ActionListener {

    CalculatorView view;
    CalculatorModel model;


    public CalculatorController(
            CalculatorView view,
            CalculatorModel model) {

        this.view = view;
        this.model = model;


        view.add.addActionListener(this);
        view.sub.addActionListener(this);
        view.mul.addActionListener(this);
        view.div.addActionListener(this);
    }


    @Override
    public void actionPerformed(ActionEvent e) {

        try {

            double num1 =
                    Double.parseDouble(view.txtNum1.getText());

            double num2 =
                    Double.parseDouble(view.txtNum2.getText());

            double result = 0;


            if (e.getSource() == view.add) {

                result = model.add(num1, num2);

            } else if (e.getSource() == view.sub) {

                result = model.sub(num1, num2);

            } else if (e.getSource() == view.mul) {

                result = model.mul(num1, num2);

            } else if (e.getSource() == view.div) {

                result = model.div(num1, num2);
            }


            view.txtResult.setText(
                    String.valueOf(result)
            );


        } catch (NumberFormatException ex) {

            JOptionPane.showMessageDialog(
                    view,
                    "Please enter valid numbers!"
            );

        } catch (ArithmeticException ex) {

            JOptionPane.showMessageDialog(
                    view,
                    ex.getMessage()
            );
        }
    }
}