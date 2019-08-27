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
    public partial class frmRequests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadRequests();
        }

        private void LoadRequests()
        {
            SqlParameter[] parameterList = {
                new SqlParameter("@Account_Id", Session["AccountId"].ToString())
            };

            dbConnection db = new dbConnection();
            DataSet ds = new DataSet();
            ds = db.ExecuteQuery(CommandType.StoredProcedure, "usp_LoadRequests", parameterList);
            grvRequests.DataSource = ds;
            grvRequests.DataBind();
        }

        protected void grvRequests_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {

                    e.Row.Attributes.Add("ondblclick", String.Format("window.location='frmViewRequest.aspx?ReqId={0}'", Server.UrlEncode(EHRDataManager.Encrypt(e.Row.Cells[1].Text, "gftj-5dx7-lsavv1"))));
                    e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#e0ffff ';this.style.cursor = 'pointer'");
                    e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='#FFFFFF';");
                }
            }
            catch(Exception ex)
            {

            }
        }
    }
}