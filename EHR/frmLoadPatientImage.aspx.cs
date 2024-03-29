﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace EHR
{
    public partial class frmLoadPatientImage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ReqId"] != null)
                LoadPatientProfile(Convert.ToInt32(Session["ReqId"]));
        }

        private void LoadPatientProfile(int Id)
        {
            SqlParameter[] parameterList = {
                new SqlParameter("@Id", Id)
            };

            dbConnection db = new dbConnection();
            DataSet ds = new DataSet();
            //Byte[] data = new Byte[0];


            ds = db.ExecuteQuery(CommandType.StoredProcedure, "usp_LoadPatientProfileById", parameterList);
            Byte[] imgbyte = (Byte[])(ds.Tables[0].Rows[0]["Image"]);
            Response.BinaryWrite(imgbyte);
        }
    }
}