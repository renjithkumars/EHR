<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmPatientProfile.aspx.cs" Inherits="EHR.frmPatientProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Patient Profile</title>
    <link href="css/EHR.css" rel="stylesheet" />
    <link href="css/jquery-ui.css" rel="stylesheet" />
    <script src="js/jquery-3.4.0.min.js"></script>
    <script src="js/jquery-ui.js"></script>
</head>
<body>
    <script>
        $(document).ready(  
  
  /* This is the function that will get executed after the DOM is fully loaded */  
  function () {  
      $("#txtDOB").datepicker({
          changeMonth: true,//this option for allowing user to select month  
          changeYear: true //this option for allowing user to select from year range  
      });  
    }  
    );

    </script>  
    <form id="form1" runat="server">
    <div>
        <div class="orangebox">
            <h2>Patient Profile</h2>
            <div>
                <div>PPS Number</div>
                <div><asp:TextBox ID="txtPPSN" runat="server" Width="25%"></asp:TextBox></div>
                <div>First Name</div>
                <div><asp:TextBox ID="txtFirstName" runat="server" Width="25%"></asp:TextBox></div>
                <div>Last Name</div>
                <div><asp:TextBox ID="txtLastName" runat="server" Width="25%"></asp:TextBox></div>
                <div>Sex</div>
                <div><asp:DropDownList ID="ddlSex" runat="server">
                    <asp:ListItem Value="0">Male</asp:ListItem>
                    <asp:ListItem Value="1">Female</asp:ListItem>
                    </asp:DropDownList></div>
                <div>Date of Birth</div>
                <div><asp:TextBox ID="txtDOB" runat="server"></asp:TextBox></div>
                <div>Next of kin</div>
                <div><asp:TextBox ID="txtNextofKin" runat="server" Width="25%"></asp:TextBox></div>
                <div>Phone</div>
                <div><asp:TextBox ID="txtPhone" runat="server" Width="25%"></asp:TextBox></div>
                <div>Address</div>
                <div><asp:TextBox ID="txtAddress" runat="server" Width="25%"></asp:TextBox></div>
                <div>City</div>
                <div><asp:TextBox ID="txtCity" runat="server" Width="25%"></asp:TextBox></div>
                <div>County</div>
                <div><asp:TextBox ID="txtCounty" runat="server" Width="25%"></asp:TextBox></div>
                <div>Upload Photo</div>
                <div><asp:FileUpload ID="FileUpload" runat="server" Width="25%" /> (Maximum size 4 MB)</div>
            </div>
        </div>
        <div class="centeralign">
            <asp:Button ID="btnSubmit" Text="Submit" runat="server" class="EHROrangeButtons" OnClick="btnSubmit_Click" />
        </div>
    </div>
    </form>
</body>
</html>
