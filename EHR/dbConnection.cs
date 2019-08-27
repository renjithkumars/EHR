using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace EHR
{
    public class dbConnection
    {
        #region Declaration
        private SqlConnection con;
        private SqlTransaction trans = null;
        #endregion

        #region EstablishConnection
        private void EstablishConnection(string sServerName, string sDBName, Boolean IntegratedSecurity, string sUserID, string sPasswd)
        {
            string sConnect;
            if (IntegratedSecurity)
            {
                sConnect = "Data Source=" + sServerName + "; Initial Catalog=" + sDBName + ";Integrated Security=True";
            }
            else
            {
                sConnect = "Data Source=" + sServerName + "; Initial Catalog=" + sDBName + ";User Id =" + sUserID + "; Password = " + sPasswd;
            }

            con = new SqlConnection(sConnect);
        }
        #endregion

        public void Open()
        {
            if (con != null && con.State == ConnectionState.Closed)
                con.Open();
            else
                //Open("RNV-PC", "Quote", true, "", "");
                Open("JIJI", "EHR", false, "sa", "podanarisa");
        }

        public void Open(string ServerName, string DatabaseName, Boolean IntegratedSecurity, string User, string Password)
        {
            try
            {
                EstablishConnection(ServerName, DatabaseName, IntegratedSecurity, User, Password);
                con.Open();
            }
            catch
            {
                throw;
            }
        }

        public int ExecuteNonQuery(CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {
            int affectedRows = 0;
            try
            {
                Open();
                SqlCommand cmd = new SqlCommand(commandText, con);
                cmd.CommandType = commandType;
                cmd.Parameters.AddRange(commandParameters);
                affectedRows = cmd.ExecuteNonQuery();
            }
            catch
            {
                throw;
            }
            finally
            {
                Close();
                Dispose();
            }
            return affectedRows;
        }

        public DataSet ExecuteQuery(CommandType commandType, string commandText, params SqlParameter[] parameters)
        {
            try
            {
                Open();
                SqlCommand cmd = new SqlCommand(commandText, con);
                DataSet ds = new DataSet();
                cmd.CommandType = commandType;
                cmd.Parameters.AddRange(parameters);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                return ds;
            }
            catch
            {
                throw;
            }
            finally
            {
                Close();
                Dispose();
            }
        }
        public void Close()
        {
            con.Close();
        }

        public void Dispose()
        {
            con.Dispose();
        }
    }
}