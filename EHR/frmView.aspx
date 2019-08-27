<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmView.aspx.cs" Inherits="EHR.frmView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Patient Details</title>
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
        <div style="margin-left:10%;width:100%;">
            <div style="margin-top:2%;">
                <asp:Image ID="imgPhoto" runat="server" Width="10%" ImageUrl="~/frmLoadPatientImage.aspx" />
            </div>
            <div style="float:left;width:20%;margin-top:2%;font-size:x-large"">
                <div>First Name</div>
                <div>Last Name</div>     
                <div>Date of Birth</div>           
                <div>Phone</div>
            </div>
            <div style="margin-top:2%;width:100%;font-size:x-large">
                <div><asp:Label ID="lblFirstName" runat="server"></asp:Label></div>
                <div><asp:Label ID="lblLastName" runat="server"></asp:Label></div>
                <div><asp:Label ID="lblDOB" runat="server"></asp:Label></div>
                <div><asp:Label ID="lblPhone" runat="server"></asp:Label></div>
                <div><asp:HiddenField ID="txtEmail" runat="server" /></div>
            </div>
        </div>
        <div><asp:Button ID="btnAdd" Text="Add Medication" runat="server" OnClick="btnAdd_Click" /></div>
        </div>

        <div>
            <asp:GridView ID="grvMedication" runat="server" Width="80%" AutoGenerateColumns="false" style="margin-top:2%;margin-bottom:2%">
            <Columns>
                <asp:TemplateField HeaderText="Sl.No" HeaderStyle-Width="2%">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Medication" HeaderText="Medication" />
                <asp:BoundField DataField="Prescription" HeaderText="Prescription" />
            </Columns>
            <HeaderStyle BackColor="Green" ForeColor="White" Font-Bold="true" Font-Size="X-Large" />
        </asp:GridView>
        </div>
    </form>
</body>
</html>
