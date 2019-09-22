<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddCab.aspx.cs" Inherits="AddCab" %>

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
        <center> <asp:Label ID="lblHeading" Text="ADD CAB" runat="server" Font-Bold="true" Font-Underline="true" Font-Size="X-Large"></asp:Label></center>
        <br />
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:Label ID="lblCabNo" runat="server" Text="Cab Number"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtCabNo" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="fieldValidationCabNo"
                        runat="server"
                        ControlToValidate="txtCabNo"
                        ErrorMessage="Enter Cab Number">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCabName" runat="server" Text="Cab Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtCabName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="fieldValidationCabName"
                        runat="server"
                        ControlToValidate="txtCabName"
                        ErrorMessage="Enter Cab Name">
                    </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator
                        ID="validationCity"
                        runat="server"
                        ErrorMessage="Only characters allowed"
                        ControlToValidate="txtCabName"
                        ValidationExpression="^[A-Za-z]*$" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCabType" runat="server" Text="Cab Type"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlCabType" runat="server" AutoPostBack="true">
                        <asp:ListItem>Non-AC</asp:ListItem>
                        <asp:ListItem>AC</asp:ListItem>
                    </asp:DropDownList></td>
                <asp:RequiredFieldValidator
                    ID="fieldValidationCabType"
                    runat="server"
                    ControlToValidate="ddlCabType"
                    ErrorMessage="Please select Cab">
                </asp:RequiredFieldValidator>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPerCapacity" runat="server" Text="Person Capacity"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPerCapacity" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="fieldValidationPCapacity"
                        runat="server"
                        ControlToValidate="txtPerCapacity"
                        ErrorMessage="Enter Person Capacity">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblLuggCapacity" runat="server" Text="Luggage Capacity"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtLuggCapacity" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="fieldValidationLCapacity"
                        runat="server"
                        ControlToValidate="txtLuggCapacity"
                        ErrorMessage="Please Enter Lugg Capacity">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPricePerKm" runat="server" Text="Price Per KM"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPricePerKm" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="fieldValidationPPkm"
                        runat="server"
                        ControlToValidate="txtPricePerKm"
                        ErrorMessage="Enter Price per Km">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblWorkCity" runat="server" Text="Working City"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlCity" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator
                        ID="fieldValidationCity"
                        runat="server"
                        ControlToValidate="ddlCity"
                        ErrorMessage="Select City">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <br />

        <asp:Button ID="btnAddCab" runat="server" Text="Add Cab" OnClick="btnAddCab_Click" />
    </div>
</asp:Content>

