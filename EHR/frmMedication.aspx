<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmMedication.aspx.cs" Inherits="EHR.frmMedication" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Medications</title>
    <link href="css/EHR.css" rel="stylesheet" />
    <script src="js/jquery-3.4.0.min.js"></script>
    <style>
    
    ul {
      list-style-type: none;
      margin: 0;
      padding: 0;
      overflow: hidden;
      background-color: #333;
    }

    li {
      float: left;
      border-right:1px solid #bbb;
    }

    li:last-child {
      border-right: none;
    }

    li a {
      display: block;
      color: white;
      text-align: center;
      padding: 14px 16px;
      text-decoration: none;
    }

    li a:hover:not(.active) {
      background-color: #111;
    }

    .active {
      background-color: green;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div>
            <ul>
            <li><a class="active" href="frmMyPatients.aspx">My Patients</a></li>
            <li><a href="frmPatients.aspx">Patients</a></li>
            <li style="float:right"><a href="frmLogin.aspx">Logout</a></li>
            </ul>
        </div>
        <div style="margin-top:5%;">Medication</div>
        <div><asp:TextBox ID="txtMedications" runat="server" Width="30%"></asp:TextBox></div>
        <div>Prescription</div>
        <div><asp:TextBox ID="txtPrescription" runat="server" Width="30%"></asp:TextBox></div>
        <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" style="margin-top:3%;" />
    </div>
    </form>
</body>
</html>
