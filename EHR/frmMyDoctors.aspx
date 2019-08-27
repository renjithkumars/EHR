<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmMyDoctors.aspx.cs" Inherits="EHR.frmMyDoctors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Doctors</title>
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
      background-color: orange;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div>
            <ul>
            <li><a class="active" href="frmMyDoctors.aspx">My Doctors</a></li>
            <li><a href="frmRequests.aspx">Request</a></li>
            <li style="float:right"><a href="frmLogin.aspx">Logout</a></li>
            </ul>
        </div>
        <div style="margin-top:2%;">
            <asp:HyperLink ID="hyplnkCount" runat="server"  Font-Size="X-Large" NavigateUrl="~/frmRequests.aspx">HyperLink</asp:HyperLink></div>
    </div>
    </form>
</body>
</html>
