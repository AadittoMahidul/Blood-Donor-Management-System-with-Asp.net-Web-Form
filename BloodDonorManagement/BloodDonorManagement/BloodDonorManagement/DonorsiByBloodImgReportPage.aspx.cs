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
    public partial class DonorsiByBloodImgReportPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Blood", con))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Donorsi");
                    ds.Tables["Donorsi"].Columns.Add(new DataColumn("Img", typeof(System.Byte[])));
                    for (var i = 0; i < ds.Tables["Donorsi"].Rows.Count; i++)
                    //{
                    //    string f = AppDomain.CurrentDomain.BaseDirectory + @"Uploads\" + ds.Tables["Donorsi"].Rows[i]["Picture"].ToString();
                    //    ds.Tables["Donorsi"].Rows[i]["Img"] = File.ReadAllBytes(Server.MapPath("~/Uploads/" + ds.Tables["Donorsi"].Rows[i]["Picture"].ToString()));
                    //}

                    da.SelectCommand.CommandText = "SELECT * FROM Blood";
                    da.Fill(ds, "Blood");

                    DonorsiByBloodImgRpt rpt = new DonorsiByBloodImgRpt();
                    rpt.Load(Server.MapPath("~/CrystalReport1.rpt"));
                    rpt.SetDataSource(ds);
                    this.CrystalReportViewer1.ReportSource = rpt;
                    rpt.Refresh();
                    this.CrystalReportViewer1.RefreshReport();
                }
            }
            //DataSet ds = new DataSet();
            //using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
            //{
            //    using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Blood", con))
            //    {
            //        da.Fill(ds, "Donorsi");
            //        ds.Tables["Donorsi"].Columns.Add(new DataColumn("Img", typeof(System.Byte[])));
            //        for (var i = 0; i < ds.Tables["Donorsi"].Rows.Count; i++)
            //        {
            //            ds.Tables["Donorsi"].Rows[i]["Img"] = File.ReadAllBytes(Path.Combine(Path.GetFullPath(@"..\..\Uploads"), ds.Tables["Donorsi"].Rows[i]["Picture"].ToString()));
            //        }
            //        DonorsiByBloodImgRpt rpt = new DonorsiByBloodImgRpt();
            //        rpt.SetDataSource(ds);
            //        CrystalReportViewer1.ReportSource = rpt;
            //        rpt.Refresh();
            //        CrystalReportViewer1.RefreshReport();
            //    }
            //}
        }
    }
}