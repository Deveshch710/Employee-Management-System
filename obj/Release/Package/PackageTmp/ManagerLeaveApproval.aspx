<%@ Page Title="" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="ManagerLeaveApproval.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<%-- Head Content --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- Linking Css File --%>
    <link href="ManagerLeaveApprovalStylee.css" rel="stylesheet" />
</asp:Content>

<%-- Main Content --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%-- Main Container--%>
    <div class="container">

        <%-- Main Heading --%>
        <div class="BigHeading">
            <h1>LeavesApproval</h1>
        </div>

            <%-- Leave Applying Container --%>
            <div class="upper">

                <%-- Sub Heading --%>
                <div class="BigHeading">
                    <h3>Leave User Application</h3>
                </div>


                <%-- Conatiner Conatine LeaveType,starringdate,endingdate --%>
                <div class="inputtag">

                     <%-- Leave Type --%>
                     <div class="leavetype">
                         <label>LeaveType:</label>
                         <asp:TextBox CssClass="form-control" placeholder="Leave Type" ID="TextBox6" runat="server" TextMode="SingleLine"  Enabled="False" ReadOnly="True"></asp:TextBox>
                     </div>
                
                    <%-- Startingdate --%>
                     <div class="startdate">
                         <label>StatingDate:</label>
                         <asp:TextBox CssClass="form-control" placeholder="Date of Birth" ID="TextBox1" runat="server" TextMode="SingleLine" Enabled="False" ReadOnly="True"></asp:TextBox>
                     </div>
                
                    <%-- enddate --%>
                     <div class="enddate">
                         <label>EndingDate:</label>
                         <asp:TextBox CssClass="form-control" placeholder="Date of Birth" ID="TextBox2" runat="server" TextMode="SingleLine" Enabled="False" ></asp:TextBox>
                     </div>


                </div>
            
                <%--Reason Duration --%>
                <div class="inputtag">
                
                    <%-- Startingdate --%>
                     <div class="startdate">
                         <label>Reason:</label>
                         <asp:TextBox placeholder="Reason For Leave" CssClass="form-control form-control-lg" ID="TextBox3" runat="server" Enabled="False" TextMode="SingleLine" ReadOnly="True"></asp:TextBox>
                     </div>
                
                    <%-- enddate --%>
                     <div class="enddate">
                         <label>EmployeId:</label>
                         <asp:TextBox placeholder="Employe Id" CssClass="form-control" TextMode="SingleLine" ID="TextBox4" Enabled="False" runat="server" ReadOnly="True"></asp:TextBox>
                     </div>
                
                    <div class="enddate">
                         <label>LeaveId:</label>
                         <asp:TextBox placeholder="Leave Id" TextMode="SingleLine" CssClass="form-control" ID="TextBox5" runat="server" ></asp:TextBox>
                        <asp:Button ID="Button3" class="btn btn-dark " runat="server" Text="Go" OnClick="Button3_Click"/>
                     </div>


                </div>


                <%-- Button --%>
                <div class="buttonapply">
                    <%-- reject --%>
                    <asp:Button Class="d-grid gap-2 col-2 mx-auto btn btn-outline-danger" ID="Button2" runat="server" Text="Reject" OnClick="Button2_Click"/>
                    <%-- approve --%>
                    <asp:Button Class="d-grid gap-2 col-2 mx-auto btn btn-outline-success" ID="Button1" runat="server" Text="Approve" OnClick="Button1_Click"/>
                    
                </div>


            </div>
        
            <%-- Appled Leave Container --%>
            <div class="lower">

                <%-- Sub Heading --%>
                <div class="BigHeading">
                    <h3>Applied Leaves</h3>
                </div>

                <div class="tablee">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectdatabaseConnectionString %>" SelectCommand="SELECT * FROM [LeaveAppliedByUser]"></asp:SqlDataSource>
                    <asp:GridView class="table table-bordered table-hover" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="LeaveId" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="EmployId" HeaderText="EmployId" SortExpression="EmployId" />
                            <asp:BoundField DataField="LeaveType" HeaderText="LeaveType" SortExpression="LeaveType" />
                            <asp:BoundField DataField="LeaveId" HeaderText="LeaveId" ReadOnly="True" SortExpression="LeaveId" />
                            <asp:BoundField DataField="LeaveStatus" HeaderText="LeaveStatus" SortExpression="LeaveStatus" />
                        </Columns>
                    </asp:GridView>
                    hey
                </div>

           </div>

    </div>

</asp:Content>
