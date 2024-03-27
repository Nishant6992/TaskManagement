<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="try.aspx.cs" Inherits="TaskManagement._try" %>
 <!DOCTYPE html>
 <html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form runat="server">
    <div class="modal fade" id="AddNew" data-backdrop="static" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add New</h4>
                </div>
                <div class="modal-body">
                    <div class="row pb-3">
                        <div class="col-lg-6">
                            <asp:DropDownList ID="DropDownList1"  class="browser-default custom-select form-control-sm" runat="server" AutoPostBack="true"></asp:DropDownList>
                        </div>
                        <div class="col-lg-6">
                            <asp:DropDownList ID="DropDownList2" class="browser-default custom-select form-control-sm" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="input-group mb-3 input-group-sm">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <asp:TextBox ID="TextBoxName" class="form-control" runat="server" placeholder="User Name..."></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <asp:DropDownList ID="DropDownListGroup" class="browser-default custom-select form-control-sm" runat="server"></asp:DropDownList>
                         </div>
                    </div>
                 </div>
                <div class="modal-footer">
                    <asp:Button ID="ButtonAdd" class="btn btn-primary btn-sm" runat="server" Text="Add" />
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
