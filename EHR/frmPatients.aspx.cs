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
    public partial class frmPatients : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadPatients();
        }

        private void LoadPatients()
        {
            dbConnection db = new dbConnection();
            DataSet ds = new DataSet();
            ds = db.ExecuteQuery(CommandType.StoredProcedure, "usp_LoadAllPatients");
            grvPatients.DataSource = ds;
            grvPatients.DataBind();
        }

        protected void btnSendRequest_Click(object sender, EventArgs e)
        {
            try
            {
                SqlParameter[] parameterList = {
                new SqlParameter("@Account_Id", Session["AccountId"].ToString()),
                new SqlParameter("@Status", Status.Request.New),
                new SqlParameter("@RequestTable", CreateRequestIdTable()),
            };

                dbConnection db = new dbConnection();
                int i = db.ExecuteNonQuery(CommandType.StoredProcedure, "usp_SaveRequest", parameterList);
                if (i == 1)
                {
                    Response.Redirect("frmMyPatients.aspx");
                };
            }
            catch(SqlException ex)
            {
                Response.Write("<script>alert('Already sent the Request');</script>");
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        private DataTable CreateRequestIdTable()
        {

            // Getting checked grid view Row 
            DataTable dataTable = new DataTable("CheckedIdTable");
            //Create column names as per the type in DB
            dataTable.Columns.Add("Id", typeof(Int32));
            
           
            foreach (GridViewRow row in grvPatients.Rows) //Running all lines of grid
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkRow") as CheckBox);

                    if (chkRow.Checked)
                    {
                        dataTable.Rows.Add(Convert.ToInt32(row.Cells[2].Text.Trim()));
                    }
                }
            }

            return dataTable;
        }
    }
}