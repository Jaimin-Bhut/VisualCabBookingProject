<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddDriver.aspx.cs" Inherits="AddDriver" %>

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

        <table class="auto-style1">
            <tr>
                <td>
                    <asp:Label ID="lblSelectPic" runat="server" Text="Driver Photo"></asp:Label></td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:RequiredFieldValidator
                        ID="validationUpload"
                        runat="server"
                        ControlToValidate="FileUpload1"
                        ErrorMessage="* Select Image">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblDriverName" runat="server" Text="Driver Name"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtDriverName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="ValidationName"
                        runat="server"
                        ControlToValidate="txtDriverName"
                        ErrorMessage="* Enter Name" />

                    <asp:RegularExpressionValidator
                        ID="validationDriverName"
                        runat="server"
                        ErrorMessage="Only characters allowed"
                        ControlToValidate="txtDriverName"
                        ValidationExpression="^[A-Za-z]*$">
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblDriverAdd" runat="server" Text="Driver Address"></asp:Label></td>

                <td>
                    <asp:TextBox ID="txtDriverAdd" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="validationAddress"
                        runat="server"
                        ControlToValidate="txtDriverAdd"
                        ErrorMessage="* Enter Address">
                    </asp:RequiredFieldValidator>
                </td>

            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblDriverCity" runat="server" Text="Driver City"></asp:Label></td>

                <td>
                    <asp:DropDownList ID="ddlCity" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCity_SelectedIndexChanged"></asp:DropDownList></td>
                <asp:RequiredFieldValidator
                    ID="validationCity"
                    runat="server"
                    ControlToValidate="ddlCity"
                    ErrorMessage="* Select City">
                </asp:RequiredFieldValidator>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblContact" runat="server" Text="Driver Contact"></asp:Label></td>

                <td>
                    <asp:TextBox ID="txtContact" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="validationContactNumber"
                        runat="server"
                        ControlToValidate="txtContact"
                        ErrorMessage="* Enter Contact Number" />

                    <asp:RegularExpressionValidator
                        ID="validationContact"
                        runat="server"
                        ErrorMessage="Only indian number allowed"
                        ControlToValidate="txtContact"
                        ValidationExpression="^9\d{9}$">
                    </asp:RegularExpressionValidator>

                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblEmail" runat="server" Text="Driver Email"></asp:Label></td>

                <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="validationEmail"
                        runat="server"
                        ControlToValidate="txtEmail"
                        ErrorMessage="* Enter Email" />
                    <asp:RegularExpressionValidator
                        ID="rvalidationEmail"
                        runat="server"
                        ErrorMessage="abc@gmail.com  pattern"
                        ControlToValidate="txtEmail"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                    </asp:RegularExpressionValidator>

                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPassword" runat="server" Text="Driver Password"></asp:Label>
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
                        ErrorMessage="* Enter Password">
                    </asp:RequiredFieldValidator>
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
                    <asp:Label ID="lblCab" runat="server" Text="Select Cab"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlCab" runat="server" AutoPostBack="true"></asp:DropDownList>

                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnAddDriver" runat="server" Text="Add Driver" OnClick="btnAddDriver_Click" />
                </td>
            </tr>
        </table>
        <asp:GridView ID="gvData" DataKeyNames="Driver_Email" runat="server" AutoGenerateColumns="False" Height="154px" OnRowCancelingEdit="gvData_RowCancelingEdit" OnRowDeleting="gvData_RowDeleting" OnRowEditing="gvData_RowEditing" OnRowUpdating="gvData_RowUpdating">
            <Columns>
                <asp:TemplateField HeaderText="Picture">
                    <ItemTemplate>
                       <asp:Image ID="img" runat="server" ImageUrl='<%# Eval("Driver_img") %>' Height="25px" Width="25px"/>
                    </ItemTemplate>
                   
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Driver Name">
                    <ItemTemplate>
                        <asp:Label ID="lblD_name" runat="server" Text='<%# Eval("Driver_Name") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtD_name" runat="server" Text='<%# Eval("Driver_Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Driver Address">
                    <ItemTemplate>
                        <asp:Label ID="lblD_address" runat="server" Text='<%# Eval("Driver_Address") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtD_address" runat="server" Text='<%# Eval("Driver_Address") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Driver City">
                    <ItemTemplate>
                        <asp:Label ID="lblD_city" runat="server" Text='<%# Eval("Driver_City") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtD_city" runat="server" Text='<%# Eval("Driver_City") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Driver Contact">
                    <ItemTemplate>
                        <asp:Label ID="lblD_contact" runat="server" Text='<%# Eval("Driver_Contact") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtD_contact" runat="server" Text='<%# Eval("Driver_Contact") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Driver Email">
                    <ItemTemplate>
                        <asp:Label ID="lblD_email" runat="server" Text='<%# Eval("Driver_Email") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtD_email" runat="server" Text='<%# Eval("Driver_Email") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cab ID">
                    <ItemTemplate>
                        <asp:Label ID="lblC_id" runat="server" Text='<%# Eval("Cab_Id") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtC_id" runat="server" Text='<%# Eval("Cab_Id") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>

                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/icon/edit_icon.png" CommandName="Edit" ToolTip="Edit" Height="16px" Width="16px"></asp:ImageButton>
                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/icon/delete_icon.png" CommandName="Delete" ToolTip="Delete" Height="16px" Width="16px"></asp:ImageButton>

                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/icon/update_icon.png" CommandName="Update" ToolTip="Update" Height="16px" Width="16px"></asp:ImageButton>
                        <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/icon/cancel.png" CommandName="Cancel" ToolTip="Cencle" Height="16px" Width="16px"></asp:ImageButton>

                    </EditItemTemplate>

                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

