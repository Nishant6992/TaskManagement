<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateProject.aspx.cs" Inherits="TaskManagement.CreateProject" %>
 <!DOCTYPE html>
<PackageReference Include="BCrypt.Net-Next" Version="4.0.3" />
 <html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Add Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Create Project</h1>
             <div class="form-group">
                <asp:Label ID="Label2" runat="server" Text="Project Name"></asp:Label>
                <asp:TextBox ID="txtProjectName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Label3" runat="server" AssociatedControlID="txtStartDate" Text="Start Date:"></asp:Label>
                <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Label4" runat="server" Text="Deadline:" AssociatedControlID ="txtDeadline"></asp:Label>
                <asp:TextBox ID="txtDeadline" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Label5" runat="server" Text="Project Description"></asp:Label>
                <asp:TextBox ID="txtProjectDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Label8" runat="server" Text="Assigned to" AssociatedControlID="ddlEmployeesid"></asp:Label>
                <asp:DropDownList ID="ddlEmployeesid" runat="server" CssClass="form-control">
                 </asp:DropDownList>
            </div>
             <div>
                <asp:Button ID="SubmitButton" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="SubmitButton_Click" />
            </div>
        </div>
    </form>
</body>
</html>
