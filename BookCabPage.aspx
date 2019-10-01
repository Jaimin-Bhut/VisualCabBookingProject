<%@ Page Title="BOOK CAB" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BookCabPage.aspx.cs" Inherits="BookCabPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <link href="Css/Style.css" rel="stylesheet" />
    <div class="login-box">
        <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <center> <asp:Label ID="lblHeading" Text="BOOK CAB" runat="server" Font-Bold="true" Font-Underline="true" Font-Size="X-Large"></asp:Label></center>

                <table class="auto-style1">
                    <tr>
                        <td>
                            <asp:Label ID="lblCity" runat="server" Text="Select City"></asp:Label></td>
                        <td>
                            <asp:DropDownList ID="ddlCity" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCity_SelectedIndexChanged"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCabType" runat="server" Text="Select Cab"></asp:Label></td>
                        <td>
                            <asp:DropDownList ID="ddlCabType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCabType_SelectedIndexChanged"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPickUp" runat="server" Text="Pick Up"></asp:Label></td>
                        <td>
                            <asp:DropDownList ID="ddlPickUp" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPickUp_SelectedIndexChanged"></asp:DropDownList></td>
                        <td>
                            <asp:Label ID="lblDrop" runat="server" Text="Drop"></asp:Label></td>
                        <td>
                            <asp:DropDownList ID="ddlDrop" runat="server" AutoPostBack="true"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblDate" runat="server" Text="Date"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtDate" runat="server" TextMode="Date"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblTime" runat="server" Text="Time"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtTime" runat="server" TextMode="Time"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnDone" runat="server" Text="Done" OnClick="btnDone_Click" /></td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>

