/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.jv30_project_final.service;

import com.mycompany.jv30_project_final.entities.CustomerInfoEntity;
import com.mycompany.jv30_project_final.entities.OrderDetailEntity;
import com.mycompany.jv30_project_final.entities.OrderEntity;
import java.util.List;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

/**
 *
 * @author Admin
 */
@Service
public class EmailService {

    @Autowired
    private JavaMailSender emailSender;

    public void sendEmailByAccountId(List<OrderDetailEntity> orderDetails, CustomerInfoEntity cus, OrderEntity order) throws MessagingException {

        MimeMessage message = emailSender.createMimeMessage();

        String string = "";
        String string1 = "";
        boolean multipart = true;

        for (int z = 0; z < orderDetails.size(); z++) {
            string1 = String.format("<tr><td>" + (z+1) + "</td> <td>" + orderDetails.get(z).getName() + "</td> <td>" + orderDetails.get(z).getQuantity() + "</td >"
                    + " <td>" + orderDetails.get(z).getProduct().getPrice() + "00VNĐ</td >"
                    + "<td>" + "%,dVNĐ" + "</td>"
                    + "</tr>",Math.round(orderDetails.get(z).getPrice()*1000));
            string = string + string1;
        }

        String orderDate = "<h4>Order Date: " + order.getDate() + "</h4>";
        String orderId = "<h4>Order Id: " + order.getId() + "</h4>";
        String cusName = "<h4>Customer Name: " + order.getCustomer().getFullName()+ "</h4>";

        MimeMessageHelper helper = new MimeMessageHelper(message, multipart, "UTF-8");
        String thank = "<h4>\r\n"
                + "Thank you for your order\r\n"
                + ""
                + "</h4>";

        String message1 = "Goods will be shipped soon";

        String htmlMsg = String.format("<!DOCTYPE html>\n"
                + "<html>\n"
                + "<head>\n"
                + "  <meta charset=\"utf-8\">"
                + "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n"
                + "  <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css\">\n"
                + "  <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js\"></script>\n"
                + "  <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js\"></script>\n"
                + "<style>\n"
                + "table, th, td {\n"
                + "  border: 1px solid black;\n"
                + "}\n"
                + ""
                + "</style>\n"
                + "</head>\n"
                + "<body>\n"
                + "\n"
                + "<div class=\"container\">\n"
                + "<h1>GameStore</h1> "
                
                + "  <h2>Your Order</h2>\n"
                + orderDate
                +orderId
                +cusName
                + "  <p></p>                                                                                      \n"
                + "  <div class=\"table-responsive\">          \n"
                + "  <table class=\"table\">\n"
                + "    <thead>\n"
                + "      <tr>\n"
                + "        <th>STT</th>\n"
                + "        <th>Name</th>\n"
                + "        <th>QuanTity</th>\n"
                + "        <th>Price</th>\n"
                + "<th>Unit Price</th>"
                + "       "
                + "        "
                + "      </tr>\n"
                + "    </thead>\n"
                + "    <tbody>\n"
                + string
                + "    </tbody>\n"
                + "<tfoot>"
                + "		<tr>"
                + "<td colspan=\"4\">Total Price :</td>	"
                + "	<td>" + "%,dVNĐ" + "</td>"
                + "	</tr>"
                + "	</tfoot>"
                + "  </table>\n"
                + "  </div>\n"
                + "</div>\n"
                + thank + message1
                + "</body>\n"
                + "</html>",Math.round(order.getTotalPrice()*1000));
        ;

        message.setContent(htmlMsg, "text/html;charset=UTF-8");

        helper.setTo(cus.getEmail());

        helper.setSubject("Test send HTML email");

        this.emailSender.send(message);
    }

}
