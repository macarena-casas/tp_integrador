using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using System.Net;



namespace Negocio
{

    public class Email
    {
        private MailMessage email;
        private SmtpClient server;

        public Email()
        {
            server = new SmtpClient();
            server.Credentials = new NetworkCredential("taruka747@gmail.com", "mm15975356482");
            server.EnableSsl = true;
            server.Port = 587;
            server.Host = "smtp.gmail.com";

        }
        public void ArmarCorreo(string maildestino, string asunto, string cuerpo)
        {
            email = new MailMessage();
            email.From = new MailAddress("algo");
            email.To.Add(maildestino);
            email.Subject = asunto;
            email.IsBodyHtml = true;
            email.Body = cuerpo;

        }
        public void enviaremail()
        {
            try
            {
                server.Send(email);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        
    }
}
