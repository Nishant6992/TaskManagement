<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteTask.aspx.cs" Inherits="TaskManagement.DeleteTask" %>
 <!DOCTYPE html>
 <html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Delete Task</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        .task-details {
            display: none;
        }
    </style>
    <script>
        $(document).ready(function () {
            $("#ddlTasks").change(function () {
                var taskId = $(this).val();
                $.ajax({
                    type: "GET",
                    url: "GetTaskDetails.aspx?taskId=" + taskId,
                    success: function (data) {
                        $(".task-details").html(data).show();
                    },
                    error: function () {
                        $(".task-details").html("Error occurred while fetching task details.").show();
                    }
                });
            });
        });
    </script>
</head>
<body>
    <style>
        body {
            background-image: url('https://www.shutterstock.com/shutterstock/photos/2107562936/display_1500/stock-photo--d-clipboard-and-pencil-on-pink-background-notepad-icon-d-render-illustration-2107562936.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
    </style>
    <form id="form1" runat="server">
        <div class="container" style="margin-top: 40px; background-color:seashell; border-radius:12px; height:210px;" >
            <h2>Delete Task</h2>
            <hr />
             <div class="form-group">
                <label for="ddlTasks">Select Task:</label>
                <asp:DropDownList ID="ddlTasks" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlTasks_SelectedIndexChanged">
                    <asp:ListItem Text="--Select--" Value="" />
                 </asp:DropDownList>
            </div>
             <div class="task-details">
                <!-- Task details will be displayed here -->
            </div>
             <div class="form-group mt-3">
                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger mr-2" OnClick="btnDelete_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClick="btnCancel_Click" />
            </div>
        </div>
         <div class="container" style="margin-top: 100px;background-color:seashell; border-radius:12px; height:210px;">
            <h2>Delete Project</h2>
            <hr />
             <div class="form-group">
                <label for="ddlTasks">Select Project:</label>
                <asp:DropDownList ID="ddlProject" runat="server" CssClass="form-control">
                    <asp:ListItem Text="--Select--" Value="" />
                 </asp:DropDownList>
            </div>
             <div class="task-details">
                <!-- Task details will be displayed here -->
            </div>
             <div class="form-group mt-3">
                <asp:Button ID="btnDeleteProject" runat="server" Text="Delete" CssClass="btn btn-danger mr-2" OnClick="btnDeleteProject_Click" />
                <asp:Button ID="Button2" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClick="btnCancel_Click" />
            </div>
        </div>
    </form>
     <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
