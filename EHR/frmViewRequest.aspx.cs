using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace EHR
{
    public partial class frmViewRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    if (Request.QueryString["ReqId"] != null)
                    {
                        Session.Remove("ReqId");
                        Session["ReqId"] = EHRDataManager.Decrypt(Request.QueryString["ReqId"], "gftj-5dx7-lsavv1");
                        LoadDoctorProfile(Convert.ToInt32(Session["ReqId"]));

                        // Change Request Status  from 'New' to 'Read'
                        UpdateRequestStatus(Convert.ToInt32(Session["ReqId"]), Convert.ToInt32(Status.Request.Read));
                    }
                }
                catch(Exception ex)
                { }
            }
        }

        private void LoadDoctorProfile(int Id)
        {
            SqlParameter[] parameterList = {
                new SqlParameter("@Id", Id)
            };

            dbConnection db = new dbConnection();
            DataSet ds = new DataSet();

            ds = db.ExecuteQuery(CommandType.StoredProcedure, "usp_LoadDoctorProfileById", parameterList);
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblFirstName.Text = ds.Tables["Table"].Rows[0]["First_Name"].ToString();
                lblLastName.Text = ds.Tables["Table"].Rows[0]["Last_Name"].ToString();
                lblHospital.Text = ds.Tables["Table"].Rows[0]["Hospital_Name"].ToString();
                lblPhone.Text = ds.Tables["Table"].Rows[0]["Phone"].ToString();
                txtEmail.Value = ds.Tables["Table"].Rows[0]["Email"].ToString();
            }
        }

        private void UpdateRequestStatus(int Id, int Status)
        {
            SqlParameter[] parameterList = {
                new SqlParameter("@Id", Id),
                new SqlParameter("@Status", Status)
            };

            dbConnection db = new dbConnection();
            int i = db.ExecuteNonQuery(CommandType.StoredProcedure, "usp_UpdateRequest", parameterList);
        }

        private void PatientProfileById(int Id, string OTP)
        {
            string FirstName = string.Empty;
            string LastName = string.Empty;
            string Email = string.Empty;
            string MailBody = string.Empty;

            SqlParameter[] parameterList = {
                new SqlParameter("@Id", Id)
            };

            dbConnection db = new dbConnection();
            DataSet ds = new DataSet();

            ds = db.ExecuteQuery(CommandType.StoredProcedure, "usp_LoadPatientProfileById", parameterList);
            if (ds.Tables[0].Rows.Count > 0)
            {
                FirstName = ds.Tables["Table"].Rows[0]["First_Name"].ToString();
                LastName = ds.Tables["Table"].Rows[0]["Last_Name"].ToString();
            }

            MailBody = FirstName + " " + LastName + "'s OTP is " + OTP;
            SendMail(txtEmail.Value.Trim(), FirstName, LastName, "EHR OTP", MailBody);
        }

        private void SendMail(string ToEmail, string FirstName, string LastName, string Subject, string MailBody)
        {
            EHRMail ehrMail = new EHRMail();
            ehrMail.SendMail(ToEmail, Subject, MailBody);
        }

        protected void btnAcceptRequest_Click(object sender, EventArgs e)
        {
            EHROTP OTP = new EHROTP();
            string strOTP = string.Empty;

            strOTP = OTP.GenerateOTP(true, 4);

            SqlParameter[] parameterList = {
                new SqlParameter("@Id", Convert.ToInt32(Session["ReqId"])),
                new SqlParameter("@OTP", strOTP)
            };

            dbConnection db = new dbConnection();
            int i = db.ExecuteNonQuery(CommandType.StoredProcedure, "usp_SaveOTP", parameterList);

            PatientProfileById(Convert.ToInt32(Session["ReqId"]), strOTP);

            UpdateRequestStatus(Convert.ToInt32(Session["ReqId"]), Convert.ToInt32(Status.Request.Accepted));
        }
    }
}