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


        <!-- Modal for Forwarding Task -->
        <div class="modal fade" id="forwardTaskModal" tabindex="-1" role="dialog" aria-labelledby="forwardTaskModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="forwardTaskModalLabel">Forward Task</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Select an employee to forward the task:</p>
                        <asp:DropDownList ID="ddlEmployees" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class ="modal-body">
                        <p>Enter the Task Name</p>
                        <asp:TextBox ID="txttaskname" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                     <div class ="modal-body">
                        <p>Enter Task Comments</p>
                        <asp:TextBox ID="txtcomment" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="modal-footer">
                        <asp:Button ID="Forward" runat="server" Text="Forward Task" CssClass="btn btn-primary" OnClick="Forward_Click" />
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <asp:HiddenField ID="hidTaskID" runat="server" />

    </form>
</body>
</html>
