using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloodDonorManagement.BloodDonorManagement
{
    public partial class Patients : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void ListView2_ItemDataBound(object sender, ListViewItemEventArgs e)
        //{
        //    var id = DataBinder.Eval(e.Item.DataItem, "BloodId").ToString();
        //    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
        //    {
        //        using (SqlCommand cmd = new SqlCommand($"SELECT BloodGroup FROM Blood WHERE BloodID={id}", con))
        //        {
        //            con.Open();
        //            var dr = cmd.ExecuteReader();
        //            if (dr.Read())
        //            {
        //                var l = e.Item.FindControl("BloodIdLabel") as Label;
        //                if (l != null)
        //                    l.Text = dr[0].ToString();
        //                con.Close();
        //            }
        //        }
        //    }
        //}
        protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            var id = DataBinder.Eval(e.Item.DataItem, "HospitalID").ToString();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand($"SELECT HospitalName FROM Hospitals WHERE HospitalID={id}", con))
                {
                    con.Open();
                    var dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        var l = e.Item.FindControl("HospitalIDLabel") as Label;
                        if (l != null)
                            l.Text = dr[0].ToString();
                        con.Close();
                    }
                }
            }
            var Bid = DataBinder.Eval(e.Item.DataItem, "BloodId").ToString();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand($"SELECT BloodGroup FROM Blood WHERE BloodID={Bid}", con))
                {
                    con.Open();
                    var dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        var l = e.Item.FindControl("BloodIdLabel") as Label;
                        if (l != null)
                            l.Text = dr[0].ToString();
                        con.Close();
                    }
                }
            }
        }
    }
}