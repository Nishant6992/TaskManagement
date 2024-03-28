﻿using System;
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
            PopulateTask();
            PopulateProject();
        }

        private void PopulateProject()
        {
            
            List<string> projects = businesslogic.Add();
            DropDownList1.DataSource = projects;
            DropDownList1.DataBind();
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
           
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
        }

        protected void ddlTasks_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}