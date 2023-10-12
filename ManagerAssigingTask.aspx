<%@ Page Title="" Language="C#" MasterPageFile="~/MasterManager.Master" AutoEventWireup="true" CodeBehind="ManagerAssigingTask.aspx.cs" Inherits="WebApplication1.ManagerAssigingTask" %>

<%-- Head Content --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- Linking Css --%>
    <link href="ManagerAssigningTaskStylee.css" rel="stylesheet" />

</asp:Content>

<%-- Main Content --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <%-- Main Container --%>
    <div class="maincontainer">
        
        <%-- Main Heading --%>
        <div class="BigHeading">
            <h1>Assign Task</h1>
        </div>

        <%-- Sub container --%>
        <div class="container">

            <%-- Left Container --%>
            <div class="left">

                <%-- Heading and Image Container --%>
                <div class="Text">

                   <%-- Image Container --%>
                    <div class="image1">
                        <img src="Images/TaskAssignImage.png" />
                    </div>

                     <%-- Heading Container --%>
                    <div class="subheading">
                        <h3>Assign Task To User</h3>
                    </div>
                
                 </div>


                <%-- Input tab --%>
                <div class="inputabs">

                     <%-- label --%>
                    <span class="badge text-bg-secondary">Employe Details</span>

                        <%-- Empid name department --%>
                        <div class="box">

                                <div class="empid">
                                    <label>EmployeId:</label>
                                    <asp:TextBox CssClass="form-control" placeholder="Id" ID="TextBox15" runat="server" ></asp:TextBox>
                                    <asp:Button ID="Button4" class="btn btn-dark " runat="server" Text="Go" OnClick="Button4_Click"  />
                                </div>

                                <div class="empid">
                                    <label>EmployeName:</label>
                                    <asp:TextBox CssClass="form-control" placeholder="Id" ID="TextBox2" runat="server" Enabled="False" ReadOnly="True"></asp:TextBox>
                                    
                                </div>

                                <div class="empid">
                                    <label>EmployeDepartment:</label>
                                    <asp:TextBox CssClass="form-control" placeholder="Id" ID="TextBox3" runat="server" Enabled="False" ReadOnly="True" ></asp:TextBox>
                                </div>
                            
                                                      
                                <div class="empname">
                                     <label>ManagerName</label>
                                     <asp:TextBox CssClass="form-control" placeholder="Name" ID="TextBox18" runat="server"></asp:TextBox>
                                 </div>
                        
                                <div class="empdepart">
                                    <label>ManagerId:</label>
                                    <asp:TextBox CssClass="form-control" placeholder="Name" ID="TextBox19" runat="server" ></asp:TextBox>
                                 </div>

                        </div>

                    <br />

                     <%-- label --%>
                    <span class="badge text-bg-secondary">Task</span>

                        <%-- Taskdiscription --%>
                        <div class="box2">

                            <div class="TaskId">
                                     <label>TaskId:</label>
                                     <asp:TextBox CssClass="form-control" placeholder="TaskId" ID="TextBox1" runat="server"  Enabled="True"></asp:TextBox>
                                 </div>
                            
                            <%-- task --%>
                            <div class="taskdis">
                                <label>TaskDisription:</label>
                                <asp:TextBox CssClass="form-control" placeholder="Enter Your Task Details Here" ID="TextBox16" runat="server" TextMode="MultiLine"></asp:TextBox>
                                
                            </div>

                            <%-- Upload File Option --%>
                            <div class="upfile">
                                <label>UploadFile:</label>
                                <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" placeholder="Upload file here" />
                                <asp:Button ID="Button5" class="btn btn-dark " runat="server" Text="Upload" OnClick="Button5_Click" />
                            </div>

                            <%-- Deadline --%>
                            <div class="dead">
                                     <label>DeadLine:</label>
                                     <asp:TextBox CssClass="form-control" placeholder="Enter Your Task Details Here" ID="TextBox17" runat="server" TextMode="Date"></asp:TextBox>
                             </div>

                            

                        </div>             

                   </div>


                <%-- Buttons --%>
                <div class="buttonthree">
                                        
                        <asp:Button ID="Button1" class="btn btn-outline-success " runat="server" Text="Add" OnClick="Button1_Click" />
                    
                        <asp:Button ID="Button2" class="btn btn-outline-warning " runat="server" Text="Update" OnClick="Button2_Click"  />
                    
                        <asp:Button ID="Button3" class="btn btn-outline-danger " runat="server" Text="Delete" OnClick="Button3_Click"  />

                </div>

             </div>





            <%-- Right Container --%>
            <div class="right">

                <%-- Heading  --%>
                <div class="Text">

                     <%-- Heading Container --%>
                    <div class="subheading">
                        <h3>Task Assign To Users</h3>
                    </div>
                
                 </div>


                 <%-- Task assign by Them --%>
                <div class="TaskAssignTo">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectdatabaseConnectionString %>"  SelectCommand="SELECT * FROM [TaskAssigendByManager]"></asp:SqlDataSource>
                    <div class="call">
                        <asp:GridView class="table table-bordered table-hover" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TaskId" DataSourceID="SqlDataSource1">
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






        </div>
   </div>

</asp:Content>
