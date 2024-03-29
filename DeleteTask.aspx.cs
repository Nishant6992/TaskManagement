using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BAL;
using Entity;

namespace TaskManagement
{
    public partial class DeleteTask : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                PopulateTask();
                PopulateProject();
            }


        }

        private void PopulateProject()
        {

            List<string> projects = businesslogic.Add();
            ddlProject.DataSource = projects;
            ddlProject.DataBind();
        }

        private void PopulateTask()
        {
            string taskname = ddlTasks.SelectedValue;
            List<string> tasknameList = businesslogic.AddTask();
            ddlTasks.DataSource = tasknameList;
            ddlTasks.DataBind();
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {

            string val = ddlTasks.SelectedValue;
            businesslogic blogic = new businesslogic();
            blogic.deletetask(val);
            ddlTasks.SelectedValue = null;

        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
        }

        protected void ddlTasks_SelectedIndexChanged(object sender, EventArgs e)
        {


        }

        protected void btnDeleteProject_Click(object sender, EventArgs e)
        {
            int val = ddlProject.SelectedIndex;
            businesslogic blogic = new businesslogic();
            blogic.deleteProject(val);
            ddlProject.SelectedValue = null;

        }
    }
}