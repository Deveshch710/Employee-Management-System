<%@ Page Title="" Language="C#" MasterPageFile="~/MasterHLS.Master" AutoEventWireup="true" CodeBehind="UserSignup.aspx.cs" Inherits="WebApplication1.WebForm3" %>

<%-- Head Content --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- Css Linking of signup page --%>
    <link href="UserSignupStyle.css" rel="stylesheet" />
    
    <%-- Java script Linking of sign up page --%>
    <script src="UserSignupJavaScript.js"></script>
</asp:Content>

<%-- Main Content --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <%-- Main Container --%>
    <div class="container" >

        <%-- sub Container containing all elements--%>
        <div class="subcontainer" >

            <%-- Video Container --%>
                <img src="Images/Signup%20Page%20Photo.png" />
            
            <%-- Text Container --%>
            <div class="textcontent">


                <%-- Heading --%>
                <div class="heading">
                    <h1>SIGN UP</h1>
                </div>


                 <%-- Badge --%>
                <span class="badge text-bg-secondary">Personal Detail</span>

                <%-- Input tabs Container containg name email phone no date of birth --%>
                <div class="inputtabs"> 

                    <div class="box">
                        <asp:TextBox CssClass="form-control" placeholder="First Name" ID="TextBox1" runat="server" ></asp:TextBox>
                    </div>
                    <div class="box">
                        <asp:TextBox CssClass="form-control" placeholder="Last Name" ID="TextBox2" runat="server" ></asp:TextBox>
                    </div>
                    <div class="box">
                        <asp:TextBox CssClass="form-control" placeholder="Email Id" ID="TextBox3" runat="server" TTextMode="Email"></asp:TextBox>
                    </div>
                    <div class="box">
                        <asp:TextBox CssClass="form-control" placeholder="Contact No" ID="TextBox4" runat="server" TextMode="Phone"></asp:TextBox>
                    </div>
                    <div class="box">
                        <asp:TextBox CssClass="form-control" placeholder="Date of Birth" ID="TextBox5" runat="server" TextMode="Date" ></asp:TextBox>
                    </div>
                </div>

                
                 <%-- Badge --%>
                <span class="badge text-bg-secondary">Address Details</span>

                 <%-- Input tabs Container containg address state city pin code --%>
                <div class="inputtabs"> 
                    <div class="box">
                        <asp:TextBox CssClass="form-control" placeholder="Address Line 1" ID="TextBox6" runat="server" ></asp:TextBox>
                    </div>
                    <div class="box">
                        <asp:TextBox CssClass="form-control" placeholder="Address Line 2" ID="TextBox7" runat="server" ></asp:TextBox>
                    </div>
                    <div class="box">
                        <asp:DropDownList Class="form-control" ID="DropDownList1" runat="server">
                            <asp:ListItem Text="State" Value="State" />
                            <asp:ListItem Text="Jammu and Kashmir" Value="Jammu and Kashmir" />
                            <asp:ListItem Text="Ladak" Value="Ladak" />
                            <asp:ListItem Text="Himachal" Value="Himachal" />
                            <asp:ListItem Text="Punjab" Value="Punjab" />
                            <asp:ListItem Text="Haryana" Value="Haryana" />
                            <asp:ListItem Text="Delhi" Value="Delhi" />
                            <asp:ListItem Text="UttarPradesh" Value="UttarPradesh" />
                            <asp:ListItem Text="UttaraKhand" Value="UttaraKhand" />
                            <asp:ListItem Text="MadhyaPradesh" Value="MadhyaPradesh" />
                            <asp:ListItem Text="Bihar" Value="Bihar" />
                            <asp:ListItem Text="Jharkhand" Value="Jharkhand" />
                            <asp:ListItem Text="West Bengal" Value="West Bengal" />
                            <asp:ListItem Text="Rajisthan" Value="Rajisthan" />
                            <asp:ListItem Text="Gujarat" Value="Gujarat" />
                            <asp:ListItem Text="Mumbai" Value="Mumbai" />
                            <asp:ListItem Text="Goa" Value="Goa" />
                            <asp:ListItem Text="Kerela" Value="Kerela" />
                            <asp:ListItem Text="Tamil Nadu" Value="Tamil Nadu" />
                            <asp:ListItem Text="Karnatka" Value="Karnatka" />
                            <asp:ListItem Text="AndraPradesh" Value="AndraPradesh" />
                            <asp:ListItem Text="Telengana" Value="Telengana" />
                            <asp:ListItem Text="Odisha" Value="Odisha" />
                            <asp:ListItem Text="Chhattisgarh" Value="Chhattisgarh" />
                            <asp:ListItem Text="Sikkim" Value="Sikkim" />
                            <asp:ListItem Text="Assam" Value="Assam" />
                            <asp:ListItem Text="Meghalya" Value="Meghalya" />
                            <asp:ListItem Text="NagaLand" Value="NagaLand" />
                            <asp:ListItem Text="Mizoram" Value="Mizoram" />
                            <asp:ListItem Text="Manipur" Value="Manipur" />
                            <asp:ListItem Text="Tripura" Value="Tripura" />
                            <asp:ListItem Text="Andaban AND Nicorbar" Value="Andaban AND Nicorbar" />
                            <asp:ListItem Text="Lakshadeep" Value="Lakshadeep" />
                        </asp:DropDownList>
                    </div>
                    <div class="box">
                        <asp:TextBox CssClass="form-control" placeholder="City" ID="TextBox8" runat="server" ></asp:TextBox>
                    </div>
                    <div class="box">
                        <asp:TextBox CssClass="form-control" placeholder="PinCode" ID="TextBox9" runat="server" TextMode="Number" MaxLength="6" ></asp:TextBox>
                    </div>
                </div>
                
                 <%-- Badge --%>
                <span class="badge text-bg-secondary">Role</span>
                
                 <%-- Input tabs Container Officealoted , manager alloted, depatemnet alloted --%>
                <div class="inputtabs"> 
                     <div class="box">
                        <asp:DropDownList Class="form-control" ID="DropDownList2" runat="server">
                            <asp:ListItem Text="Office Alloted" Value="Office Alloted" />
                            <asp:ListItem Text="Headquaters" Value="Headquaters" />
                            <asp:ListItem Text="Noida Complex" Value="Noida Complex" />
                            <asp:ListItem Text="Gudgao Complex" Value="Gudgao Complex" />
                            <asp:ListItem Text="Banglore Complex" Value="Banglore Complex" />
                            <asp:ListItem Text="Pune Complex" Value="Pune Complex" />
                        </asp:DropDownList>
                    </div>
                    <div class="box">
                        <asp:DropDownList Class="form-control" ID="DropDownList3" runat="server">
                            <asp:ListItem Text="Department Alloted" Value="Department Alloted" />
                            <asp:ListItem Text="Research" Value="Research" />
                            <asp:ListItem Text="Development" Value="Development" />
                            <asp:ListItem Text="Devops" Value="Devops" />
                            <asp:ListItem Text="Software Engieer" Value="Software Engineer" />
                            <asp:ListItem Text="Front End Developer" Value="Front End Developer" />
                            <asp:ListItem Text="Back End Developer" Value="Back End Developer" />
                            <asp:ListItem Text="App Developer" Value="App Developer" />
                        </asp:DropDownList>
                    </div>
                    <div class="box">
                        <asp:DropDownList Class="form-control" ID="DropDownList4" runat="server">
                            <asp:ListItem Text="Manager Alloted" Value="Manager Alloted" />
                            <asp:ListItem Text="Manager1" Value="Manager1" />
                            <asp:ListItem Text="Manager2" Value="Manager2" />
                            <asp:ListItem Text="Manager3" Value="Manager3" />
                            <asp:ListItem Text="Manager4" Value="Manager4" />
                            <asp:ListItem Text="Manager5" Value="Manager5" />
                            <asp:ListItem Text="Manager6" Value="Manager6" />
                            <asp:ListItem Text="Manager7" Value="Manager7" />
                            <asp:ListItem Text="Manager8" Value="Manager8" />
                            <asp:ListItem Text="ManagerHead" Value="ManagerHead" />

                        </asp:DropDownList>
                    </div>
                </div>


                <%-- Badge --%>
                <span class="badge text-bg-secondary">Login Credentials</span>

                <%-- Input tabs employe id , create pass, eneter pass again --%>
                <div class="inputtabs" onsubmit="return validate()"> 
                    <div class="box">
                        <asp:TextBox CssClass="form-control" placeholder="Employe Id" ID="TextBox10" runat="server" ></asp:TextBox>
                        
                    </div>
                    <div class="box">
                        <asp:TextBox CssClass="form-control" placeholder="Create Password" ID="TextBox11" runat="server" TextMode="Password"  ></asp:TextBox>
                    </div>
                    <div class="box">
                        <asp:TextBox CssClass="form-control" placeholder="Re-enter Password" ID="TextBox12" runat="server" TextMode="Password" onkeyup="check(this)"></asp:TextBox>
                        <error Id="alert"></error>
                    </div>
                </div>


                <br />


                <%-- Button --%>

                <div class="d-grid gap-2 col-6 mx-auto">
                    <asp:Button class="btn hey btn-outline-danger" ID="Button1" runat="server" Text="Sign UP" OnClick="Button1_Click"  />
                </div>
                


            </div>


        </div>


    </div>

</asp:Content>
