using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;
using Entity;
using DAL;
using BAL;
 namespace TaskManagement
{
    public partial class EditTask : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                 if (Request.QueryString["taskId"] != null)
                {
                     string encryptedTaskId = Request.QueryString["taskId"];
                    string taskId = Decrypt(encryptedTaskId);
                     DataTable dt = GetTaskDetails(taskId);
                     if (dt.Rows.Count > 0)
                    {
                        txtEmployeeID.Text = dt.Rows[0]["EmployeeID"].ToString();
                        txtProjectID.Text = dt.Rows[0]["Project_id"].ToString();
                        txtTaskID.Text = dt.Rows[0]["TaskID"].ToString();
                        txtProjectName.Text = dt.Rows[0]["projectname"].ToString();
                        txtStartDate.Text = dt.Rows[0]["Start_Date"].ToString();
                        txtDeadlineDate.Text = dt.Rows[0]["Deadline_Date"].ToString();
                        ddlPriority.SelectedValue = dt.Rows[0]["Task_priority"].ToString();
                        txtTaskDescription.Text = dt.Rows[0]["Task_Descp"].ToString();
                    }
                }
            }
        }
         private DataTable GetTaskDetails(string taskId)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                string query = "SELECT * FROM Task WHERE TaskID = @TaskID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@TaskID", taskId);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
            }
            return dt;
        }
         private string Decrypt(string encryptedText)
        {
            byte[] decryptedData = MachineKey.Unprotect(Convert.FromBase64String(encryptedText));
            return Encoding.UTF8.GetString(decryptedData);
        }
         protected void btnUpdate_Click(object sender, EventArgs e)
        {
            businessobjects b1 = new businessobjects();
            b1.EmpId = Convert.ToInt32(txtEmployeeID.Text);
            b1.projectname = txtProjectName.Text;
            b1.taskid = Convert.ToInt32(txtTaskID.Text);
            b1.Date = txtStartDate.Text;
            b1.deadlineDate = txtDeadlineDate.Text;
            b1.TaskPriority = ddlPriority.SelectedValue;
            b1.taskDescription = txtTaskDescription.Text;
            businesslogic blogic = new businesslogic();
            blogic.insert(b1);
         }
         protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("TaskList.aspx");
        }
    }
}
