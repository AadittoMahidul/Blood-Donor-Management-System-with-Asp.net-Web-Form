using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BloodDonorManagement.BloodDonorManagementBLL
{
    public class HospitalDTO
    {
        public int HospitalID { get; set; }
        public string HospitalName { get; set; }
        public string Address { get; set; }
        public string Location { get; set; }
    }
}