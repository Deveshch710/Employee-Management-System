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
    public partial class WebForm3 : System.Web.UI.Page
    {

        //Declaring the conection string which hold our conectionstring from web.config file
        //creating a variable strong our conection string
        string strconect = ConfigurationManager.ConnectionStrings["conection"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox12_TextChanged(object sender, EventArgs e)
        {

        }


        //Sending Data Enter By New User To The Server and then direct that data to database when user clink on that SIGN UP button
        protected void Button1_Click(object sender, EventArgs e)
        {
            //cheacking if the user id is same or not if same error pops up else no error code will run
            if (CheackExist()){
                Response.Write("<script>alert('Member With Same Id Exist, Please Cheack Your Id Again ');</script>");
            }
            else
            {
                SignupButtonClicked();
            }
        }

        //bool funtion to cheack if the member exist or no
        bool CheackExist()
        {

            //we using try and catch to avoid our wesite to crash if any exception occurs
            try
            {
                //created object name con
                SqlConnection con = new SqlConnection(strconect);

                //cheacking if the connection with database is there or not.The con is object storing the str connect value which coneect it to sql server
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //firing sql queri
                //here we are running query to cheack if emlpyeid exist or not
                SqlCommand cmand = new SqlCommand("Select * from EmployeDetailTable where EmployeId= '"+TextBox10.Text.Trim()+"'; ", con);

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

        //creating a funtion which store the on click event on signup button , we did it to make on click event main funtion to be clean
        void SignupButtonClicked()
        {

            //we using try and catch to avoid our wesite to crash if any exception occurs
            try
            {
                //created object name con
                SqlConnection con = new SqlConnection(strconect);

                //cheacking if the connection with database is there or not.The con is object storing the str connect value which coneect it to sql server
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //firing sql queri
                //using sql comand class so that we can write sql query there.The first oject is the sql query and the second is the conection object.WE use vvaribale cmand which store the command we give in sql syntax.And in place of values we are using placeholder which we gona use to enter our value and these placeholder act as a buffer
                SqlCommand cmand = new SqlCommand("INSERT INTO EmployeDetailTable(FirstName,LastName,EmailId,ContactNo,DateOfBirth,AddressLine1,AddressLine2,State,City,Pincode,OfficeAlloted,DepartmentAlloted,ManagerAlloted,EmployeId,Password) values(@FirstName,@LastName,@EmailId,@ContactNo,@DateOfBirth,@AddressLine1,@AddressLine2,@State,@City,@Pincode,@OfficeAlloted,@DepartmentAlloted,@ManagerAlloted,@EmployeId,@Password)", con);

                //now we are adding all the parameters with these addwithvalue class
                cmand.Parameters.AddWithValue("@FirstName", TextBox1.Text.Trim());
                cmand.Parameters.AddWithValue("@LastName", TextBox2.Text.Trim());
                cmand.Parameters.AddWithValue("@EmailId", TextBox3.Text.Trim());
                cmand.Parameters.AddWithValue("@ContactNo", TextBox4.Text.Trim());
                cmand.Parameters.AddWithValue("@DateOfBirth", TextBox5.Text.Trim());
                cmand.Parameters.AddWithValue("@AddressLine1", TextBox6.Text.Trim());
                cmand.Parameters.AddWithValue("@AddressLine2", TextBox7.Text.Trim());
                cmand.Parameters.AddWithValue("@State", DropDownList1.SelectedItem.Value);
                cmand.Parameters.AddWithValue("@City", TextBox8.Text.Trim());
                cmand.Parameters.AddWithValue("@Pincode", TextBox9.Text.Trim());
                cmand.Parameters.AddWithValue("@OfficeAlloted", DropDownList2.SelectedItem.Value);
                cmand.Parameters.AddWithValue("@DepartmentAlloted", DropDownList3.SelectedItem.Value);
                cmand.Parameters.AddWithValue("@ManagerAlloted", DropDownList4.SelectedItem.Value);
                cmand.Parameters.AddWithValue("@EmployeId", TextBox10.Text.Trim());
                cmand.Parameters.AddWithValue("@Password", TextBox11.Text.Trim());

                //this line gona actually execute the code
                cmand.ExecuteNonQuery();

                //now closing the object
                con.Close();

                //Message shown to the user
                Response.Write("<script>alert('Sign Up Successful. Go to Login Page to Login');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
    }
}