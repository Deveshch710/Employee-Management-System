using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class UserLogin : System.Web.UI.Page
    {
        //Linking the data base from webconfig to here and puting it i an string whxih caryy it
        string strcon = ConfigurationManager.ConnectionStrings["conection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conect = new SqlConnection(strcon);
                if (conect.State == ConnectionState.Closed)
                {
                    conect.Open();
                }
                SqlCommand cmd =new SqlCommand("select* from EmployeDetailTable where EmployeId='"+ TextBox1 .Text.Trim()+ "' AND Password='" + TextBox2.Text.Trim() + "'", conect);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Session["EmpName"] = dr.GetValue(0).ToString();
                        Session["EmpId"]=dr.GetValue(13).ToString();
                        
                    }
                    Response.Redirect("UserDashboard.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid User');</script>");
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('"+ex.Message+"');</script>");
            }
        }
    }
}