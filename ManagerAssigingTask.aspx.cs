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
    public partial class ManagerAssigingTask : System.Web.UI.Page
    {
        //Linking the data base from webconfig to here and puting it i an string whxih caryy it
        string strcon = ConfigurationManager.ConnectionStrings["conection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        //addbutton
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (CheackIfExist())
            {
                Response.Write("<script>alert('The Task With Same Id Allready Exist. Use Differnt Task ID or Update The Task Which Is Assigend Earlier With Same ID');</script>");
            }
            else
            {
                AddNewTask();
            }
        }

        //go button
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkIfEmployeExists())
            {
                Clickid();
            }
            else
            {
                Response.Write("<script>alert('No Employe Exist With This Id.Cheack Employe Id Again');</script>");
            }
        }

         //updatebutton
         protected void Button2_Click(object sender, EventArgs e)
         {
            if (CheackIfExist())
            {
                UpdatePreviousTask();
            }
            else
            {
                Response.Write("<script>alert('The Id does not exist Use Differnt Task ID to Add task or Existing Id to Update That Task');</script>");
            }
        }


        //Delete Button
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (CheackIfExist())
            {
                DeleteTheTask();
            }
            else
            {
                Response.Write("<script>alert('The Id does not exist Use Differnt Id');</script>");
            }
        }




        //self made funtion

        //cheack  if task id exist or not
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
                SqlCommand cmand = new SqlCommand("Select * from TaskAssigendByManager where TaskId= '" + TextBox1.Text.Trim() + "'; ", con);

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
                Response.Write("<script>alert('"+ax.Message+"');</script>");
                return false;
            }
        }

        //funtion to cheack employe exist
        bool checkIfEmployeExists ()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from EmployeDetailTable where EmployeId='" + TextBox15.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
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

        void Clickid()
        {
            try
            {
                SqlConnection conect = new SqlConnection(strcon);
                if (conect.State == ConnectionState.Closed)
                {
                    conect.Open();
                }
                SqlCommand cmd = new SqlCommand(" Select * from EmployeDetailTable where EmployeId='" + TextBox15.Text.Trim() + "';", conect);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox2.Text = dr.GetValue(0).ToString();
                        TextBox3.Text = dr.GetValue(11).ToString(); 
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

        //if not exist then this funtion will run
        void AddNewTask()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO TaskAssigendByManager(TaskId,EmployeId,TaskAssigend,DeadLine,ManagerName,ManagerId,TaskStatus) values(@TaskId,@EmployeId,@TaskAssigend,@DeadLine,@ManagerName,@ManagerId,@TaskStatus)", con);

                cmd.Parameters.AddWithValue("@TaskId", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@EmployeId", TextBox15.Text.Trim());
                cmd.Parameters.AddWithValue("@TaskAssigend", TextBox16.Text.Trim());
                cmd.Parameters.AddWithValue("@DeadLine", TextBox17.Text.Trim());
                cmd.Parameters.AddWithValue("@ManagerName", TextBox18.Text.Trim());
                cmd.Parameters.AddWithValue("@ManagerId", TextBox19.Text.Trim());
                cmd.Parameters.AddWithValue("@TaskStatus", "Pending");

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author added Successfully');</script>");
                GridView1.DataBind();
                clearForm();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //to update the task with id
        void UpdatePreviousTask() 
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE TaskAssigendByManager SET EmployeId=@EmployeId,TaskAssigend=@TaskAssigend,DeadLine=@DeadLine WHERE TaskId='"+TextBox1.Text.Trim()+"' ", con);

                cmd.Parameters.AddWithValue("@EmployeId", TextBox15.Text.Trim());
                cmd.Parameters.AddWithValue("@TaskAssigend", TextBox16.Text.Trim());
                cmd.Parameters.AddWithValue("@DeadLine", TextBox17.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Task Updated Succesfully');</script>");
                GridView1.DataBind();
                clearForm();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        
        //delete the task if there was some mistake or its been done but user
        void DeleteTheTask()
        {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE FROM TaskAssigendByManager WHERE TaskId='" + TextBox1.Text.Trim() + "' ", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Task Deleted Succesfully');</script>");
                    GridView1.DataBind();
                clearForm();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
        }


        void clearForm()
        {
            TextBox1.Text = "";
            TextBox15.Text = "";
            TextBox16.Text = "";
            TextBox17.Text = "";
            TextBox18.Text = "";
            TextBox19.Text = "";
        }

        //uploading file to user
        protected void Button5_Click(object sender, EventArgs e)
        {
                if (FileUpload1.HasFile)
                {
                        FileUpload1.SaveAs(Server.MapPath("~/ManagerUploadedFile/" + FileUpload1.FileName));
                        Response.Write("<script>alert('Fle Uploaded Succesfully');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Chosee File To Upload 1st');</script>");
                }

        }

        //updating data base if file there or not
     }
}