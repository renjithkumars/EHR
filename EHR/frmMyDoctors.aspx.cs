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
    public partial class frmMyDoctors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                CountNewRequest();
        }

        private void CountNewRequest()
        {
            SqlParameter[] parameterList = {
                new SqlParameter("@Account_Id", Session["AccountId"].ToString()),
                new SqlParameter("@Status",Status.Request.New)
            };

            dbConnection db = new dbConnection();
            DataSet ds = new DataSet();
            ds = db.ExecuteQuery(CommandType.StoredProcedure, "usp_CountAllRequest", parameterList);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Int32 i = Convert.ToInt32(ds.Tables[0].Rows[0]["TotalNewRequests"]);
                if (i > 0)
                    hyplnkCount.Text = "You have  " + ds.Tables[0].Rows[0]["TotalNewRequests"] + "  New Request";
                else
                    hyplnkCount.Visible = false;
            }
        }
    }
}