<%@ Page Title="" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="ManagerTaskAssigend.aspx.cs" Inherits="WebApplication1.WebForm10" %>

<%-- Head Content--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="ManagerTaskAssigendStylee.css" rel="stylesheet" />
</asp:Content>

<%-- Main Content--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

        <%-- Main Heading --%>
        <div class="BigHeading">
            <h1>TaskAssigend</h1>
        </div>

        <div class="subconatiner">
        <%-- Daily Mission --%>
        <div class="daily">

             <%-- Sub Heading --%>
            <div class="smalheading">
                <h3>YourTask</h3>
                <%-- Table Containing Information --%>
                <div class="para">
                   <p>*Put TaskId to get details Of task. </p>
                   <p>*If completed click <label class="comp1">Completed</label> If working on it click <label class="work1"> Working</label> </p>
                </div>
            </div>

            <%-- task Information --%>
            <div class="data">

                 <%-- taskid search --%>
                <div class="box2">
                    <div class="TaskIdd">
                        <label>TaskId:</label>
                        <asp:TextBox CssClass="form-control" placeholder="TaskId" ID="TextBox2" runat="server"></asp:TextBox>
                        <asp:Button ID="Button4" class="btn btn-dark " runat="server" Text="Go" OnClick="Button4_Click" />
                    </div>
                </div>
                
                 <%-- Mnagername,id,task,deadline --%>
                <div class="box2">

                            
                            
                            <%-- task --%>
                            <div class="taskdis">
                                <label>TaskDisription:</label>
                                <asp:TextBox CssClass="form-control" placeholder="Enter Your Task Details Here" ID="TextBox16" runat="server" Enabled="False" ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
                            </div>

                            
                            <%-- Deadline --%>
                            <div class="dead">
                                     <label>DeadLine:</label>
                                     <asp:TextBox CssClass="form-control" placeholder="DeadLine" ID="TextBox17" runat="server" TextMode="SingleLine" Enabled="False" ReadOnly="True"></asp:TextBox>
                             </div>

                            

                        </div>             
            </div>

            <%-- Buttons --%>
                <div class="buttonthree">               
                        <asp:Button ID="Button1" class="btn btn-outline-success " runat="server" Text="Completed" OnClick="Button1_Click"  />
                        <asp:Button ID="Button2" class="btn btn-outline-warning " runat="server" Text="Working" OnClick="Button2_Click" />
                </div>

        </div>


        <%-- Weekly Mission --%>
        <div class="tableview">

            <%-- Sub Heading --%>
            <div class="smalheading">
                <h3>TaskTable</h3>
            </div>

            <%-- Table Containing Information --%>
            <div class="tabletable">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectdatabaseConnectionString %>" SelectCommand="SELECT * FROM [TaskAssigendToManagerByManager]"></asp:SqlDataSource>
                <asp:GridView class="table table-bordered table-group-divider table-hover" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TaskId" DataSourceID="SqlDataSource1">
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
