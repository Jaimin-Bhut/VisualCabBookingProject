<%@ Page Title="USER SING IN" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserSignIn.aspx.cs" Inherits="UserSignIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="Css/Login.css" rel="stylesheet" />
    <br />
    <br />
    <div class="box">
        <br />
        <asp:TextBox CssClass="text" ID="txtEmail" runat="server" placeholder="Username"></asp:TextBox>
    <h5>    <asp:RequiredFieldValidator ID="fieldValidationEmail" runat="server" ErrorMessage="Please Enter Email" ControlToValidate="txtEmail" ValidationGroup="aa"></asp:RequiredFieldValidator></h5>
  
        <asp:TextBox CssClass="password" ID="txtPass" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
        <h5><asp:RequiredFieldValidator ID="fieldValidationPassword" runat="server" ErrorMessage="Please Enter Password" ControlToValidate="txtPass" ValidationGroup="aa"></asp:RequiredFieldValidator></h5>

        <asp:Button CssClass="button1" runat="server" Text="SIGN IN" ValidationGroup="aa" ID="btnSignIn" OnClick="btnSignIn_Click"/>

        <asp:HyperLink ID="linkSignUp" runat="server" NavigateUrl="~/UserSignUp.aspx">No Account?SIGN UP</asp:HyperLink>
            </div>
    </asp:Content>
