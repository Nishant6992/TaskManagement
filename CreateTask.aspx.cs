using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using DAL;
using BAL;
using Entity;
using System.IO;
using System.Globalization;

namespace TaskManagement
{
    public partial class CreateTask : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateEmployeeDropDown();
            }
        }

        private void PopulateEmployeeDropDown()
        {


            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query2 = "SELECT ID FROM EmployeeNish";
                using (SqlCommand cmd = new SqlCommand(query2, con))
                {
                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ListItem item = new ListItem();
                            item.Text = reader["ID"].ToString();

                            ddlEmployeesid.Items.Add(item);
                        }
                    }
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (fileUpload.HasFile)
            {
                string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
                string virtualFolderPath = "~/Uploaded/";
                string virtualFilePath = Path.Combine(virtualFolderPath, fileName);

                string physicalFilePath = Server.MapPath(virtualFilePath);
                fileUpload.SaveAs(physicalFilePath);

                businessobjects objTask = new businessobjects();
                objTask.EmpId = Convert.ToInt32(ddlEmployeesid.SelectedValue);
                objTask.Date = txtStartDate.Text;
                objTask.deadlineDate = txtDeadlineDate.Text;
                objTask.TaskPriority = ddlPriority.SelectedValue;
                objTask.taskDescription = txtTaskDescription.Text;
                objTask.projectid = Convert.ToInt32(txtprojectid.Text);
                objTask.projectname = txtprojectname.Text;
                //objTask.filepath = virtualFilePath;
                objTask.filepath = physicalFilePath;

                businesslogic b1 = new businesslogic();
                b1.informUser(objTask);
                b1.insert(objTask);
            }
        }

    }
}
