using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BloodDonorManagement.BloodDonorManagementBLL
{
    public interface IHospitalRepo
    {
        ICollection<HospitalDTO> GetAll();
        HospitalDTO Get(int id);
        void Insert(HospitalDTO dto);
        void Update(HospitalDTO dto);
        void Delete(HospitalDTO dto);
        int HospitalCount();
    }
}
