using BloodDonorManagement.BloodDonorManagementBLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloodDonorManagement.BloodDonorManagement
{
    public partial class ObjdsDonors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            //if (e.Item.ItemType == ListViewItemType.DataItem)
            //{
            //    int id = (int)DataBinder.Eval(e.Item.DataItem, "BloodID");
            //    Label l = e.Item.FindControl("bloodIdLabel") as Label;
            //    if (l != null) l.Text = new DonorManager().GetHashCode(id);
            //}
        }
    }
}