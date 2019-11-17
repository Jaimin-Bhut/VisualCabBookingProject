<%@ Page Title="FEEDBACK" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <p>
         <link href="Css/Style.css" rel="stylesheet" />
         <link href="Css/StyleSheet.css" rel="stylesheet" />
    <div>
        <table>
            <tr style="width: 1100px; height: 50px">
                <td>
                    <ul>
                        <li>
                            <asp:HyperLink ID="linkHome" runat="server" Text="HOME" NavigateUrl="~/BookCabPage.aspx"></asp:HyperLink>

                        </li>
                        <li>
                            <asp:Button ID="btnLogOut" runat="server" CssClass="button" Text="Sign Out" OnClick="btnLogOut_Click" />
                        </li>
                    </ul>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div class="login-box">
                        <center> <asp:Label ID="lblHeading" Text="FEEDBACK" runat="server" Font-Bold="true" Font-Underline="true" Font-Size="X-Large"></asp:Label></center>

        <table>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblUserName" runat="server" Text="Name:"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtUserName" runat="server" ReadOnly="true"></asp:TextBox>
                    <asp:RequiredFieldValidator 
                        ID="rFieldValidationUserName" 
                        runat="server" 
                        ValidationGroup="aa"
                        ControlToValidate="txtUserName" 
                        ErrorMessage="Please enter your name"/>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblUserEmail" runat="server" Text="E-Mail:"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtUserEmail" runat="server" ReadOnly="true"></asp:TextBox>
                    <asp:RequiredFieldValidator 
                        ID="rFieldValidationUserEmail" 
                        runat="server" 
                        ValidationGroup="aa"
                        ControlToValidate="txtUserEmail" 
                        ErrorMessage="Please enter your e-mail id" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblUserFeedback" runat="server" Text="Feedback:"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtUserFeedback" runat="server" TextMode="MultiLine" Width="35%"></asp:TextBox>
                    <asp:RequiredFieldValidator 
                        ID="rFieldValidationUserFeedback" 
                        runat="server"
                        ValidationGroup="aa" 
                        ControlToValidate="txtUserFeedback" 
                        ErrorMessage="Please enter your query" 
                        ForeColor="Red"/>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style5">
                    <asp:Button ID="btnsubmit" ValidationGroup="aa" runat="server" Text="Submit" OnClick="btnsubmit_Click"/>
                </td>
            </tr>
        </table>
            </div>
    </p>
</asp:Content>

