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
    public partial class EditProject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                 if (Request.QueryString["Project_id"] != null)
                {
                     string encryptedTaskId = Request.QueryString["Project_id"];
                    string Project_id = Decrypt(encryptedTaskId);
                     DataTable dt = GetTaskDetails(Project_id);
                     if (dt.Rows.Count > 0)
                    {
                        txtEmployeeID.Text = dt.Rows[0]["Employee_id"].ToString();
                        //txtProjectID.Text = dt.Rows[0]["Project_id"].ToString();
                         txtProjectName.Text = dt.Rows[0]["projectname"].ToString();
                        txtStartDate.Text = dt.Rows[0]["project_startDate"].ToString();
                        txtEndDate.Text = dt.Rows[0]["project_endDate"].ToString();
                         txtDescription.Text = dt.Rows[0]["project_Description"].ToString();
                    }
                }
            }
        }
         private DataTable GetTaskDetails(string Project_id)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
            {
                string query = "SELECT * FROM projectnish WHERE Project_id = @Project_id";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Project_id", Project_id);
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
            b1.Date = txtStartDate.Text;
            b1.deadlineDate = txtEndDate.Text;
            b1.projectdescription = txtDescription.Text;
            businesslogic blogic = new businesslogic();
            blogic.addProject(b1);
        }
         protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProjectList.aspx");
         }
    }
}
