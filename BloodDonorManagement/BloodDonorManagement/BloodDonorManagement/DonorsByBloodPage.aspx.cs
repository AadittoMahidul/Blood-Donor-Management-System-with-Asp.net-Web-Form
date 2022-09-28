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
    public partial class DonorsByBloodPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Blood", con))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Blood");
                    da.SelectCommand.CommandText = "SELECT * FROM Donors";
                    da.Fill(ds, "Donors");
                    DonorByBloodRpt rpt = new DonorByBloodRpt();
                    rpt.SetDataSource(ds);
                    this.CrystalReportViewer1.ReportSource = rpt;
                    rpt.Refresh();
                    this.CrystalReportViewer1.RefreshReport();
                }
            }
            //DataSet dset = new DataSet();
            //using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
            //{
            //    using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Donors", con))
            //    {
            //        da.Fill(dset, "Donors");
            //        dset.Tables["Donors"].Columns.Add(new DataColumn("image", typeof(System.Byte[])));
            //        for (var i = 0; i < dset.Tables["Donors"].Rows.Count; i++)
            //        {
            //            dset.Tables["Donors"].Rows[i]["image"] = File.ReadAllBytes(Path.Combine(Path.GetFullPath(@"..\BloodDonorManagement\pictures"), dset.Tables["Donors"].Rows[i]["Picture"].ToString()));
            //        }
            //        DonorByBloodRpt rpt = new DonorByBloodRpt();
            //        rpt.SetDataSource(dset);
            //        CrystalReportViewer1.ReportSource = rpt;
            //        rpt.Refresh();
            //        this.CrystalReportViewer1.RefreshReport();
            //    }
            //}
        }
    }
    
}