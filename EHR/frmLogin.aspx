<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="EHR.frmLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <link href="css/EHR.css" rel="stylesheet" />
    <script src="js/jquery-3.4.0.min.js"></script>
<script>
    // Patient Login
    $(document).ready(function () {
        $("#btnPatient").click(function () {
            if ($("#dvLoginHead").text() != "Patient Login") {
                $("#dvLoginHead").css("background-color", "orange");
                $("#dvLoginHead").text("Patient Login");
                $("#hdnRole").val("1");
                $("#dvLogin").show('slow', function () {
                });
            }
            else
            {
                $("#dvLogin").toggle('slow', function () {
                });
            }
        })
    });

    // Doctor Login
    $(document).ready(function () {
        $("#btnDoctor").click(function () {
            if ($("#dvLoginHead").text() != "Doctor Login") {
                $("#dvLoginHead").css("background-color", "green");
                $("#dvLoginHead").text("Doctor Login");
                $("#hdnRole").val("2");
                $("#dvLogin").show('slow', function () {
                });
               
            }
            else
            {
                $("#dvLogin").toggle('slow', function () {
                });
            }
        })
    });

    // Insurance Login
    $(document).ready(function () {
        $("#btnInsurance").click(function () {
            if ($("#dvLoginHead").text() != "Insurance Login") {
                $("#dvLoginHead").css("background-color", "Blue");
                $("#dvLoginHead").text("Insurance Login");
                $("#hdnRole").val("3");
                $("#dvLogin").show('slow', function () {
                });

            }
            else {
                $("#dvLogin").toggle('slow', function () {
                });
            }
        })
    });
</script>
    <form id="form1" runat="server">
    <div>
        <div>
        <div class="centeralign">
            <h1>EHR</h1>
        </div>
        <div>
            <div class="centeralign">
                <asp:Image ID="imgEHR" runat="server" ImageUrl="~/Images/EHR.jpg" />
            </div>
            <div class="centeralign">
                <input id="btnPatient" type="button" value="Patient" class="EHRGreenButtons" />
                <input id="btnDoctor" type="button" value="Doctor" style="margin:2%"  class="EHRGreenButtons" />
                <input id="btnInsurance" type="button" value="Insurance" class="EHRGreenButtons" />
            </div>
        </div>
        </div>
        <div id="dvLogin"class="dvCenterAlign" >
            <div id="dvLoginHead" style="background-color:blue;color:white;font-size:x-large;">Login</div>
            <div>Email</div>
            <div><asp:TextBox ID="txtEmail" runat="server" Width="90%"></asp:TextBox></div>
            <div>Password</div>
            <div><asp:TextBox ID="txtPassword" runat="server" Width="90%"></asp:TextBox></div>
            <div><asp:Button ID="btnLogin" runat="server" Text="Login" style="margin-top:2%;"  OnClick="btnLogin_Click" /></div>
            <div style="float:left;"><asp:HyperLink ID="hlinkForgotPwd" runat="server">Forgot Password</asp:HyperLink></div>
            <div style="float:right;"><asp:LinkButton ID="btnlinkRegister" runat="server" OnClick="btnlinkRegister_Click">Register</asp:LinkButton></div>
            <div style="display:none;"><asp:HiddenField ID="hdnRole" runat="server" /></div>
        </div>
    </div>
    </form>
</body> 
</html>
