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
    public partial class frmView : System.Web.UI.Page
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
                        LoadPatientProfile(Convert.ToInt32(Session["ReqId"]));
                        LoadMedication(Convert.ToInt32(Session["AccountId"]), Convert.ToInt32(Session["ToId"]));


                    }
                }
                catch (Exception ex)
                { }
            }
        }

        private void LoadPatientProfile(int Id)
        {
            SqlParameter[] parameterList = {
                new SqlParameter("@Id", Id)
            };

            dbConnection db = new dbConnection();
            DataSet ds = new DataSet();

            ds = db.ExecuteQuery(CommandType.StoredProcedure, "usp_LoadPatientProfileById", parameterList);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["ToId"]= ds.Tables["Table"].Rows[0]["Account_Id"].ToString();
                lblFirstName.Text = ds.Tables["Table"].Rows[0]["First_Name"].ToString();
                lblLastName.Text = ds.Tables["Table"].Rows[0]["Last_Name"].ToString();
                lblPhone.Text = ds.Tables["Table"].Rows[0]["Phone"].ToString();
                lblDOB.Text = ds.Tables["Table"].Rows[0]["DOB"].ToString();
                txtEmail.Value = ds.Tables["Table"].Rows[0]["Email"].ToString();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmMedication.aspx");
        }

        private void LoadMedication(int FromId, int ToId)
        {
            SqlParameter[] parameterList = {
                new SqlParameter("@Account_Id", FromId),
                new SqlParameter("@ToId", ToId)
            };

            dbConnection db = new dbConnection();
            DataSet ds = new DataSet();

            ds = db.ExecuteQuery(CommandType.StoredProcedure, "usp_LoadMedication", parameterList);
            if (ds.Tables[0].Rows.Count > 0)
            {
                grvMedication.DataSource = ds;
                grvMedication.DataBind();
            }
        }
    }
}