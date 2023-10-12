<%@ Page Title="" Language="C#" MasterPageFile="~/MasterHLS.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="WebApplication1.UserLogin" %>


<%-- Head Content --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- Css Linking of user page --%>
    <link href="UserLoginn.css" rel="stylesheet" />
    
</asp:Content>

<%-- Main Content --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%-- Main Container --%>
    <div class="container">

        <%-- Image Container --%>
        <div class="col1">
            <video autoplay muted loop src="Images/login.mp4"/>
        </div>


        <%-- Login Info Container --%>
        <div class="right">
                            <h1>LOG IN</h1>

                <div class="box">
                    <asp:TextBox CssClass="form-control" placeholder="Employe ID" ID="TextBox1" runat="server"></asp:TextBox>

                </div>

                <div class="box">
                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                </div>

                <div>
                    <asp:Button ID="Button1" class="btn hey btn-outline-danger" runat="server" Text="Log In" OnClick="Button1_Click" />
                </div>
        </div>



    </div>


</asp:Content>
