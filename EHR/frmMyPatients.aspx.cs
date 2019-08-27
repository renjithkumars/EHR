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
    public partial class frmMyPatients : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadAccepetedPatients();
        }

        private void LoadAccepetedPatients()
        {
            SqlParameter[] parameterList = {
                new SqlParameter("@Account_Id", Session["AccountId"].ToString())
            };

            dbConnection db = new dbConnection();
            DataSet ds = new DataSet();
            ds = db.ExecuteQuery(CommandType.StoredProcedure, "usp_LoadAcceptedRequests", parameterList);
            grvRequests.DataSource = ds;
            grvRequests.DataBind();
        }

        protected void grvRequests_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    if (e.Row.Cells[5].Text == "False")
                        e.Row.Attributes.Add("ondblclick", "ShowPopup('" + e.Row.Cells[1].Text + "')");
                    else
                        e.Row.Attributes.Add("ondblclick", String.Format("window.location='frmView.aspx?ReqId={0}'", Server.UrlEncode(EHRDataManager.Encrypt(e.Row.Cells[1].Text, "gftj-5dx7-lsavv1"))));


                    e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#e0ffff ';this.style.cursor = 'pointer'");
                    e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#FFFFFF';");
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {


            SqlParameter[] parameterList = {
                new SqlParameter("@Id", txtHidden.Value.Trim()),
                new SqlParameter("@OTP", txtOTP.Text.Trim())
            };

           // string sstr = Server.UrlEncode(EHRDataManager.Encrypt(txtHidden.Value.Trim(), "gftj-5dx7-lsavv1"));
            dbConnection db = new dbConnection();
            int i = db.ExecuteNonQuery(CommandType.StoredProcedure, "usp_verifyOTP", parameterList);
            if (i == 1)
            {

                Response.Redirect("frmView.aspx?ReqId='" + Server.UrlEncode(EHRDataManager.Encrypt(txtHidden.Value.Trim(), "gftj-5dx7-lsavv1")) + "'");
            };
        }
    }
}