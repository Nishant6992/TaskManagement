<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectList.aspx.cs" Inherits="TaskManagement.ProjectList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project List</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Project List</h2>
            <hr />

            <asp:Repeater ID="rptProjects" runat="server">
                <ItemTemplate>
                    <div class="card mb-3">
                        <div class="card-header">
                            <h5 class="card-title"><%# Eval("projectname") %></h5>
                        </div>
                        <div class="card-body">
                            <p><strong>Start Date:</strong> <%# Eval("project_startDate", "{0:MM/dd/yyyy}") %></p>
                            <p><strong>End Date:</strong> <%# Eval("project_endDate", "{0:MM/dd/yyyy}") %></p>
                            <p><strong>Description:</strong> <%# Eval("project_Description") %></p>
                            <p><strong>Employee ID:</strong> <%# Eval("Employee_id") %></p>
                        </div>
                        <div class="card-footer">
                            <asp:Button ID="btnEdit" runat="server" CommandName="Edit" CommandArgument='<%# Eval("Project_id") %>' Text="Edit" CssClass="btn btn-primary mr-2" OnClick="btnEdit_Click" />
                            <asp:Button ID="btnDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("Project_id") %>' Text="Delete" CssClass="btn btn-danger" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
