<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserSignUp.aspx.cs" Inherits="UserSignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="Css/Style.css" rel="stylesheet" />
    <div class="login-box">

        <table class="auto-style1">
            <tr>
                <td>
                    <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="ValidationName"
                        runat="server"
                        ControlToValidate="txtName"
                        ErrorMessage="* Enter Name" />
                    <asp:RegularExpressionValidator
                        ID="rvalidationName"
                        runat="server"
                        ErrorMessage="Only characters allowed"
                        ControlToValidate="txtName"
                        ValidationExpression="^[A-Za-z]*$" />


                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox></td>
                <asp:RequiredFieldValidator
                    ID="validationAddress"
                    runat="server"
                    ControlToValidate="txtAddress"
                    ErrorMessage="* Enter Address">
                </asp:RequiredFieldValidator>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label></td>

                <td>
                    <asp:DropDownList ID="ddlCity" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator
                        ID="validationCity"
                        runat="server"
                        ControlToValidate="ddlCity"
                        ErrorMessage="* Select City">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblContactNo" runat="server" Text="Contact No"></asp:Label></td>

                <td>
                    <asp:TextBox ID="txtContactNo" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="validationContactNumber"
                        runat="server"
                        ControlToValidate="txtContactNo"
                        ErrorMessage="* Enter Contact Number" />
                    <asp:RegularExpressionValidator
                        ID="rvalidationContactNumber"
                        runat="server"
                        ErrorMessage="Only characters allowed"
                        ControlToValidate="txtContactNo"
                        ValidationExpression="^9\d{9}$">
                    </asp:RegularExpressionValidator>

                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label></td>

                <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
                <asp:RequiredFieldValidator
                    ID="validationEmail"
                    runat="server"
                    ControlToValidate="txtEmail"
                    ErrorMessage="* Enter Email" />
                <asp:RegularExpressionValidator
                    ID="rvalidationEmail"
                    runat="server"
                    ErrorMessage="Only characters allowed"
                    ControlToValidate="txtEmail"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                </asp:RegularExpressionValidator>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="validationPassword"
                        runat="server"
                        ControlToValidate="txtPassword"
                        ErrorMessage="* Enter Password">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCPassword" runat="server" Text="Confirm Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtCPassword" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="validationCPassword"
                        runat="server"
                        ControlToValidate="txtCPassword"
                        ErrorMessage="* Enter Password" />
                    <asp:CompareValidator ID="comparePasswords"
                        runat="server"
                        ControlToCompare="txtPassword"
                        ControlToValidate="txtCPassword"
                        ErrorMessage="Your passwords do not match up!"
                        Display="Dynamic" />

                </td>
            </tr>

            <tr>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

