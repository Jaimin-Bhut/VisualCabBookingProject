﻿<%@ Page Title="ADMIN MAIN" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminMain.aspx.cs" Inherits="AdminMain" %>

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
                    <asp:ImageButton CssClass="img" ID="imgbtnAddCharges" runat="server" ImageUrl="~/icon/addcharges_icon.png" BackColor="White" Height="75px" Width="75px" ToolTip="Feedback" OnClick="imgbtnAddCharges_Click" /><br />
                    <asp:Label ID="lblAddCharges" runat="server" Text="Add Charges"></asp:Label>

                </td>
                <td>
                    <asp:ImageButton CssClass="img" ID="imgbtnFeedback" runat="server" ImageUrl="~/icon/feedback_icon.png" BackColor="White" Height="75px" Width="75px" ToolTip="View Feedback" OnClick="imgbtnFeedback_Click" /><br />
                    <asp:Label ID="lblFeedback" runat="server" Text="Feedback"></asp:Label>

                </td>
                <td>
                    <asp:ImageButton CssClass="img" ID="imgbtnSignOut" runat="server" ImageUrl="~/icon/signout_icon.png" BackColor="White" Height="75px" Width="75px" ToolTip="Sign-Out" OnClick="imgbtnSignOut_Click" /><br />
                    <asp:Label ID="lblSignOut" runat="server" Text="Sign Out"></asp:Label>
                </td>
            </tr>
        </table>
    </div>

</asp:Content>

