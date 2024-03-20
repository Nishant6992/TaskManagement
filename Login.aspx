<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TaskManagement.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="StyleSheet1.css"/> 
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="screen">
                <div class="screen__content">
                    <h2> <center>Task Management</center></h2>
                    <div class="login__field">
                        <i class="login__icon fas fa-user"></i>
                        <asp:TextBox ID="txtemail" runat="server" CssClass="login__input" placeholder="User name / Email"></asp:TextBox>
                    </div>
                    <div class="login__field">
                        <i class="login__icon fas fa-lock"></i>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="login__input" placeholder="Password"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnLogin" runat="server" CssClass="button login__submit" Text="Log In Now" OnClick="btnLogin_Click" />
                
                   <%-- <div class="social-login">
                        <h3>log in via</h3>
                        <div class="social-icons">
                            <a href="#" class="social-login__icon fab fa-instagram"></a>
                            <a href="#" class="social-login__icon fab fa-facebook"></a>
                            <a href="#" class="social-login__icon fab fa-twitter"></a>
                        </div>
                    </div>--%>
                </div>
                <div class="screen__background">
                    <span class="screen__background__shape screen__background__shape4"></span>
                    <span class="screen__background__shape screen__background__shape3"></span>       
                    <span class="screen__background__shape screen__background__shape2"></span>
                    <span class="screen__background__shape screen__background__shape1"></span>
                </div>      
            </div>
        </div>
    </form>
</body>
</html>
