using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BloodDonorManagement.BloodDonorManagementBLL
{
    public class DonorDTO
    {
        public int DonorID { get; set; }
        public string DonorName { get; set; }
        public string Weight { get; set; }
        public string DonorPhone { get; set; }
        public string DonorEmail { get; set; }
        public string DonorAddress { get; set; }       
        public DateTime LastDonation { get; set; }
        public string Picture { get; set; }
        public bool Available { get; set; }
        public int BloodID { get; set; }
    }
}