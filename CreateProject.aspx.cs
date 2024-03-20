using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BAL;
using DAL;
using Entity;

namespace TaskManagement
{
    public partial class CreateProject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            PopulateEmployeesDropDownList();
        }
        private void PopulateEmployeesDropDownList()
        {
            // Call method from business logic layer to get employee IDs
            List<string> employeeIDs = businesslogic.GetEmployeeIDs();

            //employeeIDs.Insert(0, "--Select--");
            ddlEmployeesid.DataSource = employeeIDs;
            ddlEmployeesid.DataBind();
        }
        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            businessobjects bobj = new businessobjects();
            bobj.projectname = txtProjectName.Text;
            bobj.Date = txtStartDate.Text;
            bobj.deadlineDate = txtDeadline.Text;
            bobj.projectdescription = txtProjectDescription.Text;
            bobj.EmpId = Convert.ToInt32(ddlEmployeesid.SelectedValue);
            businesslogic blogic = new businesslogic();
            blogic.addProject(bobj);
        }

        
    }
} 