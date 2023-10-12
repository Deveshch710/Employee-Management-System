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
    public partial class WebForm1 : System.Web.UI.Page
    {
        //Linking the data base from webconfig to here and puting it i an string whxih caryy it
        string strcon = ConfigurationManager.ConnectionStrings["conection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        //go button to get id of the employee
        protected void Button3_Click(object sender, EventArgs e)
        {
            Clickid();
        }

        //reject the leave 
        protected void Button2_Click(object sender, EventArgs e)
        {
            logic("Reject");
        }

        //approve the leave
        protected void Button1_Click(object sender, EventArgs e)
        {
            logic("Approved");
        }

        //launching go button logic
        void Clickid()
        {
            try
            {
                SqlConnection conect = new SqlConnection(strcon);
                if (conect.State == ConnectionState.Closed)
                {
                    conect.Open();
                }
                SqlCommand cmd = new SqlCommand(" Select * from LeaveAppliedByUser where LeaveId='" + TextBox5.Text.Trim() + "';", conect);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox6.Text = dr.GetValue(1).ToString();
                        TextBox1.Text = dr.GetValue(2).ToString();
                        TextBox2.Text = dr.GetValue(3).ToString();
                        TextBox3.Text = dr.GetValue(4).ToString();
                        TextBox4.Text = dr.GetValue(0).ToString();
                        TextBox5.Text = dr.GetValue(6).ToString();
                    }
                    
                }
                else
                {
                    Response.Write("<script>alert('Invalid User');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        // leave logic approve or reject
        void logic(string status)
        {
            try
            {
                SqlConnection conect = new SqlConnection(strcon);
                if (conect.State == ConnectionState.Closed)
                {
                    conect.Open();
                }
                SqlCommand cmd = new SqlCommand(" Update LeaveAppliedByUser Set LeaveStatus='" + status+ "' Where LeaveId='" + TextBox5.Text.Trim() + "';", conect);
                cmd.ExecuteNonQuery();
                conect.Close();
                GridView1.DataBind();
                Response.Write("<script>alert('" + status + "');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}