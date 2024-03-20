<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="TaskManagement.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <title>Task Management Sign up</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        form {
            width: 300px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

            form center {
                font-size: 24px;
                margin-bottom: 20px;
                display: block;
            }

            form label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }

            form input[type="text"],
            form input[type="password"] {
                width: calc(100% - 12px);
                padding: 6px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            form input[type="button"] {
                width: 100%;
                padding: 10px;
                background-color: #3366FF;
                border: 1px solid #3366FF;
                border-radius: 4px;
                color: #fff;
                font-weight: bold;
                cursor: pointer;
            }

                form input[type="button"]:hover {
                    background-color: #0056b3;
                    border-color: #0056b3;
                }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <center>Registration</center>
        <label for="txtname">Name</label>
        <asp:TextBox ID="txtname" runat="server"></asp:TextBox>

        <label for="gender">Gender</label>
        <asp:TextBox ID="gender" runat="server"></asp:TextBox>

        <label for="emailid">Email ID</label>
        <asp:TextBox ID="emailid" runat="server"></asp:TextBox>

        <label for="state">State</label>
        <asp:TextBox ID="state" runat="server"></asp:TextBox>

        <label for="mobilenumber">Mobile Number</label>
        <asp:TextBox ID="mobilenumber" runat="server"></asp:TextBox>

        <label for="age">Age</label>
        <asp:TextBox ID="age" runat="server"></asp:TextBox>

        <label for="address">Address</label>
        <asp:TextBox ID="address" runat="server"></asp:TextBox>

        <label for="password">Password</label>
        <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>


      <label for="ddlRole">Role</label>
        <asp:DropDownList ID="ddlRole" Width="150px" runat="server" EnableViewState="true">
            <asp:ListItem Text="User" value="User" />
            <asp:ListItem Text="Admin" Value="Admin" />
        </asp:DropDownList>

        <br />
        <br />
        <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Submit" />
    </form>
</body>
</html>
