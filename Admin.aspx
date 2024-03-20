<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="TaskManagement.UserUI" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Task Management System</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#">Task Management System</a>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Welcome,
                                <asp:Label ID="lblUserName" runat="server" ClientIDMode="Static"></asp:Label></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Home.aspx">Home</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Actions
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                              <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="TaskList.aspx" Text="Task List" CssClass="dropdown-item" />
                                <asp:HyperLink ID="CreateTaskLink" runat="server" NavigateUrl="CreateTask.aspx" Text="Create Task" CssClass="dropdown-item" />
                                <asp:HyperLink ID="DeleteTaskLink" runat="server" NavigateUrl="DeleteTask.aspx" Text="Delete Task" CssClass="dropdown-item" />
                                <asp:HyperLink ID="CreateProjectLink" runat="server" NavigateUrl="CreateProject.aspx" Text="Create Project" CssClass="dropdown-item" />
                                <asp:HyperLink ID="DeleteProjectLink" runat="server" NavigateUrl="DeleteTask.aspx" Text="Delete Project" CssClass="dropdown-item" />
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Logout.aspx">Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container mt-5">
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Enter Employee ID</h5>
                            <asp:TextBox ID="txtEmployeeID" runat="server" CssClass="form-control" ClientIDMode="Static" placeholder="Enter the Employee Id"></asp:TextBox>
                            <asp:Button ID="btnFetchTasks" runat="server" Text="Fetch Tasks" CssClass="btn btn-primary mt-3" OnClick="btnFetchTasks_Click" />
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="row">
                        <div class="col-md-6">
                            <h3>Involved Projects</h3>
                            <asp:Repeater ID="rptProjects" runat="server">
                                <HeaderTemplate>
                                    <ul class="list-group">
                                </HeaderTemplate>

                                <ItemTemplate>
                                     <div class="card mb-3">
                                    <li class="list-group-item">
                                        
                                            <b>Project ID:</b> <%# Eval("Project_id") %><br />
                                            <b>Project Name:</b> <%# Eval("projectname") %><br />
                                            <b>Start Date:</b> <%# Eval("project_startDate") %><br />
                                            <b>End Date:</b> <%# Eval("project_endDate") %><br />
                                            <b>Description:</b> <%# Eval("project_Description") %><br />
                                         
                                    </li>
                                    </div>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </ul>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="col-md-6">
                            <h3>Individual Task List</h3>
                            <asp:Repeater ID="rptIndividualTasks" runat="server">
                                <ItemTemplate>
                                    <div class="card mb-3">
                                        <div class="card-body">
                                            <h5 class="card-title">Task ID: <%# Eval("TaskID") %></h5>
                                            <p class="card-text">Task Priority: <span style="color: <%# GetPriorityColor(Eval("Task_priority")) %>;"><%# Eval("Task_priority") %></span></p>
                                            <p class="card-text">Task Description: <%# Eval("Task_Descp") %></p>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:Label ID="lblWarningMessage" runat="server" CssClass="warning" Visible="false"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer class="footer fixed-bottom bg-dark text-white text-center py-3">
            Project:
            <asp:Label ID="lblProjectName" runat="server" ClientIDMode="Static"></asp:Label>
            <asp:Button ID="btnForward" runat="server" Text="Forward" CssClass="btn btn-primary ml-2" OnClick="btnForward_Click" />
            <asp:Button ID="btnAttachment" runat="server" Text="Attachment" CssClass="btn btn-secondary" OnClick="btnAttachment_Click" />
        </footer>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </form>
</body>
</html>
