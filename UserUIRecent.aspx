<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserUIRecent.aspx.cs" Inherits="TaskManagement.UserUIRecent" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Dashboard</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#">Employee Dashboard</a>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Welcome, <%# Session["Name"] %></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Logout.aspx">Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container mt-5">
            <h2>Tasks</h2>
            <asp:Repeater ID="rptTasks" runat="server">
                <ItemTemplate>
                    <div class="card mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Task ID: <%# Eval("TaskID") %></h5>
                            <p class="card-text">Start Date: <%# Eval("Start_Date") %></p>
                            <p class="card-text">Deadline Date: <%# Eval("Deadline_Date") %></p>
                            <p class="card-text">Priority: <%# Eval("Task_priority") %></p>
                            <p class="card-text">Description: <%# Eval("Task_Descp") %></p>
                            <p class="card-text">Project: <%# Eval("projectname") %></p>
                            <asp:Button ID="btnForwardTask" runat="server" Text="Forward Task" CssClass="btn btn-primary" CommandName="Forward" CommandArgument='<%# Eval("TaskID") %>' OnCommand="btnForwardTask_Command" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <h2>Projects</h2>
            <asp:Repeater ID="rptProjects" runat="server">
                <ItemTemplate>
                    <div class="card mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Project ID: <%# Eval("Project_id") %></h5>
                            <p class="card-text">Project Name: <%# Eval("projectname") %></p>
                            <p class="card-text">Start Date: <%# Eval("project_startDate") %></p>
                            <p class="card-text">End Date: <%# Eval("project_endDate") %></p>
                            <p class="card-text">Description: <%# Eval("project_Description") %></p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <h2>Forwarded Tasks</h2>
            <asp:Repeater ID="rptForwardedTasks" runat="server">
                <ItemTemplate>
                    <div class="card mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Forward Task ID: <%# Eval("ID") %></h5>
                            <p class="card-text">Task Name: <%# Eval("ForwardTaskName") %></p>
                            <p class="card-text">Priority: <%# Eval("ForwardTaskPriority") %></p>
                            <p class="card-text">Task Date: <%# Eval("ForwardTaskDate") %></p>
                            <p class="card-text">Deadline Date: <%# Eval("ForwardTaskDeadlineDate") %></p>
                            <p class="card-text">Description: <%# Eval("ForwardTaskDescription") %></p>
                            <p class="card-text">Comments: <%# Eval("Comments") %></p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
