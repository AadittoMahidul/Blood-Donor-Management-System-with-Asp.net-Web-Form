using BloodDonorManagement.Reports;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloodDonorManagement.BloodDonorManagement
{
    public partial class DonorsReportPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {           
                DataSet ds = new DataSet();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Donors", con))
                {
                    da.Fill(ds, "Donors");
                    ds.Tables["Donors"].Columns.Add(new DataColumn("image", typeof(System.Byte[])));
                    //for (var i = 0; i < ds.Tables["Donors"].Rows.Count; i++)
                    //{
                    //    ds.Tables["Donors"].Rows[i]["image"] = File.ReadAllBytes(Path.Combine(Path.GetFullPath(@"..\..\Pictures"), ds.Tables["Teachersi"].Rows[i]["picture"].ToString()));
                    //}
                    DonorsRpt rpt = new DonorsRpt();
                    rpt.SetDataSource(ds);
                    CrystalReportViewer1.ReportSource = rpt;
                    rpt.Refresh();
                    CrystalReportViewer1.RefreshReport();
                }
            }      
        }          
    }
}