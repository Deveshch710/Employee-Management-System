<%@ Page Title="" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="ManagerDashboard.aspx.cs" Inherits="WebApplication1.WebForm9" %>

<%-- Header Content --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- Css Conection --%>
    <link href="ManagerDashboardStylee.css" rel="stylesheet" />
</asp:Content>


<%-- Main Content --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <%-- Main container --%>
    <div class="container">

        <%-- Main Heading --%>
        <div class="BigHeading">
            <h1>Dashboard</h1>
        </div>

        <%-- Dashboard --%>
        <div class="dashboard">

            <%-- cotanier having news,charts,cards --%>
            <div class="subcontainer1">

                <%-- conatiner with cards and charts --%>
                <div class="left">

                    <%-- cards --%>
                    <div class="cards">
                        <div class="cardcard">
                            <h5>Total Task Pending</h5>
                            <div>
                                <span><asp:Label ID="lblPendingTasks" runat="server"></asp:Label></span>
                            </div>
                        </div>
                        <div class="cardcard">
                            <h5>Task Working</h5>
                            <div>
                               <span><asp:Label ID="lblWorkingTask" runat="server"></asp:Label></span>
                            </div>
                        </div>
                        <div class="cardcard">
                            <h5>Leaves</h5>
                            <div>
                                <asp:Label ID="lblTotalLeaves" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <%-- charts --%>
                    <div class="charts">

                        <div class="subheading">
                            <h3>Employe Leaves</h3>
                        </div>

                        <div class="chartchart">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectdatabaseConnectionString %>" SelectCommand="SELECT [ManagerId], [NoOfDays] FROM [LeaveAppliedByManager]"></asp:SqlDataSource>
                            <asp:Chart ID="Chart1" runat="server" Width="800px" Height="230px" DataSourceID="SqlDataSource1">
                                <Series>
                                    <asp:Series Name="Series1" ChartType="Bar" XValueMember="ManagerId" YValueMembers="NoOfDays" YValuesPerPoint="6"></asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                        </div>
                        
                       
                    </div>

                </div>

                <%-- container with news --%>
                <div class="right">
                    <%-- Subhead --%>
                    <div class="subheading">
                        <h3>NEWS</h3>
                    </div>
                    
                    <%-- news area --%>
                    <div class="newscontainer">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1767600.1176014205!2d77.98937407929321!3d30.08433347340233!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3909dcc202279c09%3A0x7c43b63689cc005!2sUttarakhand!5e0!3m2!1sen!2sin!4v1693042719486!5m2!1sen!2sin" width="500" height="800" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>

                </div>
            </div>

            <%-- container having daily task and assign task --%>
            <div class="subcontainer2">

                <div class="subheading">
                        <h3>Daily Task</h3>
                    </div>

                <div class="dailytask">
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:projectdatabaseConnectionString %>" SelectCommand="SELECT * FROM [TaskAssigendToManagerByManager]"></asp:SqlDataSource>
                    <asp:GridView class="table table-borderd table-group-divider table-hover" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TaskId" DataSourceID="SqlDataSource2">
                        <Columns>
                            <asp:BoundField DataField="TaskId" HeaderText="TaskId" ReadOnly="True" SortExpression="TaskId" />
                            <asp:BoundField DataField="TaskAssignend" HeaderText="TaskAssignend" SortExpression="TaskAssignend" />
                            <asp:BoundField DataField="DeadLine" HeaderText="DeadLine" SortExpression="DeadLine" />
                            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

        </div>


    </div>

</asp:Content>
