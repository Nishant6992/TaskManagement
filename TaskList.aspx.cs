using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace TaskManagement
{
    public partial class TaskList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindTaskList();
            }
        }

        protected void BindTaskList()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT *FROM [dbo].[task] WHERE [isDeleted]=0", con))
                    {
                        con.Open();
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            rptTasks.DataSource = dt;
                            rptTasks.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exception
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button btnDelete = (Button)sender;
            string taskId = btnDelete.CommandArgument;



            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                con.Open();
                string updateQuery = "UPDATE task SET isDeleted = 1 WHERE TaskID = @TaskID";
                using (SqlCommand cmd = new SqlCommand(updateQuery, con))
                {
                    cmd.Parameters.AddWithValue("@TaskID", taskId);
                    cmd.ExecuteNonQuery();
                }
            }

            Response.Redirect("TaskList.aspx");
            BindTaskList();
        }

        //protected void rptTasks_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e) //this is old code
        //{
        //    if (e.CommandName == "Edit")
        //    {
        //        string taskId = e.CommandArgument.ToString();
        //        // Redirect to edit page with taskId parameter
        //        Response.Redirect($"EditTask.aspx?taskId={taskId}");
        //    }
        //    else if (e.CommandName == "Delete")
        //    {
        //        string taskId = e.CommandArgument.ToString();
        //        // Call delete function passing taskId
        //        // Implement your delete logic here
        //    }
        //}
        //protected void rptTasks_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    if (e.CommandName == "Edit")
        //    {
        //        string taskId = e.CommandArgument.ToString();
        //        // Redirect to edit page with taskId parameter
        //        Response.Redirect($"TaskList.aspx?taskId={taskId}");
        //    }
        //    else if (e.CommandName == "Delete")
        //    {
        //        string taskId = e.CommandArgument.ToString();
        //        // Update the database to set isDeleted = 1 for the specified task
        //        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
        //        {
        //            con.Open();
        //            string updateQuery = "UPDATE task SET isDeleted = 1 WHERE TaskID = @TaskID";
        //            using (SqlCommand cmd = new SqlCommand(updateQuery, con))
        //            {
        //                cmd.Parameters.AddWithValue("@TaskID", taskId);
        //                cmd.ExecuteNonQuery();
        //            }
        //        }

        //        BindTaskList();
        //    }
        //}


       
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Button btnEdit = (Button)sender;
            string taskId = btnEdit.CommandArgument;

            // Encrypt the TaskID parameter
            string encryptedTaskId = Encrypt(taskId);

            
            Response.Redirect($"EditTask.aspx?taskId={HttpUtility.UrlEncode(encryptedTaskId)}");
        }
     
        private string Encrypt(string taskId)
        {
            
            byte[] encryptedData = MachineKey.Protect(Encoding.UTF8.GetBytes(taskId));
            return Convert.ToBase64String(encryptedData);
        } 
       
    }
}
