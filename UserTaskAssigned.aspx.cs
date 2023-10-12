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
    public partial class WebForm7 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["conection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        //go button to fetch task info
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (CheackIfExist())
            {
                Clickid();
            }
            else
            {
                Response.Write("<script>alert('No Task Exist With This Id.Cheack Task Id Again');</script>");
            }
        }


        //geting data from table to display in inputs
        void Clickid()
        {
            try
            {
                SqlConnection conect = new SqlConnection(strcon);
                if (conect.State == ConnectionState.Closed)
                {
                    conect.Open();
                }
                SqlCommand cmd = new SqlCommand(" Select * from TaskAssigendByManager where TaskId='" + TextBox2.Text.Trim() + "';", conect);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox1.Text = dr.GetValue(5).ToString();
                        TextBox3.Text = dr.GetValue(4).ToString();
                        TextBox16.Text = dr.GetValue(2).ToString();
                        TextBox17.Text = dr.GetValue(3).ToString();
                    }

                }
                else
                {
                    Response.Write("<script>alert('Invalid TaskId');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //cheacking if task exist
        bool CheackIfExist()
        {

            //we using try and catch to avoid our wesite to crash if any exception occurs
            try
            {
                //created object name con
                SqlConnection con = new SqlConnection(strcon);

                //cheacking if the connection with database is there or not.The con is object storing the str connect value which coneect it to sql server
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //firing sql queri
                //here we are running query to cheack if emlpyeid exist or not
                SqlCommand cmand = new SqlCommand("Select * from TaskAssigendByManager where TaskId= '" + TextBox2.Text.Trim() + "'; ", con);

                //creating dataadapter class object. tThis is use in data base in disconected way
                SqlDataAdapter data = new SqlDataAdapter(cmand);

                //using class to cretaing a table 
                DataTable datatable = new DataTable();

                //using that data to fill in data table
                data.Fill(datatable);


                //now cheacking if data table is filled or not, if it is filled that means that user id allready exist else no id exist
                if (datatable.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ax)
            {
                Response.Write("<script>alert('" + ax.Message + "');</script>");
                return false;
            }
        }

        void logic(string TaskStatus)
        {
            try
            {
                SqlConnection conect = new SqlConnection(strcon);
                if (conect.State == ConnectionState.Closed)
                {
                    conect.Open();
                }
                SqlCommand cmd = new SqlCommand(" Update TaskAssigendByManager Set TaskStatus='" + TaskStatus + "' Where TaskId='" + TextBox2.Text.Trim() + "';", conect);
                cmd.ExecuteNonQuery();
                conect.Close();
                GridView1.DataBind();
                Response.Write("<script>alert('" + TaskStatus + "');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            logic("Completed");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            logic("Working");
        }
    }
}