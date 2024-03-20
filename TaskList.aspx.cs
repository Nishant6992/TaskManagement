using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

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
                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM task", con))
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

        protected void rptTasks_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                string taskId = e.CommandArgument.ToString();
                // Redirect to edit page with taskId parameter
                Response.Redirect($"EditTask.aspx?taskId={taskId}");
            }
            else if (e.CommandName == "Delete")
            {
                string taskId = e.CommandArgument.ToString();
                // Call delete function passing taskId
                // Implement your delete logic here
            }
        }
    }
}
