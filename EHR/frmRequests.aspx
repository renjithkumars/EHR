<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmRequests.aspx.cs" Inherits="EHR.frmRequests" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Requests</title>
    <link href="css/EHR.css" rel="stylesheet" />
    <script src="js/jquery-3.4.0.min.js"></script>
    <style>
    .hiddencol { display: none; }
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
            <li><a href="frmMyDoctors.aspx">My Doctors</a></li>
            <li><a class="active" href="frmRequests.aspx">Request</a></li>
            <li style="float:right"><a href="frmLogin.aspx">Logout</a></li>
            </ul>
        </div>
        <div>
            <asp:GridView ID="grvRequests" runat="server" Width="80%" AutoGenerateColumns="false" style="margin-top:2%;margin-bottom:2%" OnRowDataBound="grvRequests_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderText="Sl.No" HeaderStyle-Width="2%">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Id" HeaderText="Id" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol"  />
                <asp:BoundField DataField="First_Name" HeaderText="First Name" />
                <asp:BoundField DataField="Last_Name" HeaderText="Last Name" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
                <asp:BoundField DataField="Date" HeaderText="Date" />
            </Columns>
            <HeaderStyle BackColor="Orange" ForeColor="White" Font-Bold="true" Font-Size="X-Large" />
        </asp:GridView>
        </div>
    </div>
    </form>
</body>
</html>
