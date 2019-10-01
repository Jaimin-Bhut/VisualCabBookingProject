<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="Driver_cab_Managment.aspx.cs" Inherits="Driver_cab_Managment" %>

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
                <table class="auto-style1">
                    <tr>
                        <td>
                            <asp:Label ID="lblDriver" runat="server" Text="Driver"></asp:Label></td>
                        <td>
                            <asp:DropDownList ID="ddlDriver" runat="server" OnSelectedIndexChanged="ddlDriver_SelectedIndexChanged"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCab" runat="server" Text="Cab"></asp:Label></td>
                        <td>
                            <asp:DropDownList ID="ddlCab" runat="server"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label></td>
                        <td>
                            <asp:DropDownList ID="ddlCity" runat="server"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblFrom" runat="server" Text="From"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtFrom" runat="server" TextMode="Date"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblTo" runat="server" Text="To"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtTo" runat="server" TextMode="Date"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnOk" runat="server" Text="Ok" OnClick="btnOk_Click" />
                        </td>

                    </tr>
                </table>

            </ContentTemplate>
        </asp:UpdatePanel>

    </div>

</asp:Content>

