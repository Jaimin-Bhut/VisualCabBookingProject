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
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
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
                    <%-- <tr>
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
                    </tr>--%>
                    <tr>
                        <td>
                            <asp:Label ID="lblWorkCity" runat="server" Text="Working City"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlCity" runat="server" AutoPostBack="true"></asp:DropDownList>
                            <asp:RequiredFieldValidator
                                ID="fieldValidationCity"
                                runat="server"
                                ControlToValidate="ddlCity"
                                ErrorMessage="Select City">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                <asp:Button ID="btnAddCab" runat="server" Text="Add Cab" OnClick="btnAddCab_Click" />

                        </td>
                    </tr>
                </table>
                <asp:GridView ID="gvData" DataKeyNames="Cab_id" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvData_RowDataBound" OnRowCancelingEdit="gvData_RowCancelingEdit" OnRowDeleting="gvData_RowDeleting" OnRowEditing="gvData_RowEditing" OnRowUpdating="gvData_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderText="Id" Visible="false">
                            <ItemTemplate>
                                <asp:HiddenField ID="hiddenId" Value='<%# Eval("Cab_id") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cab-Name" ControlStyle-Font-Size="Smaller">
                            <ItemTemplate>
                                <asp:Label ID="gvlblCity" runat="server" Text='<%# Eval("Cab_name") %>'></asp:Label>
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
                                    ControlToValidate="gvtxtPrice"
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
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

