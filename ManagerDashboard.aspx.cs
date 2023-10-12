using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        //Linking the data base from webconfig to here and puting it i an string whxih caryy it
        string strcon = ConfigurationManager.ConnectionStrings["conection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //totale leaves
                string managerID = Session["ManId"].ToString(); // Get manager ID from session
                int totalLeaves = GetTotalLeavesForManager(managerID);

                lblTotalLeaves.Text = $"{totalLeaves}";
            }

            if (!IsPostBack)
            {
                int totalPendingTasksCount = GetTotalPendingTasksCount();
                lblPendingTasks.Text = totalPendingTasksCount.ToString();
            }

            if (!IsPostBack)
            {
                int totalPendingTasksCount = GetTotalWorkingTasksCount();
                lblWorkingTask.Text = totalPendingTasksCount.ToString();
            }

            GridView1.DataBind();
        }

        //leaves
        private int GetTotalLeavesForManager(string managerID)
        {
            int totalLeaves = 0;

            using (SqlConnection connection = new SqlConnection(strcon))
            {
                string query = "SELECT SUM(NoOfDays) FROM LeaveAppliedByManager WHERE ManagerId = @ManagerId";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@ManagerId", managerID);
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
        private int GetTotalPendingTasksCount()
        {
            int totalPendingTasksCount = 0;

            using (SqlConnection connection = new SqlConnection(strcon))
            {
                connection.Open();

                string query = "SELECT COUNT(*) AS total_pending_tasks_count FROM TaskAssigendToManagerByManager WHERE Status = 'Pending'";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    totalPendingTasksCount = Convert.ToInt32(command.ExecuteScalar());
                }
            }

            return totalPendingTasksCount;
        }

        //working task
        private int GetTotalWorkingTasksCount()
        {
            int totalPendingTasksCount = 0;

            using (SqlConnection connection = new SqlConnection(strcon))
            {
                connection.Open();

                string query = "SELECT COUNT(*) AS total_pending_tasks_count FROM TaskAssigendToManagerByManager WHERE Status = 'Working'";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    totalPendingTasksCount = Convert.ToInt32(command.ExecuteScalar());
                }
            }

            return totalPendingTasksCount;
        }
    }
}