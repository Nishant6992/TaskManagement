<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProject.aspx.cs" Inherits="TaskManagement.EditProject" %>
 <!DOCTYPE html>
 <html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Project</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Edit Project</h2>
            <hr />
          <%--   <div class="form-group">
                <asp:Label ID="lblProjectID" runat="server" AssociatedControlID="txtProjectID" Text="Project ID:"></asp:Label>
                <asp:TextBox ID="txtProjectID" runat="server" CssClass="form-control"></asp:TextBox>
            </div>--%>
              <%--<div class="form-group">
                <asp:Label ID="lblTaskID" runat="server" AssociatedControlID="txtTaskID" Text="Task ID:"></asp:Label>
                <asp:TextBox ID="txtTaskID" runat="server" CssClass="form-control"></asp:TextBox>
            </div>--%>
             <div class="form-group">
                <label for="txtProjectName">Project Name:</label>
                <asp:TextBox ID="txtProjectName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
             <div class="form-group">
                <label for="txtStartDate">Start Date:</label>
                <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>
             <div class="form-group">
                <label for="txtEndDate">End Date:</label>
                <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>
             <div class="form-group">
                <label for="txtDescription">Description:</label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
            </div>
               <div class="form-group">
                <asp:Label ID="lblEmployeeID" runat="server" AssociatedControlID="txtEmployeeID" Text="Employee ID:"></asp:Label>
                <asp:TextBox ID="txtEmployeeID" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
             <div class="form-group">
                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="btnUpdate_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClick="btnCancel_Click" />
            </div>
        </div>
    </form>
     <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
