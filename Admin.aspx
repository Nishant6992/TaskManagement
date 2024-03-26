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
        <!-- Modal -->
        <div class="modal fade" id="forwardTaskModal" tabindex="-1" aria-labelledby="forwardTaskModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="forwardTaskModalLabel">Forward Task</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="ddlProject">Select Project:</label>
                            <asp:DropDownList ID="ddlProject" runat="server" CssClass="form-control" AutoPostBack="false" OnSelectedIndexChanged="ddlProject_SelectedIndexChanged" placeholder="Choose Project">
                                <asp:ListItem Text="Choose Project" Value="" />
                            </asp:DropDownList>
                        </div>

                        <div class="form-group">
                            <%--<asp:CheckBox ID="chkAddTask" runat="server" Text="Do you want to add Task?" OnClientClick="showOrHideTaskFields()" />--%>
                            <asp:CheckBox ID="chkAddTask" runat="server" Text="Do you want to add Task?" />
                        </div>
                        <div id="taskFields" style="display: none;">
                            <div class="form-group">
                                <asp:Label for="txtTaskName" runat="server">Task Name:</asp:Label>
                                <asp:TextBox ID="txtTaskName" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="ddlTaskPriority">Task Priority:</label>
                                <asp:DropDownList ID="ddlTaskPriority" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Select Priority" Value="" />
                                    <asp:ListItem Text="Low" Value="Low" />
                                    <asp:ListItem Text="Medium" Value="Medium" />
                                    <asp:ListItem Text="High" Value="High" />
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label for="txtTaskStartDate">Task Start Date:</label>
                                <asp:TextBox ID="txtTaskStartDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="txtTaskEndDate">Task End Date:</label>
                                <asp:TextBox ID="txtTaskEndDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="txtTaskDescription">Task Description:</label>
                                <textarea id="txtTaskDescription" class="form-control" rows="3"></textarea>
                            </div>

                        </div>

                        <div class="form-group">
                            <label for="ddlEmployee">Select Employee:</label>
                            <asp:DropDownList ID="ddlEmployee" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlEmployee_SelectedIndexChanged">
                                <asp:ListItem Text="Choose Employee" Value="" />
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="txtComments">Comments:</label>
                            <textarea class="form-control" id="txtComments" rows="3" placeholder="Enter comments" runat="server"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="fileUpload">Upload File:</label>
                            <asp:FileUpload ID="fileUpload" runat="server" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="btnForwardTask" onclick="forwardbutton();">Forward Task</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <footer class="footer fixed-bottom bg-dark text-white text-center py-3" style="margin-top: 3000px">
            Project:
            <asp:Label ID="lblProjectName" runat="server" ClientIDMode="Static"></asp:Label>
            <asp:Button ID="btnForward" runat="server" Text="Forward" CssClass="btn btn-primary ml-2" OnClick="btnForward_Click" OnClientClick="openForwardTaskModal(); return false;" />
            <asp:Button ID="btnAttachment" runat="server" Text="Attachment" CssClass="btn btn-secondary" OnClick="btnAttachment_Click" />
        </footer>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

       <script>

           $("#chkAddTask").click(function () {



               debugger;
               var taskFields = document.getElementById('taskFields');
               var priorityFields = document.getElementById('priorityFields');

               var chkAddTask = document.getElementById('<%= chkAddTask.ClientID %>');

                // Toggle the display of additional fields based on the checkbox state
                if (chkAddTask.checked) {
                    taskFields.style.display = 'block';
                    priorityFields.style.display = 'block';
                } else {
                    taskFields.style.display = 'none';
                    priorityFields.style.display = 'none';
                }
            })



           function openForwardTaskModal() {
               // Open the modal
               $('#forwardTaskModal').modal('show');
           }

           function forwardbutton() {
               if ($('#txtEmployeeID').val()=='') {
                   alert("Fields are missing");
                   return false;
               }

               $('#forwardTaskModal').modal('hide');
           }


           $(document).ready(function () {

               $('#btnForwardTask').click(function () {
                   var employeeID = $('#txtEmployeeID').val();
                   var comments = $('#txtComments').val();


                   $.ajax({
                       type: "POST",
                       url: "Admin.aspx/ForwardTask", // Update the URL according to your setup
                       data: JSON.stringify({ employeeID: employeeID, comments: comments }),
                       contentType: "application/json; charset=utf-8",
                       dataType: "json",
                       success: function (response) {
                           // Handle success response
                           alert("Task forwarded successfully.");
                           $('#forwardTaskModal').modal('hide');
                       },
                       error: function (xhr, textStatus, errorThrown) {
                           // Handle error response
                           console.error("Error: " + textStatus);
                       }
                   });
               });
           });
       </script>



    </form>
</body>
</html>
