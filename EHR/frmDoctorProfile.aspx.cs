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
    public partial class frmDoctorProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Converts image file into byte[]
            byte[] imgData = FileUpload.FileBytes;

            int fileLen = FileUpload.PostedFile.ContentLength;
            byte[] input = new byte[fileLen - 1];
            input = FileUpload.FileBytes;

            SqlParameter[] parameterList = {
                new SqlParameter("@Id", (object)0),
                new SqlParameter("@Account_Id", Session["AccountId"].ToString()),
                new SqlParameter("@First_Name", txtFirstName.Text.Trim()),
                new SqlParameter("@Last_Name", txtLastName.Text.Trim()),
                new SqlParameter("@Sex", ddlSex.SelectedItem.Value),
                new SqlParameter("@Hospital",txtHospitalName.Text.Trim()),
                new SqlParameter("@Phone", txtPhone.Text.Trim()),
                new SqlParameter("@Address", txtAddress.Text.Trim()),
                new SqlParameter("@City", txtCity.Text.Trim()),
                new SqlParameter("@County", txtCounty.Text.Trim()),
                new SqlParameter ("@Image", imgData)
            };

            dbConnection db = new dbConnection();
            int i = db.ExecuteNonQuery(CommandType.StoredProcedure, "usp_SaveDoctorProfile", parameterList);
            if (i == 1)
            {
                Response.Redirect("frmMyPatients.aspx");
            };
        }
    }
}