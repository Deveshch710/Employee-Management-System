using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class MasterHLS : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Linking The Admin Page Using Respone as it is predefined class in aspx in c#
        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManagerLogin.aspx");
        }
    }
}