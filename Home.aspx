<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TaskManagement.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Task Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navigation Bar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#">Task Management</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Services</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Contact</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Jumbotron -->
   <div class="jumbotron" style="padding-top: 30px; padding-bottom: 40px;">
    <div class="container">
        <h1 class="display-4">Welcome to Task Management</h1>
        <p class="lead">Efficiently manage your tasks with our powerful task management system. Simplify your workflow, collaborate with your team, and stay organized to achieve your goals.</p>
        <hr class="my-4" />
        <p>Task Management System provides intuitive features to streamline your work processes, allowing you to focus on what matters most.</p>
        <a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>
    </div>
</div>

        <!-- Random Content Section -->
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-4">
                    <div class="card mb-4 shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title">Create Task</h5>
                            <p class="card-text">Use our intuitive task creation feature to add new tasks effortlessly. Assign tasks, set deadlines, and keep track of progress seamlessly.</p>
                            <a href="#" class="btn btn-primary">Create</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card mb-4 shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title">Delete Task</h5>
                            <p class="card-text">Easily remove unwanted tasks from your list with our efficient task deletion feature. Keep your task list clean and organized by deleting completed or irrelevant tasks.</p>
                            <a href="#" class="btn btn-danger">Delete</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card mb-4 shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title">Task List</h5>
                            <p class="card-text">Stay organized and keep track of your tasks with our comprehensive task list feature. Easily view, manage, and prioritize your tasks to boost productivity.</p>
                            <a href="#" class="btn btn-info">View List</a>
                        </div>
                    </div>
                </div>
               
                <br />
                <br />
                <br />
                <br />

            </div>
        </div>

        <!-- Login and Registration Section -->
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary btn-lg btn-block" OnClick="btnLogin_Click" />
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-md-12">
                    <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-secondary btn-lg btn-block" OnClick="btnRegister_Click" />
                </div>
            </div>
        </div>
         <div  style=" margin-bottom: 100px;"></div>

        <!-- Footer -->
        <footer class="footer bg-dark text-white text-center py-4 fixed-bottom">
            <div class="container">
                <span>&copy; 2024 Task Management</span>
            </div>
        </footer>

    </form>

    <!-- Bootstrap JS (optional) -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
