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
                                ValidationGroup="aa"
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
                                ValidationGroup="aa"
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
                            ValidationGroup="aa"
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
                                ValidationGroup="aa"
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
                                ValidationGroup="aa"
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
                                ValidationGroup="aa"
                                ControlToValidate="ddlCity"
                                ErrorMessage="Select City">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnAddCab" runat="server" ValidationGroup="aa" Text="Add Cab" OnClick="btnAddCab_Click" />

                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:GridView ID="gvData" DataKeyNames="Cab_id" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvData_RowDataBound" OnRowCancelingEdit="gvData_RowCancelingEdit" OnRowDeleting="gvData_RowDeleting" OnRowEditing="gvData_RowEditing" OnRowUpdating="gvData_RowUpdating">
            <Columns>
                <asp:TemplateField HeaderText="Cab-No">
                    <ItemTemplate>
                        <asp:Label ID="gvlblCabId" runat="server" Text='<%# Eval("Cab_Id") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="gvtxtCabId" runat="server" Text='<%# Eval("Cab_Id") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="gvfieldValidationCabId"
                            runat="server"
                            ControlToValidate="gvtxtCabId"
                            ValidationGroup="bb"
                            ErrorMessage="Enter Cab-Id" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cab-Name" ControlStyle-Font-Size="Smaller">
                    <ItemTemplate>
                        <asp:Label ID="gvlblCabName" runat="server" Text='<%# Eval("Cab_name") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="gvtxtCabName" runat="server" Text='<%# Eval("Cab_name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="gvfieldValidationCabName"
                            runat="server"
                            ControlToValidate="gvtxtCabName"
                            ValidationGroup="bb"
                            ErrorMessage="Enter Cab-Name" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <%--<asp:TemplateField HeaderText="Cab-Name" ControlStyle-Font-Size="Smaller">
                            <ItemTemplate>
                                <asp:Label ID="gvlblCabName" runat="server" Text='<%# Eval("Cab_Type") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="gvtxtCabName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="gvfieldValidationCabName"
                                    runat="server"
                                    ControlToValidate="gvtxtCabName"
                                    ValidationGroup="bb"
                                    ErrorMessage="Enter Cab-Name" />
                            </EditItemTemplate>
                        </asp:TemplateField>--%>
                <asp:TemplateField HeaderText="Cab-Type" ControlStyle-Font-Size="Smaller">
                    <ItemTemplate>
                        <asp:Label ID="gvlblCabType" runat="server" Text='<%# Eval("Cab_type") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="gvddlCabType" runat="server">
                            <asp:ListItem Text="Ac"></asp:ListItem>
                            <asp:ListItem Text="Non-Ac"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="gvfieldValidationCabType"
                            runat="server"
                            ControlToValidate="gvddlCabType"
                            ValidationGroup="bb"
                            ErrorMessage="select Cab-Type" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Person-Capacity" ControlStyle-Font-Size="Smaller">
                    <ItemTemplate>
                        <asp:Label ID="gvlblPersonCapacity" runat="server" Text='<%# Eval("Person_capacity") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="gvtxtPersonCapacity" runat="server" Text='<%# Eval("Person_capacity") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="gvfieldValidationPersonCapacity"
                            runat="server"
                            ControlToValidate="gvtxtPersonCapacity"
                            ValidationGroup="bb"
                            ErrorMessage="Enter Person Capacity" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Lougage-Capacity" ControlStyle-Font-Size="Smaller">
                    <ItemTemplate>
                        <asp:Label ID="gvlblLougageCapacity" runat="server" Text='<%# Eval("Lougage_capacity") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="gvtxtLougageCapacity" runat="server" Text='<%# Eval("Lougage_capacity") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="gvfieldValidationLougageCapacity"
                            runat="server"
                            ControlToValidate="gvtxtLougageCapacity"
                            ValidationGroup="bb"
                            ErrorMessage="Enter Lougage-Capacity" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Working-City" ControlStyle-Font-Size="Smaller">
                    <ItemTemplate>
                        <asp:Label ID="gvlblWorkingCity" runat="server" Text='<%# Eval("City") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="gvddlWorkingCity" runat="server" AppendDataBoundItems="true"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="gvfieldValidationWorkingCity"
                            runat="server"
                            ControlToValidate="gvddlWorkingCity"
                            ValidationGroup="bb"
                            ErrorMessage="Select Working City" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status" ControlStyle-Font-Size="Smaller">
                    <ItemTemplate>
                        <asp:Label ID="gvlblStatus" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="gvddlStatus" runat="server">
                            <asp:ListItem Text="Available"></asp:ListItem>
                            <asp:ListItem Text="Booked"></asp:ListItem>

                        </asp:DropDownList>

                        <asp:RequiredFieldValidator ID="gvfieldValidationStatus"
                            runat="server"
                            ControlToValidate="gvddlStatus"
                            ValidationGroup="bb"
                            ErrorMessage="Select Status" />
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

