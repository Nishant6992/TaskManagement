<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncorrectCredentials.aspx.cs" Inherits="TaskManagement.IncorrectCredentials" %>
 <!DOCTYPE html>
 <html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Apology for Incorrect Credentials</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
         .container {
            width: 50%;
            margin: 100px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Sorry for Incorrect Credentials</h2>
            <p>We apologize for the inconvenience. The credentials you entered are incorrect. Please double-check and try again.</p>
            <asp:Button ID="btnBack" runat="server" Text="Back to Login" OnClick="btnBack_Click" CssClass="btn" />
        </div>
    </form>
</body>
</html>
