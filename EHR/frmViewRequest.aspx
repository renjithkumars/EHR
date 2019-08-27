<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmViewRequest.aspx.cs" Inherits="EHR.frmViewRequest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Request</title>
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
      background-color: orange;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div>
            <div>
                <ul>
                <li><a href="frmMyDoctors.aspx">My Doctors</a></li>
                <li><a class="active" href="frmRequests.aspx">Request</a></li>
                <li style="float:right"><a href="frmLogin.aspx">Logout</a></li>
                </ul>
            </div>
            <div style="margin-left:10%;width:100%;">
            <div style="margin-top:2%;">
                <asp:Image ID="imgPhoto" runat="server" Width="10%" ImageUrl="~/LoadImage.aspx" />
            </div>
            <div style="float:left;width:20%;margin-top:2%;font-size:x-large"">
                <div>First Name</div>
                <div>Last Name</div>
                <div>Hospital / Clinic</div>
                <div>Phone</div>
            </div>
            <div style="margin-top:2%;width:100%;font-size:x-large">
                <div><asp:Label ID="lblFirstName" runat="server"></asp:Label></div>
                <div><asp:Label ID="lblLastName" runat="server"></asp:Label></div>
                <div><asp:Label ID="lblHospital" runat="server"></asp:Label></div>
                <div><asp:Label ID="lblPhone" runat="server"></asp:Label></div>
                <div><asp:HiddenField ID="txtEmail" runat="server" /></div>
            </div>
            <div style="margin-left:5%">
                <asp:Button ID="btnAcceptRequest" runat="server" Text="Accept Request" CssClass="EHROrangeButtons" OnClick="btnAcceptRequest_Click" />
            </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
