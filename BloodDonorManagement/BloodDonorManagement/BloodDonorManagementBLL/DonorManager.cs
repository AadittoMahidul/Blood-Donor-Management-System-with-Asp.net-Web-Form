using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BloodDonorManagement.BloodDonorManagementBLL
{
    public class DonorManager
    {
        SqlConnection con;
        public DonorManager()
        {
            this.con = new SqlConnection(ConfigurationManager.ConnectionStrings["db"].ConnectionString);
        }
        public ICollection<DonorDTO> GetAll()
        {
            List<DonorDTO> Donors = new List<DonorDTO>();
            DataTable dt = new DataTable();
            using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Donors", this.con))
            {
                da.Fill(dt);
                foreach (var r in dt.AsEnumerable())
                {
                    Donors.Add(new DonorDTO
                    {
                        DonorID = r.Field<int>("DonorID"),
                        DonorName = r.Field<string>("DonorName"),
                        Weight = r.Field<string>("Weight"),
                        DonorPhone = r.Field<string>("DonorPhone"),
                        DonorEmail = r.Field<string>("DonorEmail"),
                        DonorAddress = r.Field<string>("DonorAddress"),
                        LastDonation = r.Field<DateTime>("LastDonation"),
                        Picture = r.Field<string>("Picture"),
                        Available = r.Field<bool>("Available"),
                        BloodID = r.Field<int>("BloodID")
                    });
                }
                return Donors;
            }
        }
        public void Insert(DonorDTO dto)
        {
            string sql = @"INSERT INTO [dbo].[Donors]
                           ([DonorName]
                           ,[Weight]
                           ,[DonorPhone]
                           ,[DonorEmail]
                           ,[DonorAddress]
                           ,[LastDonation]
                           ,[Picture]
                           ,[Available]
                           ,[BloodID])
                     VALUES
                           (@DonorName
                           ,@Weight
                           ,@DonorPhone
                           ,@DonorEmail
                           ,@DonorAddress
                           ,@LastDonation
                           ,@Picture
                           ,@Available
                           ,@BloodID)";
            using (SqlCommand cmd = new SqlCommand(sql, this.con))
            {
                cmd.Parameters.AddWithValue("@DonorName", dto.DonorName);
                cmd.Parameters.AddWithValue("@Weight", dto.Weight);
                cmd.Parameters.AddWithValue("@DonorPhone", dto.DonorPhone);
                cmd.Parameters.AddWithValue("@DonorEmail", dto.DonorEmail);
                cmd.Parameters.AddWithValue("@DonorAddress", dto.DonorAddress);
                cmd.Parameters.AddWithValue("@LastDonation", dto.LastDonation);
                cmd.Parameters.AddWithValue("@Picture", dto.Picture);
                cmd.Parameters.AddWithValue("@Available", dto.Available);
                cmd.Parameters.AddWithValue("@BloodID", dto.BloodID);
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
        public void Update(DonorDTO dto) 
        { 

        }
        public void Delete(DonorDTO dto) 
        { 

        }
        public DataTable BloodDropItems()
        {
            using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Blood", this.con))
            {
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }
    }
}