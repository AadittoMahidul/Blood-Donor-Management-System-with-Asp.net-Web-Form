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
    public partial class PatientDonors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.TableSection = TableRowSection.TableHeader;

            }
        }

        protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
        {

        }

        protected void GridView1_RowDataBound2(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.TableSection = TableRowSection.TableHeader;

            }
        }

        protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
        {
            if(GridView1.SelectedValue == null)
            {
                e.Cancel = true;
                return;
            }
            e.Values["PatientID"] = (int)GridView1.SelectedValue;
        }

        protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if(e.Item.ItemType == ListViewItemType.DataItem)
            {
                int did = (int)DataBinder.Eval(e.Item.DataItem, "DonorID");
                Label l = e.Item.FindControl("DonorIDLabel") as Label;
                if(l != null)
                {
                    l.Text = GetDonorName(did);
                }
                int pid = (int)DataBinder.Eval(e.Item.DataItem, "PatientID");
                Label l1 = e.Item.FindControl("PatientIDLabel") as Label;
                if (l1 != null)
                {
                    l1.Text = GetPatientName(pid);
                }
                
            }
        }
        private string GetDonorName(int id)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand($"SELECT DonorName FROM Donors WHERE DonorID={id}", con))
                {
                    con.Open();
                    string s = (string)cmd.ExecuteScalar();
                   
                        con.Close();
                    return s;
                 
                }
            }
        }
        private string GetPatientName(int id)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand($"SELECT PatientName FROM Patients WHERE PatientID={id}", con))
                {
                    con.Open();
                    string s = (string)cmd.ExecuteScalar();

                    con.Close();
                    return s;

                }
            }
        }
    }
}