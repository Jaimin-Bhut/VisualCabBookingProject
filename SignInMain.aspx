<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignInMain.aspx.cs" Inherits="SignInMain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SIGN-IN MAIN</title>
    <link href="Css/Circlelcon.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-box">
            <table>
                <tr>
                    <td>
                        <asp:ImageButton CssClass="img" ID="imgbtnAdmin" runat="server" ImageUrl="~/icon/admin_.png" OnClick="imgbtnAdmin_Click" />
                        <br />
                        <asp:Label ID="lblAdmin" runat="server" Text="ADMIN-LOGIN"></asp:Label>
                    </td>
                    <td>
                        <asp:ImageButton CssClass="img" ID="imgbtnDriver" runat="server" ImageUrl="~/icon/driver_.png" OnClick="imgbtnDriver_Click" />
                        <br />
                                                <asp:Label ID="lblDriver" runat="server" Text="DRIVER-LOGIN"></asp:Label>

                    </td>
                    <td>
                        <asp:ImageButton CssClass="img" ID="imgbtnUser" runat="server" ImageUrl="~/icon/user_.png" OnClick="imgbtnUser_Click" />
                        <br />
                                                <asp:Label ID="lblUser" runat="server" Text="USER-LOGIN"></asp:Label>

                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
