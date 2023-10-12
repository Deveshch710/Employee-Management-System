<%@ Page Title="" Language="C#" MasterPageFile="~/MasterUser.Master" AutoEventWireup="true" CodeBehind="UserDashboard.aspx.cs" Inherits="WebApplication1.WebForm8" %>

<%-- Header Content --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- Linking Css --%>
    <link href="UserDashboardstyle.css" rel="stylesheet" />
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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectdatabaseConnectionString %>" SelectCommand="SELECT [NoOfDays], [EmployId] FROM [LeaveAppliedByUser]"></asp:SqlDataSource>
                            <asp:Chart ID="Chart1" runat="server" Width="800px" Height="230px" DataSourceID="SqlDataSource1">
                                <Series>
                                    <asp:Series Name="Series1" ChartType="Bar" XValueMember="EmployId" YValueMembers="NoOfDays" YValuesPerPoint="6"></asp:Series>
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
                        <h3>Video</h3>
                    </div>
                    
                    <%-- news area --%>
                    <div class="newscontainer">
<iframe width="560" height="315" src="https://www.youtube.com/embed/Jsf4-h4e4Bw?si=6-oQd8qE-XBz-FXs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen="True"></iframe>

                    </div>

                </div>
                </div>
         </div>
            

            <%-- container having daily task and assign task --%>
            <div class="subcontainer2">

                <div class="subheading">
                        <h3>Task</h3>
                    </div>

                <div class="dailytask">
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:projectdatabaseConnectionString %>" SelectCommand="SELECT * FROM [TaskAssigendByManager]"></asp:SqlDataSource>
                    <asp:GridView class="table table-borderd table-group-divider table-hover" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TaskId" DataSourceID="SqlDataSource2" >
                        <Columns>
                            <asp:BoundField DataField="TaskId" HeaderText="TaskId" ReadOnly="True" SortExpression="TaskId" />
                            <asp:BoundField DataField="EmployeId" HeaderText="EmployeId" SortExpression="EmployeId" />
                            <asp:BoundField DataField="TaskAssigend" HeaderText="TaskAssigend" SortExpression="TaskAssigend" />
                            <asp:BoundField DataField="DeadLine" HeaderText="DeadLine" SortExpression="DeadLine" />
                            <asp:BoundField DataField="ManagerName" HeaderText="ManagerName" SortExpression="ManagerName" />
                            <asp:BoundField DataField="ManagerId" HeaderText="ManagerId" SortExpression="ManagerId" />
                            <asp:BoundField DataField="TaskStatus" HeaderText="TaskStatus" SortExpression="TaskStatus" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
      </div>

</asp:Content>
