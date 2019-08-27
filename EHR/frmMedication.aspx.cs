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
    public partial class frmMedication : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

            SqlParameter[] parameterList = {
                new SqlParameter("@Account_Id", Session["AccountId"].ToString()),
                new SqlParameter("@ToId", Session["ToId"].ToString()),
                new SqlParameter("@Medication", txtMedications.Text.Trim()),
                new SqlParameter("@Prescription", txtPrescription.Text.Trim())
            };

            dbConnection db = new dbConnection();
            int i = db.ExecuteNonQuery(CommandType.StoredProcedure, "usp_SaveMedication", parameterList);
            if (i == 1)
            {
                Response.Redirect("frmMyPatients.aspx");
            };
        }
           
    }
}