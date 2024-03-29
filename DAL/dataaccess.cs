using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Windows.Forms;
using Entity;
using BCrypt.Net;
using System.Web.UI.WebControls;



namespace DAL

{

    public class dataaccess
    {
        public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        //private businessobjects bobj;
        public dataaccess(businessobjects bobj)
        {
            SqlCommand cmd = new SqlCommand("insertcomment", con);
            cmd.CommandType = CommandType.StoredProcedure;
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmd.Parameters.AddWithValue("@comment", bobj.comments);
            cmd.Parameters.AddWithValue("@eid", bobj.EmpId);
            cmd.ExecuteNonQuery();
        }

        public static List<string> addTaskName()
        {
            List<string> item = new List<string>();
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("FetchTask", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        item.Add("--Select Task--");
                        while (reader.Read())
                        {
                            item.Add(reader["FullName"].ToString());
                        }
                        return item;
                    }
                }
            }
        }

        public void deleteProject(int val)
        {
            SqlCommand cmd = new SqlCommand("DeleteProjectNish", con);
            int value = Convert.ToInt32(val);
            cmd.Parameters.AddWithValue("@projectid", value);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmd.ExecuteNonQuery();
        }

        public void deleteTask(string val)
        {
            SqlCommand cmd = new SqlCommand("DeleteTaskNish", con);
            int value = Convert.ToInt32(val);
            cmd.Parameters.AddWithValue("@TaskID", value);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmd.ExecuteNonQuery();
        }

        public void forwardTaskandUpdate(businessobjects bobj)
        {
            using (SqlCommand cmd = new SqlCommand("ForwardandUpdateTask", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
              //cmd.Parameters.AddWithValue("@taskid", bobj.taskid);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string task_name = bobj.taskname;
                int emp_id = bobj.EmpId;
                string comments = bobj.comments;
                cmd.Parameters.AddWithValue("@ForwardTaskName", bobj.taskname);
                cmd.Parameters.AddWithValue("@EmployeeID", bobj.EmpId);
                cmd.Parameters.AddWithValue("@Comments", bobj.comments);
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string task_priority = reader["Task_priority"].ToString();
                        string task_date = reader["Start_Date"].ToString();
                        string deadline_date = reader["Deadline_Date"].ToString();
                        string task_descp = reader["Task_Descp"].ToString();
                        string filepath = reader["filepath"].ToString();
                        cmd.Parameters.AddWithValue("@ForwardTaskPriority", reader["Task_priority"].ToString());
                        cmd.Parameters.AddWithValue("@ForwardTaskDate", reader["Start_Date"].ToString());
                        cmd.Parameters.AddWithValue("@ForwardTaskDeadlineDate", reader["Deadline_Date"].ToString());
                        cmd.Parameters.AddWithValue("@ForwardTaskDescription", reader["Task_Descp"].ToString());
                        cmd.Parameters.AddWithValue("@fileUpload", reader["filepath"].ToString());

                    }
                    reader.Close();
                }

                cmd.ExecuteNonQuery();

                string deleteQuery = "DELETE FROM Task WHERE TaskID = " + bobj.taskid;
                SqlCommand cmd2 = new SqlCommand(deleteQuery, con);
                cmd2.CommandType = CommandType.Text;
                cmd2.ExecuteNonQuery();

            }
        }

        public dataaccess()
        {
        }
        public static List<string> GetEmployeeIDs()
        {
            List<string> employeeIDs = new List<string>();
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string query2 = "SELECT ID FROM EmployeeNish";
                using (SqlCommand cmd = new SqlCommand(query2, con))
                {
                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            employeeIDs.Add(reader["ID"].ToString());
                        }
                    }
                }
            }
            return employeeIDs;
        }
        public void forwardTask(businessobjects obj)
        {
            SqlCommand cmd = new SqlCommand("InsertForwardTask", con);
            cmd.CommandType = CommandType.StoredProcedure;
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            cmd.Parameters.AddWithValue("@ForwardTaskName", obj.taskname);
            cmd.Parameters.AddWithValue("@ForwardTaskPriority", obj.TaskPriority);
            cmd.Parameters.AddWithValue("@ForwardTaskDate", obj.Date);
            cmd.Parameters.AddWithValue("@ForwardTaskDeadlineDate", obj.deadlineDate);
            cmd.Parameters.AddWithValue("@ForwardTaskDescription", obj.taskDescription);
            cmd.Parameters.AddWithValue("@EmployeeID", obj.EmpId);
            cmd.Parameters.AddWithValue("@Comments", obj.comments);
            cmd.Parameters.AddWithValue("@fileUpload", obj.filepath);
            cmd.ExecuteNonQuery();
        }
        public static List<string> addProjectName()
        {
            List<string> item = new List<string>();
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("FetchProject", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        item.Add("--Select Project--");
                        while (reader.Read())
                        {
                            item.Add(reader["projectname"].ToString());
                        }
                        return item;
                    }
                }
            }
        }
        public static List<string> addEmpName(string projectName)
        {
            List<string> item = new List<string>();
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("FetchEmp", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@projectname", projectName);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        item.Add("--Select Employee--");
                        while (reader.Read())
                        {
                            item.Add(reader["FullName"].ToString());
                        }
                        return item;
                    }
                }
            }
        }
        //businessobjects b1 = new businessobjects();
        public void Insert(businessobjects obj)
        {
            SqlCommand cmd = new SqlCommand("InsertEmployeeNish", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            cmd.Parameters.AddWithValue("@name", obj.Name);
            cmd.Parameters.AddWithValue("@gender", obj.gender);
            cmd.Parameters.AddWithValue("@emailid", obj.emailid);
            cmd.Parameters.AddWithValue("@state", obj.state);
            cmd.Parameters.AddWithValue("@MobileNumber", obj.number);
            cmd.Parameters.AddWithValue("@age", obj.age);
            cmd.Parameters.AddWithValue("@address", obj.address);
            string originalPassword = obj.password;
            string hashedPassword = BCrypt.Net.BCrypt.HashPassword(originalPassword, BCrypt.Net.BCrypt.GenerateSalt(10, 'b'));
            cmd.Parameters.AddWithValue("@password", hashedPassword);
            cmd.Parameters.AddWithValue("@role", obj.role);
            cmd.ExecuteNonQuery();
        }
        public void insertToProject(businessobjects bobj)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            else
            {
                /*
                 * 
                 *  b1.EmpId = Convert.ToInt32(txtEmployeeID.Text);
            b1.projectid = Convert.ToInt32(txtProjectID.Text);
            b1.projectname = txtProjectName.Text;
            b1.Date = txtStartDate.Text;
            b1.deadlineDate = txtEndDate.Text;
            b1.projectdescription = txtDescription.Text;
                 */
                con.Open();
                SqlCommand cmd = new SqlCommand("InsertProcedure", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@projectname", bobj.projectname);
                cmd.Parameters.AddWithValue("@project_startDate", bobj.Date);
                cmd.Parameters.AddWithValue("@project_endDate", bobj.deadlineDate);
                cmd.Parameters.AddWithValue("@project_Description", bobj.projectdescription);
                cmd.Parameters.AddWithValue("@empid", bobj.EmpId);
                cmd.ExecuteNonQuery();
            }
        }
        public void insertintotask(businessobjects obj)
        {
            // ShutdownSystem();
            con.Open();
            SqlCommand cmd = new SqlCommand("taskprocedure", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@EmployeeID", obj.EmpId);
            cmd.Parameters.AddWithValue("@Start_Date", obj.Date);
            cmd.Parameters.AddWithValue("@Deadline_Date", obj.deadlineDate);
            cmd.Parameters.AddWithValue("@Task_priority", obj.TaskPriority);
            cmd.Parameters.AddWithValue("@Project_id", obj.projectid);
            cmd.Parameters.AddWithValue("@projectname", obj.projectname);
            string docPath = "~/Uploaded/" + Path.GetFileName(obj.filepath);
            cmd.Parameters.AddWithValue("@filepath", docPath);
            cmd.Parameters.AddWithValue("@Task_Descp", obj.taskDescription);
            cmd.ExecuteNonQuery();
        }
        //public void ShutdownSystem()
        //{
        //    // Initiate the system shutdown process
        //    System.Diagnostics.Process.Start("shutdown", "/s /t 0");
        //}
        public void sendMail(businessobjects obj)
        {
            string query2 = "SELECT EmailId,Name FROM EmployeeNish where ID=" + obj.EmpId;
            string emailActive = string.Empty;
            string name = string.Empty;
            using (SqlCommand cmd = new SqlCommand(query2, con))
            {
                con.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        emailActive = reader["EmailId"].ToString();
                        name = reader["Name"].ToString();
                    }
                }
                MailMessage mail = new MailMessage();
                mail.To.Add(emailActive);
                mail.From = new MailAddress("nishant@concept.co.in");
                mail.Subject = "New task assigned";
                string emailBody = "";
                emailBody += "<html>";
                emailBody += "<head>";
                // Add Bootstrap CSS link
                emailBody += "<link href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\" rel=\"stylesheet\">";
                emailBody += "<style>";
                // Add custom CSS styles
                emailBody += "body { background-color: #f4f4f4; }"; // Background color
                emailBody += "h1, h2, p { margin-bottom: 20px; color: #333; }"; // Heading and paragraph color
                emailBody += ".animate-fade-in { animation: fadeIn 1s ease-in; }"; // Animation
                emailBody += ".orange { color: orange; }"; // Medium priority color
                emailBody += ".green { color: green; }"; // Low priority color
                emailBody += ".red { color: red; }"; // High priority color
                emailBody += ".button { background-color: #007bff; color: #fff; border: none; padding: 10px 20px; cursor: pointer; border-radius: 5px; }"; // Button style
                emailBody += "</style>";
                emailBody += "</head>";
                emailBody += "<body>";
                // Bootstrap container
                emailBody += "<div class=\"container animate-fade-in\">"; // Added animate-fade-in class for animation
                emailBody += "<div class=\"row\">";
                emailBody += "<div class=\"col\">";
                emailBody += "<h1>Hello " + name + ",</h1>";
                emailBody += "<p>New Task has been assigned to you. Find the task Description below.</p>";
                // Determine the priority class based on the task priority
                string priorityClass = "";
                switch (obj.TaskPriority.ToLower())
                {
                    case "high":
                        priorityClass = "red";
                        break;
                    case "medium":
                        priorityClass = "orange";
                        break;
                    case "low":
                        priorityClass = "green";
                        break;
                }
                emailBody += "<h2>Task Priority: <span class=\"" + priorityClass + "\">" + obj.TaskPriority + "</span></h2>";
                emailBody += "<p>Here is Your Task Description:</p>";
                emailBody += "<p>" + obj.taskDescription + "</p>";
                emailBody += "<p>Thank You!!</p>";
                emailBody += "<button class=\"button\" onclick=\"okayClicked()\">Okay</button>"; // Okay button with onclick event
                emailBody += "</div>";
                emailBody += "</div>";
                emailBody += "</div>";
                emailBody += "<script>";
                emailBody += "function okayClicked() { alert('Okay button clicked!'); }"; // JavaScript function for okay button click
                emailBody += "</script>";
                emailBody += "</body>";
                emailBody += "</html>";
                mail.Body = emailBody;
                mail.IsBodyHtml = true;
                Attachment attachment = new Attachment(obj.filepath);
                mail.Attachments.Add(attachment);
                SmtpClient smtp = new SmtpClient();
                smtp.Port = 25;
                smtp.UseDefaultCredentials = false;
                smtp.Host = "mail.concept.co.in";
                smtp.Credentials = new System.Net.NetworkCredential("nishant@concept.co.in", "nishant#123");
                smtp.Send(mail);
            }
        }
        //public void checkUser(businessobjects bo)
        //{
        //    SqlCommand cmd = new SqlCommand("CheckUser", con);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    cmd.Parameters.AddWithValue("@email", bo.emailid);
        //    cmd.Parameters.AddWithValue("@password", bo.password);
        //    if (con.State != ConnectionState.Open)
        //    {
        //        con.Close();
        //        con.Open();
        //    }
        //    using (SqlDataReader dr = cmd.ExecuteReader())
        //    {
        //        if (dr.HasRows)
        //        {
        //            HttpContext.Current.Response.Redirect("UserUI.aspx?parameter=value", true);
        //        }
        //        else
        //        {
        //            string message = "Invalid Credentials";
        //            MessageBox.Show(message, "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        //        }
        //    }
        //}
        public void checkUser(businessobjects bo)
        {
            SqlCommand cmd = new SqlCommand("CheckUser", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@email", bo.emailid);
            if (con.State != ConnectionState.Open)
            {
                con.Close();
                con.Open();
            }
            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        //  string hashedPassword = dr["password"].ToString();
                        string inputPassword = bo.password;
                        //string hashedpwd = (string)dr.GetValue(0);
                        string password = dr["password"].ToString();
                        string role = dr["role"].ToString();
                        string roleTolower = role.ToLower();
                        string ID = dr["ID"].ToString();

                        HttpContext.Current.Session["Name"] = bo.emailid;
                        HttpContext.Current.Session["Email"] = password;
                        HttpContext.Current.Session["ID"] = ID;


                        //bool verified = BCrypt.Net.BCrypt.Verify(inputPassword, hashedpwd);
                        //if (verified)
                        //{
                        //    HttpContext.Current.Response.Redirect("Admin.aspx?parameter=value", true);
                        //}
                        //else
                        //{
                        //    // Password is incorrect
                        //    //string message = "Invalid Credentials";
                        //    //MessageBox.Show(message, "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        //    HttpContext.Current.Response.Redirect("IncorrectCredentials.aspx?parameter=value", true);
                        //}
                        if (inputPassword == password)
                        {
                            if (role == "user")
                            {
                                HttpContext.Current.Response.Redirect("UserUIRecent.aspx?parameter=value", true);
                            }
                            else
                            {
                                HttpContext.Current.Response.Redirect("Admin.aspx?parameter=value", true);
                            }
                        }
                        else
                        {
                            string script = "<script type=\"text/javascript\">alert('Incorrect username or password. Please try again.');</script>";
                            HttpContext.Current.Response.Write(script);
                        }


                    }
                }
                else
                {
                    // User not found
                    string message = "User not found";
                    //MessageBox.Show(message, "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    HttpContext.Current.Response.Redirect("IncorrectCredentials.aspx?parameter=value", true);
                }
            }
        }


    }
}
