<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateTask.aspx.cs" Inherits="TaskManagement.CreateTask" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create Task</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        #ddlPriority {
            width: 200px;
            transition: background-color 0.3s ease;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Create Task</h2>
            <hr />

            <%--            <div class="form-group">
                <asp:Label ID="lblEmployeeName" runat="server" AssociatedControlID="ddlEmployees" Text="Employee Name:"></asp:Label>
                <asp:DropDownList ID="ddlEmployees" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>--%>
            <div class="form-group">
                <asp:Label ID="lblEmployeeid" runat="server" AssociatedControlID="ddlEmployeesid" Text="Employee ID:"></asp:Label>
                <asp:DropDownList ID="ddlEmployeesid" runat="server" CssClass="form-control">
                    <asp:ListItem Text="--Select--" Value="" />
                </asp:DropDownList>
            </div>


            <div class="form-group">
                <asp:Label ID="lblprojectid" runat="server" AssociatedControlID="txtprojectid" Text="Project ID:"></asp:Label>
                <asp:TextBox ID="txtprojectid" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblprojectname" runat="server" AssociatedControlID="txtprojectname" Text="Project Name:"></asp:Label>
                <asp:TextBox ID="txtprojectname" runat="server" CssClass="form-control"></asp:TextBox>
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
                <asp:DropDownList ID="ddlPriority" runat="server" CssClass="form-control" onchange="changeColor(this)">
                    <asp:ListItem Text="Low" Value="Low"></asp:ListItem>
                    <asp:ListItem Text="Medium" Value="Medium"></asp:ListItem>
                    <asp:ListItem Text="High" Value="High"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <asp:Label ID="lblTaskDescription" runat="server" AssociatedControlID="txtTaskDescription" Text="Task Description:"></asp:Label>
                <asp:TextBox ID="txtTaskDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:FileUpload ID="fileUpload" runat="server" CssClass="" />
            </div>

            <br />
            <div class="form-group">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
            </div>


        </div>
    </form>

    <script>
        function changeColor(select) {
            var selectedValue = select.value;
            switch (selectedValue) {
                case "Low":
                    select.style.backgroundColor = "green";
                    break;
                case "Medium":
                    select.style.backgroundColor = "orange";
                    break;
                case "High":
                    select.style.backgroundColor = "red";
                    break;
                default:
                    select.style.backgroundColor = "white";
                    break;
            }
        }
    </script>
</body>
</html>
