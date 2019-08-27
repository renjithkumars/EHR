<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmSignUp.aspx.cs" Inherits="EHR.frmSignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Patient Registration</title>
</head>
<body>
    <link href="css/EHR.css" rel="stylesheet" />
    <form id="form1" runat="server">
    <div>
        <div id="divSignUp" runat="server">
            <h2>Sign Up</h2>
            <div style="margin-left:5%;">
                <div>Email</div>
                <div><asp:TextBox ID="txtEmail" runat="server" Width="25%"></asp:TextBox></div>
                <div>Password</div>
                <div><asp:TextBox ID="txtPwd" runat="server" Width="25%"></asp:TextBox></div>
                <div>Confirm Password</div>
                <div><asp:TextBox ID="txtConfirmPwd" runat="server" Width="25%"></asp:TextBox></div><p></p>
            </div>
        </div>
        <p></p>
        <div class="centeralign">
            <asp:Button ID="btnSignUp" Text="Sign Up" runat="server" OnClick="btnSignUp_Click" />
        </div>
    </div>
    </form>
</body>
</html>
