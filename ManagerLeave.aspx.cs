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
    public partial class WebForm2 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["conection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        //button logic hit on apply
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Cheackif())
            {
                if (Cheackifleave())
                {
                    Response.Write("<script>alert('Same Leave Id Exist Use Differtent Leave ID');</script>");
                }
                else
                {
                    apply();
                }
                
            }
            else
            {
                Response.Write("<script>alert('User Does Not Exist');</script>");
            }
        }

        //che
        bool Cheackif()
        {
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
                SqlCommand cmand = new SqlCommand("Select * from ManagerDetailTable where ManagerId= '" + TextBox4.Text.Trim() + "'; ", con);

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
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        //logic of applying leave
        void apply()
        {
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
                //using sql comand class so that we can write sql query there.The first oject is the sql query and the second is the conection object.WE use vvaribale cmand which store the command we give in sql syntax.And in place of values we are using placeholder which we gona use to enter our value and these placeholder act as a buffer
                SqlCommand cmand = new SqlCommand("INSERT INTO LeaveAppliedByManager(ManagerId,LeaveType,StartingDate,EndingDate,Reason,LeaveStatus,LeaveId,NoOfDays) values(@ManagerId,@LeaveType,@StartingDate,@EndingDate,@Reason,@LeaveStatus,@LeaveId,@NoOfDays)", con);

                //now we are adding all the parameters with these addwithvalue class
                cmand.Parameters.AddWithValue("@ManagerId", TextBox4.Text.Trim());
                cmand.Parameters.AddWithValue("@LeaveType", DropDownList1.SelectedItem.Value);
                cmand.Parameters.AddWithValue("@StartingDate", TextBox1.Text.Trim());
                cmand.Parameters.AddWithValue("@EndingDate", TextBox2.Text.Trim());
                cmand.Parameters.AddWithValue("@Reason", TextBox3.Text.Trim());
                cmand.Parameters.AddWithValue("@LeaveStatus", "Pending");
                cmand.Parameters.AddWithValue("@LeaveId", TextBox5.Text.Trim());
                cmand.Parameters.AddWithValue("@NoOfDays", TextBox8.Text.Trim());

                //this line gona actually execute the code
                cmand.ExecuteNonQuery();

                //now closing the object
                con.Close();

                //Message shown to the user
                Response.Write("<script>alert('Apllied');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //cheacking if leave even exist
        bool Cheackifleave()
        {
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
                SqlCommand cmand = new SqlCommand("Select * from LeaveAppliedByManager where LeaveId= '" + TextBox5.Text.Trim() + "'; ", con);

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
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        //logic to display the information
        void Clickid()
        {
            try
            {
                SqlConnection conect = new SqlConnection(strcon);
                if (conect.State == ConnectionState.Closed)
                {
                    conect.Open();
                }
                SqlCommand cmd = new SqlCommand(" Select * from LeaveAppliedByManager where LeaveId='" + TextBox10.Text.Trim() + "';", conect);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox6.Text = dr.GetValue(0).ToString();
                        TextBox7.Text = dr.GetValue(5).ToString();
                    }

                }
                else
                {
                    Response.Write("<script>alert('Invalid Leave Id');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //button to cheack if leave approved or not
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (Cheackifleave())
            {
                 Clickid();
            }
            else
            {
               Response.Write("<script>alert('Same Leave Id Exist Use Differtent Leave ID');</script>");
            }
        }
    }
}