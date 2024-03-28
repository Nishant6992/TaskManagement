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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         }
         protected void btnLogin_Click(object sender, EventArgs e)
        {
            businessobjects bobj = new businessobjects();
            bobj.password = txtPassword.Text;
            bobj.emailid = txtemail.Text;
            businesslogic blogic = new businesslogic();
            blogic.checkCredentials(bobj);
            
           
         }

    }
}