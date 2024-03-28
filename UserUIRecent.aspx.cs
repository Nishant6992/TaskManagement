using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace TaskManagement
{
    public partial class UserUIRecent : System.Web.UI.Page
    {
        int EmpidGlobal;

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

        string connectionString = "Data Source=10.0.0.21;Initial Catalog=intern2022;User ID=intern2022;Password=intern2022;";

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
            // Forward task logic
            int taskID = Convert.ToInt32(e.CommandArgument);
            
            
        }
    }
}
