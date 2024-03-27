using System;
using System.Web.UI;
 namespace TaskManagement
{
    public partial class IncorrectCredentials : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
         protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx"); // Redirect to your login page
        }
    }
}
