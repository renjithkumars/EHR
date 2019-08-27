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
    public partial class frmLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlinkRegister_Click(object sender, EventArgs e)
        {
            if (hdnRole.Value.Trim() != string.Empty)
                Response.Redirect("frmSignUp.aspx?R=" + hdnRole.Value.Trim());
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();

            DataSet ds = new DataSet();
            SqlParameter[] parameterList = {
                new SqlParameter("@Email", txtEmail.Text.Trim()),
                new SqlParameter("@Pwd",  EHRDataManager.Encrypt (txtPassword.Text.Trim(),"gftj-5dx7-lsavv1")),
                new SqlParameter("@Role", hdnRole.Value.Trim())
            };

            dbConnection db = new dbConnection();

            #region Patient Login
            // 1 Means Patient
            if (Convert.ToInt32(hdnRole.Value.Trim()) == 1)
            {
                ds = db.ExecuteQuery(CommandType.StoredProcedure, "usp_PatientLogin", parameterList);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    if (Convert.ToInt32(ds.Tables[0].Rows[0]["Account_Id"]) != 0)
                    {
                        Session["AccountId"] = ds.Tables[0].Rows[0]["Id"];
                        Session["Role"] = ds.Tables[0].Rows[0]["Role"];
                        Response.Redirect("frmMyDoctors.aspx");
                    }
                    else
                    {
                        Response.Redirect("frmPatientProfile.aspx");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid User');</script>");
                }
            }
            #endregion

            #region Doctor Login
            // 2 Means Doctor
            if (Convert.ToInt32(hdnRole.Value.Trim()) == 2)
            {
                ds = db.ExecuteQuery(CommandType.StoredProcedure, "usp_DoctorLogin", parameterList);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    if (Convert.ToInt32(ds.Tables[0].Rows[0]["Account_Id"]) != 0)
                    {
                        Session["AccountId"] = ds.Tables[0].Rows[0]["Id"];
                        Session["Role"] = ds.Tables[0].Rows[0]["Role"];
                        Response.Redirect("frmMyPatients.aspx");
                    }
                    else
                    {
                        Response.Redirect("frmDoctorProfile.aspx");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid User');</script>");
                }
            }
            #endregion

        }
    }
}