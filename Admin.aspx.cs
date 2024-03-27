using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using DAL;
using BAL;
using Entity;
using System.Web.UI.WebControls;
using System.Collections.Generic;
 namespace TaskManagement
{
    public partial class UserUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateProjectDropDown();
                PopulateEmpDropDown();
                string userName = "Admin";
                lblUserName.Text = userName;
                //FetchUserTasks();
                //FetchProjects(); // Call to fetch projects when page loads
            }
        }
        [System.Web.Services.WebMethod]
        public static List<string> GetEmployeesByProject(string projectName)
        {
            List<string> employeeNames = new List<string>();
             string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("FetchEmp", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@projectname", projectName);
                     if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                     using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        employeeNames.Add("--Select Employee--");
                        while (reader.Read())
                        {
                            employeeNames.Add(reader["FullName"].ToString());
                        }
                    }
                }
            }
             return employeeNames;
        }
        private void PopulateEmpDropDown()
        {
             string projectName = ddlProject.SelectedValue;
            List<string> empName = businesslogic.AddEmp(projectName);
             ddlEmployee.DataSource = empName;
            ddlEmployee.DataBind();
        }
         private void PopulateProjectDropDown()
        {
            List<string> projects = businesslogic.Add();
             ddlProject.DataSource = projects;
            ddlProject.DataBind();
        }
         protected string GetPriorityColor(object priority)
        {
            string color = "";
            if (priority != null)
            {
                string priorityValue = priority.ToString().ToLower();
                switch (priorityValue)
                {
                    case "low":
                        color = "green";
                        break;
                    case "medium":
                        color = "orange";
                        break;
                    case "high":
                        color = "red";
                        break;
                    default:
                        color = "black"; // Or any default color you prefer
                        break;
                }
            }
            return color;
        }
         private void FetchUserTasks()
        {
            try
            {
                int employeeID = Convert.ToInt32(txtEmployeeID.Text);
                 using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM Task WHERE EmployeeID = @EmployeeID", con))
                    {
                        cmd.Parameters.AddWithValue("@EmployeeID", employeeID);
                         con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                         DataTable tasksTable = new DataTable();
                        tasksTable.Columns.Add("TaskID", typeof(int));
                        tasksTable.Columns.Add("Start_Date", typeof(DateTime));
                        tasksTable.Columns.Add("Deadline_Date", typeof(DateTime));
                        tasksTable.Columns.Add("Task_priority", typeof(string));
                        tasksTable.Columns.Add("Task_Descp", typeof(string));
                        tasksTable.Columns.Add("Project_id", typeof(int));
                        tasksTable.Columns.Add("ProjectName", typeof(string));
                        tasksTable.Columns.Add("FilePath", typeof(string));
                         while (reader.Read())
                        {
                            DataRow taskRow = tasksTable.NewRow();
                            taskRow["TaskID"] = Convert.ToInt32(reader["TaskID"]);
                            taskRow["Start_Date"] = Convert.ToDateTime(reader["Start_Date"]);
                            taskRow["Deadline_Date"] = Convert.ToDateTime(reader["Deadline_Date"]);
                            taskRow["Task_priority"] = reader["Task_priority"].ToString();
                            taskRow["Task_Descp"] = reader["Task_Descp"].ToString();
                            taskRow["Project_id"] = Convert.ToInt32(reader["Project_id"]);
                            taskRow["ProjectName"] = reader["projectName"].ToString(); // Adjust column name accordingly
                            taskRow["FilePath"] = reader["FilePath"].ToString();
                             tasksTable.Rows.Add(taskRow);
                        }
                        rptIndividualTasks.DataSource = tasksTable;
                        rptIndividualTasks.DataBind();
                        if (tasksTable.Rows.Count == 0)
                        {
                            rptIndividualTasks.DataSource = null;
                            rptIndividualTasks.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exception
            }
        }
         private void FetchProjects()
        {
            try
            {
                 int employeeID = Convert.ToInt32(txtEmployeeID.Text);
                 using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM projectnish WHERE Employee_id = @EmployeeID", con))
                    {
                        cmd.Parameters.AddWithValue("@EmployeeID", employeeID);
                         con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                         DataTable projectsTable = new DataTable();
                        projectsTable.Columns.Add("Project_id", typeof(int));
                        projectsTable.Columns.Add("projectname", typeof(string));
                        projectsTable.Columns.Add("project_startDate", typeof(string));
                        projectsTable.Columns.Add("project_endDate", typeof(string));
                        projectsTable.Columns.Add("project_Description", typeof(string));
                         while (reader.Read())
                        {
                            DataRow projectRow = projectsTable.NewRow();
                            projectRow["Project_id"] = Convert.ToInt32(reader["Project_id"]);
                            projectRow["projectname"] = reader["projectname"].ToString();
                            projectRow["project_startDate"] = (reader["project_startDate"]);
                            projectRow["project_endDate"] = (reader["project_endDate"]);
                            projectRow["project_Description"] = reader["project_Description"].ToString();
                             projectsTable.Rows.Add(projectRow);
                        }
                         rptProjects.DataSource = projectsTable;
                        rptProjects.DataBind();
                         if (projectsTable.Rows.Count == 0)
                        {
                            rptProjects.DataSource = null;
                            rptProjects.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exception
            }
        }
         protected void btnFetchTasks_Click(object sender, EventArgs e)
        {
            FetchUserTasks();
            FetchProjects();
        }
         protected void btnAttachment_Click(object sender, EventArgs e)
        {
         }
         protected void ddlProject_SelectedIndexChanged(object sender, EventArgs e)
        {
             string projectName = ddlProject.SelectedValue;
            List<string> empName = businesslogic.AddEmp(projectName);
             ddlEmployee.DataSource = empName;
            ddlEmployee.DataBind();
         }
         protected void ddlEmployee_SelectedIndexChanged(object sender, EventArgs e)
        {
         }
         protected void btnForwardTask_Click(object sender, EventArgs e)
        {
            businessobjects bobj = new businessobjects();
            bobj.projectname = ddlProject.SelectedValue;
            bobj.taskname = txtTaskName.Text;
            bobj.TaskPriority = ddlTaskPriority.SelectedValue;
            bobj.Date = txtTaskStartDate.Text;
            bobj.deadlineDate = txtTaskEndDate.Text;
            bobj.taskDescription = txtTaskDescription.Text;
            bobj.EmpId = Convert.ToInt32(ddlEmployee.SelectedValue);
            bobj.comments = txtComments.Text;
            businesslogic blogic = new businesslogic();
            blogic.forwardTask(bobj);
         }
    }
}
