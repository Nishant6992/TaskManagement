using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entity;
using BAL;
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
        protected void btnEdit_Click(object sender, EventArgs e)
        {
             Button btnEdit = (Button)sender;
            string taskId = btnEdit.CommandArgument;
            // Encrypt the TaskID parameter
            string encryptedTaskId = Encrypt(taskId);
            Response.Redirect($"EditTask.aspx?taskId={HttpUtility.UrlEncode(encryptedTaskId)}");
        }
        protected void btnComment_Click(object sender, EventArgs e)
        {
            txtcomment.Text = null;
            Button btnComment = (Button)sender;
            string commandArgument = btnComment.CommandArgument;
             string[] arg = commandArgument.Split(';');
             txttaskid.Text = arg[0];
            txtempid.Text = arg[1];
            txtstartdate.Text = arg[2];
            txtdeadlinedate.Text = arg[3];
            txtprior.Text = arg[4];
            txtdecsp.Text = arg[5];
            txtprojectid.Text = arg[6];
            txtprojname.Text = arg[7];
            string script = "<script src=\"https://code.jquery.com/jquery-3.5.1.min.js \"></script>";
            script += "<script type='text/javascript'>$(document).ready(function() {$('#commentTaskModel').modal('show'); });</script>";
            // Register the startup script with ScriptManager
            ScriptManager.RegisterStartupScript(this, typeof(TaskManagement.TaskList), "ShowModal", script, false);
         }
         private string Encrypt(string taskId)
        {
            byte[] encryptedData = MachineKey.Protect(Encoding.UTF8.GetBytes(taskId));
            return Convert.ToBase64String(encryptedData);
        }
         protected void comment_Click(object sender, EventArgs e)
        {
            businessobjects bobj = new businessobjects();
            bobj.comments = txtcomment.Text;
            bobj.EmpId = Convert.ToInt32(txtempid.Text);
            businesslogic blog = new businesslogic(bobj);
        }
    }
}
