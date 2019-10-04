<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="AdminMain.aspx.cs" Inherits="AdminMain" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="contentAdminMain" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <link href="Css/Style.css" rel="stylesheet" />
    <br />
    <div class="login-box">
        <center> <asp:Label ID="lblHeading" Text="ADMIN MAIN" runat="server" Font-Bold="true" Font-Underline="true" Font-Size="X-Large"></asp:Label></center>
        <br />
        <table id="tblImage" runat="server">
            <tr>
                <td>
                    <asp:ImageButton CssClass="img" ID="imgAddState" runat="server" ImageUrl="~/icon/State_icon.png" BackColor="White" Height="75px" Width="75px" OnClick="imgAddState_Click" ToolTip="Add State" /><br />
                    <asp:Label ID="lblAddState" runat="server" Text="ADD STATE"></asp:Label>
                </td>
                <td>
                    <asp:ImageButton CssClass="img" ID="imgAddCity" runat="server" ImageUrl="~/icon/city_icon.png" BackColor="White" Height="75px" Width="75px" OnClick="imgAddCity_Click" ToolTip="Add City" /><br />
                    <asp:Label ID="lblAddCity" runat="server" Text="Add City"></asp:Label>
                </td>

           
                <td>
                    <asp:ImageButton CssClass="img" ID="imgbtnAddArea" runat="server" ImageUrl="~/icon/addArea_icon.png" BackColor="White" Height="75px" Width="75px" OnClick="imgbtnAddArea_Click" ToolTip="Add Area" /><br />
                    <asp:Label ID="lblAddArea" runat="server" Text="Add Area"></asp:Label>

                </td>
                <td>
                    <asp:ImageButton CssClass="img" ID="imgAddCab" runat="server" ImageUrl="~/icon/Cab_icon.png" BackColor="White" Height="75px" Width="75px" OnClick="imgAddCab_Click" ToolTip="Add Cab" /><br />
                    <asp:Label ID="lblAddCab" runat="server" Text="Add Cab"></asp:Label>

                </td>
                </tr>
            <tr>
                <td>
                    <asp:ImageButton CssClass="img" ID="imgbtnAddDriver" runat="server" ImageUrl="~/icon/addDriver_icon.png" BackColor="White" Height="75px" Width="75px" OnClick="imgbtnAddDriver_Click" ToolTip="Add Driver" /><br />
                    <asp:Label ID="lblAddDriver" runat="server" Text="Add Driver"></asp:Label>

                </td>
                <td>
                    <asp:ImageButton CssClass="img" ID="imgbtnAssignCab" runat="server" ImageUrl="~/icon/asignCab_icon.png" BackColor="White" Height="75px" Width="75px" ToolTip="Assign Cab" OnClick="imgbtnAssignCab_Click" /><br />
                    <asp:Label ID="lblAssingnCab" runat="server" Text="Assign Cab"></asp:Label>

                </td>
                <td>
                    <asp:ImageButton CssClass="img" ID="imgbtnViewBill" runat="server" ImageUrl="~/icon/viewBooking_icon.png" BackColor="White" Height="75px" Width="75px" ToolTip="View Bill" OnClick="imgbtnViewBill_Click" /><br />
                    <asp:Label ID="lblViewBill" runat="server" Text="View Bill"></asp:Label>

                </td>
                <td>
                    <asp:ImageButton CssClass="img" ID="imgbtnClients" runat="server" ImageUrl="~/icon/Clients_icon.png" BackColor="White" Height="75px" Width="75px" ToolTip="Clients" /><br />
                    <asp:Label ID="lblClients" runat="server" Text="Clients Details"></asp:Label>

                </td>
            </tr>
        </table>
    </div>

</asp:Content>

