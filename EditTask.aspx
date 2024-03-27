<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditTask.aspx.cs" Inherits="TaskManagement.EditTask" %>
 <!DOCTYPE html>
 <html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Task</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Edit Task</h2>
            <hr />
             <div class="form-group">
                <asp:Label ID="lblEmployeeID" runat="server" AssociatedControlID="txtEmployeeID" Text="Employee ID:"></asp:Label>
                <asp:TextBox ID="txtEmployeeID" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
             <div class="form-group">
                <asp:Label ID="lblProjectID" runat="server" AssociatedControlID="txtProjectID" Text="Project ID:" Style="display: none;"></asp:Label>
                <asp:TextBox ID="txtProjectID" runat="server" CssClass="form-control" Style="display: none;"></asp:TextBox>
            </div>
             <div class="form-group">
                <asp:Label ID="lblProjectName" runat="server" AssociatedControlID="txtProjectName" Text="Project Name:"></asp:Label>
                <asp:TextBox ID="txtProjectName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
             <div class="form-group">
                <asp:Label ID="lblTaskID" runat="server" AssociatedControlID="txtTaskID" Text="Task ID:" Style="display: none;"></asp:Label>
                <asp:TextBox ID="txtTaskID" runat="server" CssClass="form-control" Style="display: none;"></asp:TextBox>
            </div>
             <div class="form-group">
                <asp:Label ID="lblStartDate" runat="server" AssociatedControlID="txtStartDate" Text="Start Date:"></asp:Label>
                <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>
             <div class="form-group">
                <asp:Label ID="lblDeadlineDate" runat="server" AssociatedControlID="txtDeadlineDate" Text="Deadline Date:"></asp:Label>
                <asp:TextBox ID="txtDeadlineDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>
             <div class="form-group">
                <asp:Label ID="lblPriority" runat="server" AssociatedControlID="ddlPriority" Text="Task Priority:"></asp:Label>
                <asp:DropDownList ID="ddlPriority" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Low" Value="Low"></asp:ListItem>
                    <asp:ListItem Text="Medium" Value="Medium"></asp:ListItem>
                    <asp:ListItem Text="High" Value="High"></asp:ListItem>
                </asp:DropDownList>
            </div>
             <div class="form-group">
                <asp:Label ID="lblTaskDescription" runat="server" AssociatedControlID="txtTaskDescription" Text="Task Description:"></asp:Label>
                <asp:TextBox ID="txtTaskDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
            </div>
             <br />
            <div class="form-group">
                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="btnUpdate_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClick="btnCancel_Click" />
            </div>
         </div>
    </form>
</body>
</html>
