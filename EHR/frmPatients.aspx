<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmPatients.aspx.cs" Inherits="EHR.frmPatients" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>All Patients</title>
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
      background-color: #4CAF50;
    }
</style>
     <script type="text/javascript">
        function setrowcolor(chb) {
            if (chb.checked)
                chb.parentNode.parentNode.style.backgroundColor = "lightgray";
            else
                chb.parentNode.parentNode.style.backgroundColor = "";
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div>
            <ul>
                <li><a href="frmMyPatients.aspx">My Patients</a></li>
                <li><a class="active" href="frmPatients.aspx">Patients</a></li>
                <li style="float:right"><a href="frmLogin.aspx">Logout</a></li>
             </ul>
        </div>
    </div>
    <div>
        <asp:GridView ID="grvPatients" runat="server" Width="80%" AutoGenerateColumns="false" style="margin-top:2%;margin-bottom:2%">
            <Columns>
                <asp:TemplateField HeaderStyle-Width="2%">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkRow" runat="server" onclick="setrowcolor(this);" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sl.No" HeaderStyle-Width="2%">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Account_Id" HeaderText="Account Id" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol"  />
                <asp:BoundField DataField="First_Name" HeaderText="First Name" />
                <asp:BoundField DataField="Last_Name" HeaderText="Last Name" />
            </Columns>
            <HeaderStyle BackColor="Green" ForeColor="White" Font-Bold="true" Font-Size="X-Large" />
        </asp:GridView>
    </div>
    <div class="centeralign">
        <asp:Button ID="btnSendRequest" runat="server" Text="Send Request" CssClass="EHRGreenButtons" OnClick="btnSendRequest_Click" />
    </div>
    </form>
</body>
</html>
