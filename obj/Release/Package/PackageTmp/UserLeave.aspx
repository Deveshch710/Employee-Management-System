<%@ Page Title="" Language="C#" MasterPageFile="~/MasterUser.Master" AutoEventWireup="true" CodeBehind="UserLeave.aspx.cs" Inherits="WebApplication1.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="UserLeavesStylee.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <%-- Main Container--%>
    <div class="container">

        <%-- Main Heading --%>
        <div class="BigHeading">
            <h1>Leaves</h1>
        </div>

        <%-- Leave Applying Container --%>
        <div class="upper">

            <%-- Sub Heading --%>
            <div class="BigHeading">
                <h3>Leave Application</h3>
            </div>


            <%-- Conatiner Conatine LeaveType,starringdate,endingdate --%>
            <div class="inputtag">

                 <%-- Leave Type --%>
                 <div class="leavetype">
                     <label>LeaveType:</label>
                     <asp:DropDownList Class="form-select" ID="DropDownList1" runat="server">
                         <asp:ListItem Text="--Type--" Value="--Type--" />
                         <asp:ListItem Text="Sick Leave" Value="Sick Leave" />
                         <asp:ListItem Text="Vacation" Value="Vacation" />
                         <asp:ListItem Text="Casual" Value="Casual" />
                     </asp:DropDownList>
                 </div>
                
                <%-- Startingdate --%>
                 <div class="startdate">
                     <label>StatingDate:</label>
                     <asp:TextBox Class="form-select" placeholder="Date of Birth" ID="TextBox1" runat="server" TextMode="Date" ></asp:TextBox>
                 </div>
                
                <%-- enddate --%>
                 <div class="enddate">
                     <label>EndingDate:</label>
                     <asp:TextBox Class="form-select" placeholder="Date of Birth" ID="TextBox2" runat="server" TextMode="Date" ></asp:TextBox>
                 </div>

                <%-- enddate --%>
                 <div class="enddate">
                     <label>NoOfDays:</label>
                     <asp:TextBox Class="form-control" placeholder="Date of Birth" ID="TextBox8" runat="server" ></asp:TextBox>
                 </div>


            </div>
            
            <%--Reason Duration --%>
            <div class="inputtag">
                
                <%-- Startingdate --%>
                 <div class="startdate">
                     <label>Reason:</label>
                     <asp:TextBox placeholder="Reason For Leave" CssClass="form-control form-control-lg" ID="TextBox3" runat="server" TextMode="MultiLine"></asp:TextBox>
                 </div>
                
                <%-- enddate --%>
                 <div class="enddate">
                     <label>EmployeId:</label>
                     <asp:TextBox placeholder="Employe Id" CssClass="form-control" ID="TextBox4" runat="server"></asp:TextBox>
                 </div>

                <%-- Leave Id --%>
                <div class="enddate">
                     <label>LeaveId:</label>
                     <asp:TextBox placeholder="Leave Id" CssClass="form-control" ID="TextBox5" runat="server"></asp:TextBox>
                 </div>


            </div>


            <%-- Button --%>
            <div class="buttonapply">
                <asp:Button Class="d-grid gap-2 col-4 mx-auto btn btn-outline-primary" ID="Button1" runat="server" Text="Apply" OnClick="Button1_Click"  />
            </div>


        </div>

        <%-- cheacking status --%>
        <div class="upper">

            <%-- Sub Heading --%>
            <div class="BigHeading">
                <h3>Leave Application Status</h3>
            </div>
                                    
            <%--Cheacking Duration parameters --%>
            <div class="inputtag2">

                <%-- Leave Id --%>
                <div class="enddate">
                     <label>LeaveId:</label>
                     <asp:TextBox placeholder="Leave Id" CssClass="form-control" ID="TextBox10" runat="server"></asp:TextBox>
                    <asp:Button ID="Button4" class="btn btn-dark " runat="server" Text="Go" OnClick="Button4_Click"/>
                 </div>

                
                <%-- Employe Id --%>
                 <div class="enddate">
                     <label>EmployeId:</label>
                     <asp:TextBox placeholder="Employe Id" CssClass="form-control" ID="TextBox6" runat="server" ReadOnly="True" Enabled="False"></asp:TextBox>
                 </div>
              
                              
                 <div class="enddate">
                     <label>LeaveStatus:</label>
                     <asp:TextBox placeholder="Leave Id" CssClass="form-control" ID="TextBox7" runat="server" ReadOnly="True" Enabled="False"></asp:TextBox>
                 </div>

            </div>

         </div>
                   
        <%-- Appled Leave Table Container --%>
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
                        <asp:BoundField DataField="StartingDate" HeaderText="StartingDate" SortExpression="StartingDate" />
                        <asp:BoundField DataField="EndingDate" HeaderText="EndingDate" SortExpression="EndingDate" />
                        <asp:BoundField DataField="Reason" HeaderText="Reason" SortExpression="Reason" />
                        <asp:BoundField DataField="LeaveStatus" HeaderText="LeaveStatus" SortExpression="LeaveStatus" />
                        <asp:BoundField DataField="LeaveId" HeaderText="LeaveId" ReadOnly="True" SortExpression="LeaveId" />
                    </Columns>
                </asp:GridView>
            </div>


        </div>

    </div>
</asp:Content>
