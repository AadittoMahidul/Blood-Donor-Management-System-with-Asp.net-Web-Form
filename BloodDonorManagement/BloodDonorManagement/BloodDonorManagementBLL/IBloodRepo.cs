using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BloodDonorManagement.BloodDonorManagementBLL
{
    public interface IBloodRepo
    {
        ICollection<BloodDtO> GetAll();
        BloodDtO Get(int id);
        void Insert(BloodDtO dto);
        void Update(BloodDtO dto);
        void Delete(BloodDtO dto);
        int BloodCount();
    }
}
