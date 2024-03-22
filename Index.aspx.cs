using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using BAL;
using Entity;
using DAL;

namespace TaskManagement
{
    public partial class Index : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            businessobjects e1 = new businessobjects();
            e1.address = address.Text;
            e1.age = age.Text;
            e1.emailid = emailid.Text;
            e1.gender = gender.SelectedValue;
            e1.Name = txtname.Text;
            e1.state = state.Text;
            e1.number = mobilenumber.Text;
            e1.password = password.Text;
            e1.confirmpassword = confirmpassword.Text;
            e1.role = ddlRole.SelectedValue;
            businesslogic b1 = new businesslogic();
            b1.userclick(e1);
            Response.Redirect("Login.aspx");
        }
    }
}