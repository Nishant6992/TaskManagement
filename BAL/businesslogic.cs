using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using DAL;
using Entity;
namespace BAL
{
    public class businesslogic
    {
        private businessobjects b1;
        private businessobjects bobj;
        public businesslogic()
        {
        }
        public businesslogic(businessobjects bobj)
        {
            dataaccess dal = new dataaccess(bobj);
        }
        public void userclick(businessobjects obj)
        {
            dataaccess d1 = new dataaccess();
            d1.Insert(obj);
        }

        public static List<string> AddTask()
        {

            return dataaccess.addTaskName();

        }

        public void checkCredentials(businessobjects obj)
        {
            dataaccess d1 = new dataaccess();
            d1.checkUser(obj);
        }
        public void informUser(businessobjects obj)
        {
            dataaccess d1 = new dataaccess();
            d1.sendMail(obj);
        }

        public void deletetask(string val)
        {
            dataaccess dal = new dataaccess();
            dal.deleteTask(val);
        }

        public static List<string> GetEmployeeIDs()
        {
            return dataaccess.GetEmployeeIDs();
        }
        public static List<string> Add()
        {
            return dataaccess.addProjectName();
        }
        public void insert(businessobjects obj)
        {
            dataaccess d1 = new dataaccess();
            d1.insertintotask(obj);
        }

        public void deleteProject(int val)
        {
            dataaccess dal = new dataaccess();
            dal.deleteProject(val);
        }

        public void addProject(businessobjects bobj)
        {
            dataaccess d1 = new dataaccess();
            d1.insertToProject(bobj);
        }
        public static List<string> AddEmp(string projectName)
        {
            return dataaccess.addEmpName(projectName);
        }
        public void forwardTask(businessobjects obj)
        {
            dataaccess dal = new dataaccess();
            dal.forwardTask(obj);
        }

        public void forwardTaskandUpdate(businessobjects bobj)
        {
            dataaccess dal = new dataaccess();
            dal.forwardTaskandUpdate(bobj);
        }
    }
}
