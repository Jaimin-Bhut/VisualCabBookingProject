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
                <asp:Label ID="lblCabType" runat="server" Text="Cab Type"></asp:Label></td>
            <td>
                <asp:DropDownList ID="ddlCabType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCabType_SelectedIndexChanged"></asp:DropDownList></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblPickUp" runat="server" Text="From"></asp:Label></td>
            <td>
                <asp:DropDownList ID="ddlPickUp" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPickUp_SelectedIndexChanged"></asp:DropDownList></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblDrop" runat="server" Text="To"></asp:Label></td>
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
                <asp:Button ID="btnDone" runat="server" Text="Done" /></td>
        </tr>
    </table>
        </div>
    <%--<table class="table">
        <tr>
            <td><asp:Label ID="lblDCity" runat="server" Text="Label"></asp:Label></td>
            <td><asp:Label ID="lblSCity" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblDCabType" runat="server" Text="Label"></asp:Label></td>
            <td><asp:Label ID="lblSCabType" runat="server" Text="Label"></asp:Label></td>
        </tr>
          <tr>
            <td><asp:Label ID="lblDpickup" runat="server" Text="Label"></asp:Label></td>
            <td><asp:Label ID="lblSpickup" runat="server" Text="Label"></asp:Label></td>
        </tr>  <tr>
            <td><asp:Label ID="lblDDrop" runat="server" Text="Label"></asp:Label></td>
            <td><asp:Label ID="lblSDrop" runat="server" Text="Label"></asp:Label></td>
        </tr>  <tr>
            <td><asp:Label ID="lblDDate" runat="server" Text="Label"></asp:Label></td>
            <td><asp:Label ID="lblDTime" runat="server" Text="Label"></asp:Label></td>
        </tr>
    </table>--%>
</asp:Content>

