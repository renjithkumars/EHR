using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Net;
using System.Net.Mail;

namespace EHR
{
    public class EHRMail
    {
        public void SendMail(string ToAddress, string Subject, string mailBody)
        {
            MailMessage mail = new MailMessage("ehrglobal006@gmail.com", ToAddress, Subject, mailBody);
            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Credentials = new System.Net.NetworkCredential("ehrglobal006@gmail.com", "ehranoop006");
            smtp.Port = 587;
            smtp.EnableSsl = true;
            
            try
            {
                smtp.Send(mail);
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}