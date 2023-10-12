<%@ Page Title="" Language="C#" MasterPageFile="~/MasterHLS.Master" AutoEventWireup="true" CodeBehind="ManagerLogin.aspx.cs" Inherits="WebApplication1.ManagerLogin" %>


<%-- Head Content --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- Css Linking of user page --%>
    <link href="ManagerLoginnStyle.css" rel="stylesheet" />
</asp:Content>

<%-- Main Content --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%-- Main Container --%>
    <div class="container">

        


        <%-- Login Info Container --%>
        <div class="left">
                            <h1>Manager</h1>

                <div class="box">
                    <asp:TextBox CssClass="form-control" placeholder="ManagerId" ID="TextBox1" runat="server" ></asp:TextBox>
                </div>

                <div class="box">
                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                </div>

                <div>
                    <asp:Button ID="Button1" class="btn hey btn-outline-danger" runat="server" Text="Log In" OnClick="Button1_Click"  />
                </div>
        </div>

        <%-- Image Container --%>
                <div class="right">
                    <video autoplay muted loop src="Images/login.mp4"/>
                </div>


    </div>


</asp:Content>
