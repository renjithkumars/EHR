<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmDoctorProfile.aspx.cs" Inherits="EHR.frmDoctorProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Doctor Profile</title>
    <link href="css/EHR.css" rel="stylesheet" />
</head>
<body>

    <form id="form1" runat="server">
    <div>
        <div class="greenbox">
            <div style="margin-left:1%;">
            <h2>Doctor Profile</h2>
            <div>First Name</div>
            <div><asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox></div>
            <div>Last Name</div>
            <div><asp:TextBox ID="txtLastName" runat="server"></asp:TextBox></div>
            <div>Sex</div>
            <div><asp:DropDownList ID="ddlSex" runat="server">
                    <asp:ListItem Value="0">Male</asp:ListItem>
                    <asp:ListItem Value="1">Female</asp:ListItem>
                    </asp:DropDownList></div>
            <div>Hospital Name / Clinic </div>
            <div><asp:TextBox ID="txtHospitalName" runat="server" Width="25%"></asp:TextBox></div>
            <div>Address</div>
            <div><asp:TextBox ID="txtAddress" runat="server" Width="25%"></asp:TextBox></div>
            <div>Phone</div>
            <div><asp:TextBox ID="txtPhone" runat="server" Width="25%"></asp:TextBox></div>
            <div>City</div>
            <div><asp:TextBox ID="txtCity" runat="server" Width="25%"></asp:TextBox></div>
            <div>County</div>
            <div><asp:TextBox ID="txtCounty" runat="server" Width="25%"></asp:TextBox></div>
            <div>Upload Photo</div>
            <div><asp:FileUpload ID="FileUpload" runat="server" Width="25%" />(Maximum size 4 MB)</div>
            </div>
        </div>
        <div class="centeralign">
            <asp:Button ID="btnSubmit" Text="Submit" runat="server" class="EHRGreenButtons" OnClick="btnSubmit_Click" />
        </div>
    </div>
    </form>
</body>
</html>
