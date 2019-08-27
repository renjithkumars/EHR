using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace EHR
{
    public partial class frmSignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Request.QueryString["R"]) == 1)
            {
                divSignUp.Attributes.Add("class", "orangebox");
                btnSignUp.CssClass = "EHROrangeButtons";
                Session["Role"] = 1;
            }

            if (Convert.ToInt32(Request.QueryString["R"]) == 2)
            {
                divSignUp.Attributes.Add("class", "greenbox");
                btnSignUp.CssClass = "EHRGreenButtons";
                Session["Role"] = 2;
            }

            if (Convert.ToInt32(Request.QueryString["R"]) == 3)
            {
                divSignUp.Attributes.Add("class", "bluebox");
                btnSignUp.CssClass = "EHRBlueButtons";
                Session["Role"] = 3;
            }
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection("Data Source=JIJI;Initial Catalog=EHR;User Id=sa;Password=podanarisa");
                SqlCommand cmd = new SqlCommand("usp_CreateAccount", con);
                con.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Pwd", EHRDataManager.Encrypt(txtPwd.Text.Trim(), "gftj-5dx7-lsavv1"));
                cmd.Parameters.AddWithValue("@Role", Session["Role"].ToString());
                cmd.Parameters.Add("@Account_Id", SqlDbType.BigInt);
                cmd.Parameters["@Account_Id"].Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                int AccountId = Convert.ToInt32(cmd.Parameters["@Account_Id"].Value);
                Session["AccountId"] = AccountId;
                if (AccountId > 1)
                {
                    int Role = Convert.ToInt32(Session["Role"]);
                    if (Role == 1)
                        Response.Redirect("frmPatientProfile.aspx");
                    if (Role == 2)
                        Response.Redirect("frmDoctorProfile.aspx");
                    if (Role == 3)
                        Response.Redirect("frmInsuranceProfile.aspx");
                };
                con.Close();
            }
            catch
            {
                Response.Write("<script>alert('Username not available. Please try with another');</script>");
            }
        }
    }
}