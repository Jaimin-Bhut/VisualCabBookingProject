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
    <link href="Css/StyleSheet.css" rel="stylesheet" />
    <div>
        <table>
            <tr style="width: 1100px; height: 50px">
                <td>
                    <ul>
                        <li>
                            <asp:HyperLink ID="linkFeedback" runat="server" Text="Feedback" NavigateUrl="~/Feedback.aspx"></asp:HyperLink>

                        </li>
                        <li>
                            <asp:Button ID="btnLogOut" runat="server" CssClass="button" Text="Sign Out" OnClick="btnLogOut_Click"/>

                        </li>
                    </ul>
                </td>
            </tr>
        </table>
    </div>
    <div class="login-box">
        <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel" runat="server">
            <ContentTemplate>
                <center> <asp:Label ID="lblHeading" Text="BOOK CAB" runat="server" Font-Bold="true" Font-Underline="true" Font-Size="X-Large"></asp:Label></center>

                <table class="auto-style1">
                    <tr>
                        <td>
                            <asp:Label ID="lblUserName" runat="server" Text="Name"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCity" runat="server" Text="Select City"></asp:Label></td>
                        <td>
                            <asp:DropDownList
                                ID="ddlCity"
                                runat="server"
                                AutoPostBack="true"
                                OnSelectedIndexChanged="ddlCity_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator
                                ID="rValidationCity"
                                ValidationGroup="aa"
                                runat="server"
                                InitialValue="-1"
                                ControlToValidate="ddlCity"
                                ErrorMessage="Select City">

                            </asp:RequiredFieldValidator>

                        </td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCabType" runat="server" Text="Select Cab"></asp:Label></td>
                        <td>
                            <asp:DropDownList ID="ddlCabType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCabType_SelectedIndexChanged"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rValidationCabType" InitialValue="-1" ValidationGroup="aa" runat="server" ControlToValidate="ddlCabType" ErrorMessage="Select Cab"></asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPickUp" runat="server" Text="Pick Up"></asp:Label></td>
                        <td>
                            <asp:DropDownList ID="ddlPickUp" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPickUp_SelectedIndexChanged"></asp:DropDownList>
                            <asp:RequiredFieldValidator
                                ID="rValidationPickUp"
                                ValidationGroup="aa"
                                runat="server"
                                InitialValue="-1"
                                ControlToValidate="ddlPickUp"
                                ErrorMessage="Select Pick-Up Area">
                            </asp:RequiredFieldValidator>

                        </td>
                        <td>
                            <asp:Label ID="lblDrop" runat="server" Text="Drop"></asp:Label></td>
                        <td>
                            <asp:DropDownList ID="ddlDrop" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDrop_SelectedIndexChanged"></asp:DropDownList>
                            <asp:RequiredFieldValidator
                                ID="rValidationDrop"
                                ValidationGroup="aa"
                                runat="server"
                                InitialValue="-1"
                                ControlToValidate="ddlDrop"
                                ErrorMessage="Select Drop Area">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblDate" runat="server" Text="Date"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtDate" runat="server" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="rValidationDate"
                                ValidationGroup="aa"
                                runat="server"
                                ControlToValidate="txtDate"
                                ErrorMessage="Enter Date">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblTime" runat="server" Text="Time"></asp:Label></td>
                        <td>
                            <asp:DropDownList ID="ddlTime" runat="server" OnSelectedIndexChanged="ddlTime_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem>00:00 AM</asp:ListItem>
                                <asp:ListItem>00:30 AM</asp:ListItem>
                                <asp:ListItem>01:00 AM</asp:ListItem>
                                <asp:ListItem>01:30 AM</asp:ListItem>
                                <asp:ListItem>02:00 AM</asp:ListItem>
                                <asp:ListItem>02:30 AM</asp:ListItem>
                                <asp:ListItem>03:00 AM</asp:ListItem>
                                <asp:ListItem>03:30 AM</asp:ListItem>
                                <asp:ListItem>04:00 AM</asp:ListItem>
                                <asp:ListItem>04:30 AM</asp:ListItem>
                                <asp:ListItem>05:00 AM</asp:ListItem>
                                <asp:ListItem>05:30 AM</asp:ListItem>
                                <asp:ListItem>06:00 AM</asp:ListItem>
                                <asp:ListItem>06:30 AM</asp:ListItem>
                                <asp:ListItem>07:00 AM</asp:ListItem>
                                <asp:ListItem>07:30 AM</asp:ListItem>
                                <asp:ListItem>08:00 AM</asp:ListItem>
                                <asp:ListItem>08:30 AM</asp:ListItem>
                                <asp:ListItem>09:00 AM</asp:ListItem>
                                <asp:ListItem>09:30 AM</asp:ListItem>
                                <asp:ListItem>10:00 AM</asp:ListItem>
                                <asp:ListItem>10:30 AM</asp:ListItem>
                                <asp:ListItem>11:00 AM</asp:ListItem>
                                <asp:ListItem>11:30 AM</asp:ListItem>
                                <asp:ListItem>12:00 PM</asp:ListItem>
                                <asp:ListItem>12:30 PM</asp:ListItem>
                                <asp:ListItem>01:00 PM</asp:ListItem>
                                <asp:ListItem>01:30 PM</asp:ListItem>
                                <asp:ListItem>02:00 PM</asp:ListItem>
                                <asp:ListItem>02:30 PM</asp:ListItem>
                                <asp:ListItem>03:00 PM</asp:ListItem>
                                <asp:ListItem>03:30 PM</asp:ListItem>
                                <asp:ListItem>04:00 PM</asp:ListItem>
                                <asp:ListItem>04:30 PM</asp:ListItem>
                                <asp:ListItem>05:00 PM</asp:ListItem>
                                <asp:ListItem>05:30 PM</asp:ListItem>
                                <asp:ListItem>06:00 PM</asp:ListItem>
                                <asp:ListItem>06:30 PM</asp:ListItem>
                                <asp:ListItem>07:00 PM</asp:ListItem>
                                <asp:ListItem>07:30 PM</asp:ListItem>
                                <asp:ListItem>08:00 PM</asp:ListItem>
                                <asp:ListItem>08:30 PM</asp:ListItem>
                                <asp:ListItem>09:00 PM</asp:ListItem>
                                <asp:ListItem>09:30 PM</asp:ListItem>
                                <asp:ListItem>10:00 PM</asp:ListItem>
                                <asp:ListItem>10:30 PM</asp:ListItem>
                                <asp:ListItem>11:00 PM</asp:ListItem>
                                <asp:ListItem>11:30 PM</asp:ListItem>

                            </asp:DropDownList>
                            <asp:RequiredFieldValidator
                                ID="rValidationTime"
                                ValidationGroup="aa"
                                runat="server"
                                ControlToValidate="ddlTime"
                                ErrorMessage="Enter Time">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPrice" runat="server" Text="Price"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtPrice" runat="server" ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button ID="btnDone" runat="server" ValidationGroup="aa" Text="Done" OnClick="btnDone_Click" /></td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>

