<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmMyPatients.aspx.cs" Inherits="EHR.frmMyPatients" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Patients</title>
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
    #mask
        {
            position: fixed;
            left: 0px;
            top: 0px;
            z-index: 4;
            opacity: 0.4;
            -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=40)"; /* first!*/
            filter: alpha(opacity=40); /* second!*/
            background-color: gray;
            display: none;
            width: 100%;
            height: 100%;
        }
</style>
    <script type="text/javascript">
        function ShowPopup(id) {
            $('#mask').show();
            $('#<%=pnlpopup.ClientID %>').show();
            var ReqId = document.getElementById("<%= txtHidden.ClientID %>");
            ReqId.value = id;
        }
        function HidePopup() {
            $('#mask').hide();
            $('#<%=pnlpopup.ClientID %>').hide();
        }
        $(".btnClose").live('click',function () {
            HidePopup();
        });
    </script>
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
                <asp:BoundField DataField="OTP_Verified" HeaderText="OTPVerified" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol"  />
            </Columns>
            <HeaderStyle BackColor="green" ForeColor="White" Font-Bold="true" Font-Size="X-Large" />
        </asp:GridView>
            </div>
      <div id="mask"></div>
      <asp:Panel ID="pnlpopup" runat="server"  BackColor="White" Height="175px" Width="300px" Style="z-index:111;background-color: White; position: absolute; left: 35%; top: 12%; border: outset 2px gray;padding:5px;display:none">
          <asp:Button ID="btnclose" runat="server" Text="X" style="float:right;" />
          <div><asp:HiddenField ID="txtHidden" runat="server" /></div>
          <div style="margin-top:10%;">Please Enter the OTP</div>
          <div><asp:TextBox ID="txtOTP" runat="server"></asp:TextBox></div>
          <div style="margin-top:5%;"><asp:Button ID="btnVerify" runat="server" Text="Verify" OnClick="btnVerify_Click" /></div>
       </asp:Panel>
        
    </div>
    </form>
</body>
</html>
