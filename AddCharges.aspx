﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="AddCharges.aspx.cs" Inherits="AddCharges" %>

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

        <asp:GridView ID="gvData" DataKeyNames="Distance_id" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvData_RowDataBound" OnRowCancelingEdit="gvData_RowCancelingEdit" OnRowDeleting="gvData_RowDeleting" OnRowEditing="gvData_RowEditing" OnRowUpdating="gvData_RowUpdating">
            <Columns>
                <asp:TemplateField HeaderText="Id" Visible="false">
                    <ItemTemplate>
                        <asp:HiddenField ID="hiddenId" Value='<%# Eval("Distance_id") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="City" ControlStyle-Font-Size="Smaller">
                    <ItemTemplate>
                        <asp:Label ID="gvlblCity" runat="server" Text='<%# Eval("City_id") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="gvddlCity" runat="server" OnSelectedIndexChanged="gvddlCity_SelectedIndexChanged"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="gvfieldValidationCity"
                            runat="server"
                            ControlToValidate="gvddlCity"
                            ValidationGroup="bb"
                            ErrorMessage="Select To location" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="From" ControlStyle-Font-Size="Smaller">
                    <ItemTemplate>
                        <asp:Label ID="gvlblFrom" runat="server" Text='<%# Eval("Area") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="gvddlFrom" runat="server"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="gvfieldValidationFrom"
                            runat="server"
                            ControlToValidate="gvddlFrom"
                            ValidationGroup="bb"
                            ErrorMessage="Select From location" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="To" ControlStyle-Font-Size="Smaller">
                    <ItemTemplate>
                        <asp:Label ID="gvlblTo" runat="server" Text='<%# Eval("Area") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="gvddlTo" runat="server"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="gvfieldValidationTo"
                            runat="server"
                            ControlToValidate="gvddlTo"
                            ValidationGroup="bb"
                            ErrorMessage="Select To location">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Distance" ControlStyle-Font-Size="Smaller">
                    <ItemTemplate>
                        <asp:Label ID="gvlblDistance" runat="server" Text='<%# Eval("Distance") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="gvtxtDistance" runat="server" Text='<%# Eval("Distance") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="gvfieldValidationDistance"
                            runat="server"
                            ValidationGroup="bb"
                            ControlToValidate="gvtxtDistance"
                            ErrorMessage="Enter Distance">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Day-Price" ControlStyle-Font-Size="Smaller">
                    <ItemTemplate>
                        <asp:Label ID="gvlblDayPrice" runat="server" Text='<%# Eval("DayPrice") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="gvtxtDayPrice" runat="server" Text='<%# Eval("DayPrice") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="gvfieldValidationDayPrice"
                            runat="server"
                            ValidationGroup="bb"
                            ControlToValidate="gvtxtDayPrice"
                            ErrorMessage="Enter Price">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Night-Price" ControlStyle-Font-Size="Smaller">
                    <ItemTemplate>
                        <asp:Label ID="gvlblNightPrice" runat="server" Text='<%# Eval("NightPrice") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="gvtxtNightPrice" runat="server" Text='<%# Eval("NightPrice") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="gvfieldValidationNightPrice"
                            runat="server"
                            ValidationGroup="bb"
                            ControlToValidate="gvtxtNightPrice"
                            ErrorMessage="Enter Price">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" ValidationGroup="bb" runat="server" ImageUrl="~/icon/edit_icon.png" BackColor="White" CommandName="Edit" ToolTip="Edit" Height="16px" Width="16px"></asp:ImageButton>
                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/icon/delete_icon.png" BackColor="White" CommandName="Delete" ToolTip="Delete" Height="16px" Width="16px"></asp:ImageButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton ID="ImageButton3" ValidationGroup="bb" runat="server" ImageUrl="~/icon/update_icon.png" BackColor="White" CommandName="Update" ToolTip="Update" Height="16px" Width="16px"></asp:ImageButton>
                        <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/icon/cancel.png" BackColor="White" CommandName="Cancel" ToolTip="Cencle" Height="16px" Width="16px"></asp:ImageButton>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

    </div>
</asp:Content>

