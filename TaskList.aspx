﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskList.aspx.cs" Inherits="TaskManagement.TaskList" %>
 <!DOCTYPE html>
 <html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Task List</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .task-box {
            border: 1px solid #ced4da;
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 20px;
        }
         .task-buttons {
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Task List</h2>
            <hr />
             <div class="row">
                <asp:Repeater ID="rptTasks" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4">
                            <div class="task-box">
                                <div>
                                    <strong>Task ID:</strong> <%# Eval("TaskID") %>
                                </div>
                                <div>
                                    <strong>Employee ID:</strong> <%# Eval("EmployeeID") %>
                                </div>
                                <div>
                                    <strong>Start Date:</strong> <%# Eval("Start_Date", "{0:d}") %>
                                </div>
                                <div>
                                    <strong>Deadline Date:</strong> <%# Eval("Deadline_Date", "{0:d}") %>
                                </div>
                                <div>
                                    <strong>Priority:</strong> <%# Eval("Task_priority") %>
                                </div>
                                <div>
                                    <strong>Description:</strong> <%# Eval("Task_Descp") %>
                                </div>
                                <div>
                                    <strong>Project ID:</strong> <%# Eval("Project_id") %>
                                </div>
                                <div>
                                    <strong>Project Name:</strong> <%#  Eval("projectname") %>
                                </div>
                                <div class="task-buttons" style="margin-top: 12px; text-align: center;">
                                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-primary btn-sm" CommandName="Edit" CommandArgument='<%# Eval("TaskID") %>' OnClick="btnEdit_Click" />
                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger btn-sm" CommandName="Delete" CommandArgument='<%# Eval("TaskID") %>' OnClick="btnDelete_Click" />
                                    <asp:Button ID="btnComment" runat="server" Text="Comment" CssClass="btn btn-info btn-sm" CommandName="Comment" CommandArgument='<%#Eval("TaskID") + ";" +Eval("EmployeeID") + ";" +  Eval("Start_Date", "{0:d}") + ";" + Eval("Deadline_Date", "{0:d}")+ ";" + Eval("Task_priority")+ ";" + Eval("Task_Descp") + ";" + Eval("Project_id") + ";" + Eval("projectname") %>' OnClientClick="openForwardTaskModal(); return true;" OnClick="btnComment_Click" />
                                 </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
         <div class="modal fade" id="commentTaskModel" tabindex="-1" aria-labelledby="commentTaskModel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="commentTaskModelLabel">Comment</h5>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <asp:Label runat="server" Text="Task Id"></asp:Label>
                            <asp:TextBox ID="txttaskid" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" Text="Employee Id"></asp:Label>
                            <asp:TextBox ID="txtempid" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" Text="Start Date"></asp:Label>
                            <asp:TextBox ID="txtstartdate" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" Text="Deadline Date"></asp:Label>
                            <asp:TextBox ID="txtdeadlinedate" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" Text="Task Priority"></asp:Label>
                            <asp:TextBox ID="txtprior" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" Text="Task Description"></asp:Label>
                            <asp:TextBox ID="txtdecsp" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" Text="Project Id"></asp:Label>
                            <asp:TextBox ID="txtprojectid" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" Text="Project Name"></asp:Label>
                            <asp:TextBox ID="txtprojname" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" Text="Comments:"></asp:Label>
                            <asp:TextBox ID="txtcomment" runat="server" CssClass="form-control" TextMode="MultiLine" Text="Add Comments"></asp:TextBox>
                        </div>
                        <div class="modal-footer">
                            <asp:Button OnClick="comment_Click" Text="Comment" ID="comment" CssClass="btn btn-success" runat="server" />
                            <asp:Button runat="server" class="btn btn-secondary" data-dismiss="modal" Text="Close"></asp:Button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script>
        function openForwardTaskModal() {
            // Open the modal
            $('#commentTaskModel').modal('show');
        }
    </script>
    t>
     <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
