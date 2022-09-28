using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BloodDonorManagement.BloodDonorManagementBLL
{
    public class BloodRepository : IBloodRepo, IDisposable
    {
        SqlConnection con;
        public BloodRepository()
        {
            this.con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
        }
        public void Delete(BloodDtO dto)
        {
            throw new NotImplementedException();
        }

        public BloodDtO Get(int id)
        {
            throw new NotImplementedException();
        }

        public ICollection<BloodDtO> GetAll()
        {
            List<BloodDtO> Blood = new List<BloodDtO>();
            DataTable dt = new DataTable();
            using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Blood", this.con))
            {
                da.Fill(dt);
                foreach (var r in dt.AsEnumerable())
                {
                    Blood.Add(new BloodDtO
                    {
                        BloodID = r.Field<int>("BloodID"),
                        BloodGroup = r.Field<string>("BloodGroup"),
                    });
                }
                return Blood;
            }
        }
        public int BloodCount()
        {
            using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Blood", this.con))
            {
                this.con.Open();
                int n = (int)cmd.ExecuteScalar();
                this.con.Close();
                return n;
            }
        }
        public void Insert(BloodDtO dto)
        {
            string sql = @"INSERT INTO [dbo].[Blood]
                           ([BloodGroup])
                            VALUES
                           (@BloodGroup)";
            using (SqlCommand cmd = new SqlCommand(sql, this.con))
            {
                cmd.Parameters.AddWithValue("@BloodGroup", dto.BloodGroup);
                this.con.Open();
                cmd.ExecuteNonQuery();
                //try
                //{
                //    cmd.ExecuteNonQuery();
                //}
                //catch (Exception ex)
                //{
                //    throw ex.InnerException;
                //}
                this.con.Close();
            }
        }
        public void Update(BloodDtO dto)
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