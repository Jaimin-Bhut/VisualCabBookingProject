﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserSignUp.aspx.cs" Inherits="UserSignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="Css/Style.css" rel="stylesheet" />
    <div class="login-box">
        <center> <h1><asp:Label ID="lblHeading" Text="USER SIGN UP" runat="server" Font-Bold="true" Font-Underline="true" Font-Size="X-Large"></asp:Label></h1></center>
        <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                        <center><asp:Label ID="lblMessage" runat="server" Text=""></asp:Label></center>


                <table class="auto-style1">
                    <tr>
                        <td>
                            <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="ValidationName"
                                runat="server"
                                ValidationGroup="aa"
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
                            <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="validationAddress"
                            runat="server"
                            ValidationGroup="aa"
                            ControlToValidate="txtAddress"
                            ErrorMessage="* Enter Address">
                        </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label></td>

                        <td>
                            <asp:DropDownList ID="ddlCity" runat="server"></asp:DropDownList>
                            <asp:RequiredFieldValidator
                                ID="validationCity"
                                runat="server"
                                ValidationGroup="aa"
                                ControlToValidate="ddlCity"
                                InitialValue="-1"
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
                                ValidationGroup="aa"
                                ControlToValidate="txtContactNo"
                                ErrorMessage="* Enter Contact Number" />
                            <asp:RegularExpressionValidator
                                ID="rvalidationContactNumber"
                                runat="server"
                                ErrorMessage="Only characters allowed"
                                ControlToValidate="txtContactNo"
                                ValidationExpression="^[7-9]\d{9}$">
                            </asp:RegularExpressionValidator>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label></td>

                        <td>
                            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="validationEmail"
                                runat="server"
                                ValidationGroup="aa"
                                ControlToValidate="txtEmail"
                                ErrorMessage="* Enter Email" />
                            <asp:RegularExpressionValidator
                                ID="rvalidationEmail"
                                runat="server"
                                ErrorMessage="Enter Valid Email"
                                ControlToValidate="txtEmail"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                            </asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="validationPassword"
                                runat="server"
                                ValidationGroup="aa"
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
                            <asp:TextBox ID="txtCPassword" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="validationCPassword"
                                runat="server"
                                ValidationGroup="aa"
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
                            <asp:Button ID="btnSubmit" ValidationGroup="aa" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>

