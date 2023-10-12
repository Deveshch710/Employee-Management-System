using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        //Linking the data base from webconfig to here and puting it i an string whxih caryy it
        string strcon = ConfigurationManager.ConnectionStrings["conection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string managerID = Session["EmpId"].ToString(); // Get manager ID from session
                int totalLeaves = GetTotalLeavesForManager(managerID);

                lblTotalLeaves.Text = $"{totalLeaves}";
            }

            if (!IsPostBack)
            {
                string loggedInEmployeeID = Session["EmpID"] as string;

                if (!string.IsNullOrEmpty(loggedInEmployeeID))
                {
                    int pendingTasksCount = GetPendingTasksCount(loggedInEmployeeID);
                    lblPendingTasks.Text = pendingTasksCount.ToString();
                }
            }

            if (!IsPostBack)
            {
                string loggedInEmployeeID = Session["EmpID"] as string;

                if (!string.IsNullOrEmpty(loggedInEmployeeID))
                {
                    int pendingTasksCount = GetWorkingTasksCount(loggedInEmployeeID);
                    lblWorkingTask.Text = pendingTasksCount.ToString();
                }
            }

            GridView1.DataBind();
        }

        //leaves
        private int GetTotalLeavesForManager(string managerID)
        {
            int totalLeaves = 0;

            using (SqlConnection connection = new SqlConnection(strcon))
            {
                string query = "SELECT SUM(NoOfDays) FROM LeaveAppliedByUser WHERE EmployId = @EmployId";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@EmployId", managerID);
                    connection.Open();
                    var result = command.ExecuteScalar();
                    if (result != DBNull.Value)
                    {
                        totalLeaves = Convert.ToInt32(result);
                    }
                }
            }

            return totalLeaves;
        }

        //pending task
        private int GetPendingTasksCount(string employeeID)
        {
            int pendingTasksCount = 0;

            using (SqlConnection connection = new SqlConnection(strcon))
            {
                connection.Open();

                string query = "SELECT COUNT(*) AS pending_tasks_count FROM TaskAssigendByManager WHERE EmployeId = @EmployeId AND TaskStatus = 'Pending'";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@EmployeId", employeeID);
                    pendingTasksCount = Convert.ToInt32(command.ExecuteScalar());
                }
            }

            return pendingTasksCount;
        }

        //pending task
        private int GetWorkingTasksCount(string employeeID)
        {
            int pendingTasksCount = 0;

            using (SqlConnection connection = new SqlConnection(strcon))
            {
                connection.Open();

                string query = "SELECT COUNT(*) AS pending_tasks_count FROM TaskAssigendByManager WHERE EmployeId = @EmployeId AND TaskStatus = 'Working'";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@EmployeId", employeeID);
                    pendingTasksCount = Convert.ToInt32(command.ExecuteScalar());
                }
            }

            return pendingTasksCount;
        }
    }
}