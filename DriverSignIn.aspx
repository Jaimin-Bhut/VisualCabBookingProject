<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DriverSignIn.aspx.cs" Inherits="DriverSingIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="Css/Login.css" rel="stylesheet" />
    <div class="box">
                <center> <h1><asp:Label ID="lblHeading" Text="DRIVER SIGN IN" runat="server" Font-Bold="true" Font-Underline="true" Font-Size="X-Large"></asp:Label></h1></center>
        <asp:TextBox CssClass="text" ID="txtEmail" runat="server" placeholder="Username"></asp:TextBox>
    <h5>    <asp:RequiredFieldValidator ID="fieldValidationEmail" runat="server" ErrorMessage="Please Enter Email" ControlToValidate="txtEmail"></asp:RequiredFieldValidator></h5>
      
        <asp:TextBox CssClass="password" ID="txtPass" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox> 
        <h5><asp:RequiredFieldValidator ID="fieldValidationPassword" runat="server" ErrorMessage="Please Enter Password" ControlToValidate="txtPass"></asp:RequiredFieldValidator></h5>
        <asp:Button  CssClass="button1" runat="server" Text="SIGN IN" ID="btnSignIn" OnClick="btnSignIn_Click"/>
    </div>
</asp:Content>

