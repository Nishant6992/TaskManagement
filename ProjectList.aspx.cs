﻿using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;
 namespace TaskManagement
{
    public partial class ProjectList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProjectList();
            }
        }
         protected void BindProjectList()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM projectnish", con))
                    {
                        con.Open();
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                         if (dt.Rows.Count > 0)
                        {
                            rptProjects.DataSource = dt;
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
         //protected void rptProjects_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
        //{
        //    if (e.CommandName == "Edit")
        //    {
        //        string projectId = e.CommandArgument.ToString();
        //        // Redirect to edit page with projectId parameter
        //        Response.Redirect($"EditProject.aspx?projectId={projectId}");
        //    }
        //    else if (e.CommandName == "Delete")
        //    {
        //        string projectId = e.CommandArgument.ToString();
        //        // Call delete function passing projectId
        //        // Implement your delete logic here
        //    }
        //}
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Button btnEdit = (Button)sender;
            string projectId = btnEdit.CommandArgument;
             // Encrypt the TaskID parameter
            string encryptedProjectId = Encrypt(projectId);
             Response.Redirect($"EditProject.aspx?Project_id={HttpUtility.UrlEncode(encryptedProjectId)}");
        }
        private string Encrypt(string projectId)
        {
             byte[] encryptedData = MachineKey.Protect(Encoding.UTF8.GetBytes(projectId));
            return Convert.ToBase64String(encryptedData);
        }
     }
}
