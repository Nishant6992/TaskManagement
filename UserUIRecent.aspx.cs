using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using BAL;
using Entity;

namespace TaskManagement
{
    public partial class UserUIRecent : System.Web.UI.Page
    {
        int EmpidGlobal;
        static DataTable datatbl;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if ID exists in session
                if (Session["ID"] != null)
                {
                    int EmpID = Convert.ToInt32(Session["ID"]);
                    BindTasks(EmpID);
                    BindProjects(EmpID);
                    BindForwardedTasks(EmpID);
                    EmpidGlobal = EmpID;
                }
                else
                {
                    // Redirect to login page or handle the scenario where ID is not available in session
                    Response.Redirect("Login.aspx");
                }
            }
        }

        public string connectionString = "Data Source=10.0.0.21;Initial Catalog=intern2022;User ID=intern2022;Password=intern2022;";

        protected void BindTasks(int employeeID)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM task WHERE EmployeeID = @EmployeeID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@EmployeeID", employeeID);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                rptTasks.DataSource = dt;
                datatbl = dt;
                rptTasks.DataBind();
            }
        }

        protected void BindProjects(int employeeID)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM projectnish WHERE Employee_id = @EmployeeID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@EmployeeID", employeeID);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                rptProjects.DataSource = dt;
                rptProjects.DataBind();
            }
        }

        protected void BindForwardedTasks(int employeeID)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM forwardtask WHERE EmployeeID = @EmployeeID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@EmployeeID", employeeID);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                rptForwardedTasks.DataSource = dt;
                rptForwardedTasks.DataBind();
            }
        }

        protected void btnForwardTask_Command(object sender, CommandEventArgs e)
        {
            int taskID = Convert.ToInt32(e.CommandArgument);
            // Your code to handle the "Forward Task" button click
            // Populate the dropdown list
            PopulateEmployeeDropdown();
            // Show the modal
            ScriptManager.RegisterStartupScript(this, this.GetType(), "showModal", "$('#forwardTaskModal').modal('show');", true);
            // Store the task ID in a hidden field for later use
            hidTaskID.Value = taskID.ToString();
        }

        protected void PopulateEmployeeDropdown()
        {

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT ID, CONCAT(ID, ' ', Name) AS EmployeeName FROM EmployeeNish";
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                ddlEmployees.DataSource = reader;
                ddlEmployees.DataTextField = "EmployeeName";
                ddlEmployees.DataValueField = "ID";
                ddlEmployees.DataBind();
                ddlEmployees.Items.Insert(0, new ListItem("-- Select Employee --", ""));
                reader.Close();
            }
        }

        protected void btnForwardTask_Click(object sender, EventArgs e)
        {
            // Forward task logic
            int taskID = Convert.ToInt32(hidTaskID.Value);
            int selectedEmployeeID = Convert.ToInt32(ddlEmployees.SelectedValue);
            // Perform forwarding task action based on taskID and selectedEmployeeID
            // Close the modal
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "$('#forwardTaskModal').modal('hide');", true);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
        //datatbl hai, isse obj ko value deke blogic me bhj dete hai
        protected void Forward_Click(object sender, EventArgs e)
        {
            int taskempid = (int)Session["ID"];
            int empid = ddlEmployees.SelectedIndex;
            int taskid = Convert.ToInt32(hidTaskID.Value);
            businessobjects bobj = new businessobjects();
            bobj.task_empid = taskempid;
            bobj.EmpId = empid;
            bobj.taskid = taskid;
            bobj.taskname = txttaskname.Text;
            bobj.comments = txtcomment.Text;
            businesslogic blogic = new businesslogic();
            blogic.forwardTaskandUpdate(bobj);

        }
    }
}