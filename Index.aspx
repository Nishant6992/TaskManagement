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
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 col-sm-8">
                <form id="form1" runat="server">
                    <center>Registration</center>
                    <div class="form-group">
                        <label for="txtname">Name</label>
                        <asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="gender">Gender</label>
                        <asp:DropDownList ID="gender" runat="server" CssClass="form-control">
                            <asp:ListItem Text="--Select--" Value=""></asp:ListItem>
                            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                            <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                     <div class="form-group">
                        <label for="emailid">Email ID</label>
                        <asp:TextBox ID="emailid" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="state">State</label>
                        <asp:TextBox ID="state" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="mobilenumber">Mobile Number</label>
                        <asp:TextBox ID="mobilenumber" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="age">Age</label>
                        <asp:TextBox ID="age" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="address">Address</label>
                        <asp:TextBox ID="address" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <asp:TextBox ID="password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="confirmpassword">Confirm Password</label>
                        <asp:TextBox ID="confirmpassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="ddlRole">Role</label>
                        <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control">
                            <asp:ListItem Text="--Select--" Value=""></asp:ListItem>
                            <asp:ListItem Text="User" Value="User" />
                            <asp:ListItem Text="Admin" Value="Admin" />
                        </asp:DropDownList>
                    </div>
                    <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Submit" CssClass="btn btn-primary" OnClientClick="return validatePasswordAndGender();" />
                </form>
            </div>
        </div>
    </div>
</body>
<script>
    function validatePasswordAndGender() {
        var password = document.getElementById('<%= password.ClientID %>').value;
        var confirmPassword = document.getElementById('<%= confirmpassword.ClientID %>').value;
        var gender = document.getElementById('<%= gender.ClientID %>').value;
         if (gender === "") {
            alert("Please select your gender");
            return false;
        }
         if (password.length < 8) {
            alert("Password must be at least 8 characters long");
            return false;
        }
         if (password !== confirmPassword) {
            alert("Passwords do not match");
            return false;
        }
         return true;
    }
</script>
 </html>
