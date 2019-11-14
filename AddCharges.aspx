<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="AddCharges.aspx.cs" Inherits="AddCharges" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="Css/Style.css" rel="stylesheet" />
    <div class="login-box">
        <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <center> <asp:Label ID="lblHeading" Text="Charges" runat="server" Font-Bold="true" Font-Underline="true" Font-Size="X-Large"></asp:Label></center>
                <br />
                <br />
                           <center><asp:Label ID="lblError" runat="server"></asp:Label></center>
                <br />
                <table class="auto-style1">
                    <tr>
                        <td>
                            <asp:Label ID="lblCity" runat="server" Text="Select City"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlCity" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCity_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rValidationCity" ValidationGroup="aa" runat="server" ControlToValidate="ddlCity" ErrorMessage="Select City"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPickUp" runat="server" Text="Pick Up"></asp:Label></td>
                        <td>
                            <asp:DropDownList ID="ddlFrom" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFrom_SelectedIndexChanged"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rvalidatonFrom" ValidationGroup="aa" runat="server" ControlToValidate="ddlFrom" ErrorMessage="Select From Location"></asp:RequiredFieldValidator>

                        </td>

                        <td>
                            <asp:Label ID="lblDrop" runat="server" Text="Drop"></asp:Label></td>
                        <td>
                            <asp:DropDownList ID="ddlTo" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlTo_SelectedIndexChanged"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rvalidatonTo" ValidationGroup="aa" runat="server" ControlToValidate="ddlTo" ErrorMessage="Select To Location"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblDistance" runat="server" Text="Distance"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtDistance" runat="server" EnableViewState="true"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rvalidationDistance"
                                ValidationGroup="aa"
                                runat="server"
                                ControlToValidate="txtDistance"
                                ErrorMessage="Enter Value">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblDayPrice" runat="server" Text="Day-Price"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtDayPrice" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rvalidatorDayPrice"
                                ValidationGroup="aa"
                                runat="server"
                                ControlToValidate="txtDayPrice"
                                ErrorMessage="Enter Price">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblNightPrice" runat="server" Text="Night-Price"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNightPrice" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rvalidatorNightPrice"
                                ValidationGroup="aa"
                                runat="server"
                                ControlToValidate="txtNightPrice"
                                ErrorMessage="Enter Price">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnDone" runat="server" ValidationGroup="aa" Text="Done" OnClick="btnDone_Click" />
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>

        <asp:GridView ID="gvData" runat="server" AutoGenerateColumns="true">
        </asp:GridView>

    </div>
</asp:Content>

<%--OnRowDataBound="gvData_RowDataBound" OnRowCancelingEdit="gvData_RowCancelingEdit" OnRowDeleting="gvData_RowDeleting" OnRowEditing="gvData_RowEditing" OnRowUpdating="gvData_RowUpdating"--%>