using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BloodDonorManagement.BloodDonorManagementBLL
{
    public class HospitalRepo : IHospitalRepo, IDisposable
    {
        SqlConnection con;
        public HospitalRepo()
        {
            this.con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
        }
        public void Delete(HospitalDTO dto)
        {
            throw new NotImplementedException();
        }
       
        public HospitalDTO Get(int id)
        {
            throw new NotImplementedException();
        }
        public ICollection<HospitalDTO> GetAll()
        {
            List<HospitalDTO> Hospitals = new List<HospitalDTO>();
            DataTable dt = new DataTable();
            using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Hospitals", this.con))
            {
                da.Fill(dt);
                foreach (var r in dt.AsEnumerable())
                {
                    Hospitals.Add(new HospitalDTO
                    {
                        HospitalID = r.Field<int>("HospitalID"),
                        HospitalName = r.Field<string>("HospitalName"),
                        Address = r.Field<string>("Address"),
                        Location = r.Field<string>("Location")
                    });
                }
                return Hospitals;
            }
        }

        public int HospitalCount()
        {
            using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Hospitals", this.con))
            {
                this.con.Open();
                int n = (int)cmd.ExecuteScalar();
                this.con.Close();
                return n;
            }
        }

        public void Insert(HospitalDTO dto)
        {
            string sql = @"INSERT INTO [Hospitals]
                           ([HospitalName]
                           ,[Address]
                           ,[Location])
                            VALUES
                           (@HospitalName
                           ,@Address
                           ,@Location)";
            using (SqlCommand cmd = new SqlCommand(sql, this.con))
            {
                cmd.Parameters.AddWithValue("@HospitalName", dto.HospitalName);
                cmd.Parameters.AddWithValue("@Address", dto.Address);
                cmd.Parameters.AddWithValue("@Location", dto.Location);
                this.con.Open();
                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw ex.InnerException;
                }
                this.con.Close();
            }
        }

        public void Update(HospitalDTO dto)
        {
            throw new NotImplementedException();
        }
        public void Dispose()
        {
            if (con.State == System.Data.ConnectionState.Open)
            {
                con.Close();
            }
        }
    }
}