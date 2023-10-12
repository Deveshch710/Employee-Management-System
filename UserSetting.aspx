<%@ Page Title="" Language="C#" MasterPageFile="~/MasterUser.Master" AutoEventWireup="true" CodeBehind="UserSetting.aspx.cs" Inherits="WebApplication1.WebForm4" %>

<%-- Head Container --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="UserSettingStyle.css" rel="stylesheet" />
</asp:Content>

<%-- Main Container --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="conatiner">
        <div class="content">
            <%-- Main Heading --%>
            <div class="BigHeading">
                <h1>Setting</h1>
            </div>

             <div class="inputtabs" > 
                    <div class="box">
                        <label>EmployeId:</label>
                        <asp:TextBox CssClass="form-control" placeholder="Employe Id" ID="TextBox10" runat="server"  Enabled="False"></asp:TextBox>
                        
                    </div>
                    <div class="box">
                        <label>Old Password</label>
                        <asp:TextBox CssClass="form-control" placeholder="Create Password" ID="TextBox11" runat="server" TextMode="Password"  ></asp:TextBox>
                    </div>
                    <div class="box">
                        <label>New Password</label>
                        <asp:TextBox CssClass="form-control" placeholder="Re-enter Password" ID="TextBox12" runat="server" TextMode="Password" ></asp:TextBox>
                        <error Id="alert"></error>
                    </div>
                </div>

        </div>


        <div class="Buttons">
            <asp:Button ID="Button1" CssClass="btn btn-outline-success btn-lg gap-2 col-6" runat="server" Text="Update" />
            <asp:Button ID="Button2" CssClass="btn btn-outline-secondary btn-sm" runat="server" Text="LogOut" />
        </div>
    </div>


</asp:Content>
