<%@ Page Title="ADD CITY" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddCity.aspx.cs" Inherits="AddCity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <link href="Css/Style.css" rel="stylesheet" />
    <div class="login-box">
        <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <center> <asp:Label ID="lblHeading" Text="ADD CITY" runat="server" Font-Bold="true" Font-Underline="true" Font-Size="X-Large"></asp:Label></center>
                <br />
                <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
                <asp:DropDownList runat="server"
                    ID="ddlState"
                    AutoPostBack="true"
                    OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:RequiredFieldValidator
                    ID="fieldValidationState"
                    runat="server"
                    ValidationGroup="btnAddCity"
                    ControlToValidate="ddlState"
                    ErrorMessage="Enter City">
                </asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
                <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rValidationCity"
                    runat="server"
                    ValidationGroup="btnAddCity"
                    ControlToValidate="txtCity"
                    ErrorMessage="* Enter City">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator
                    ID="validationCity"
                    runat="server"
                    ErrorMessage="Only characters allowed"
                    ControlToValidate="txtCity"
                    ValidationExpression="^[A-Za-z ]*$">
                </asp:RegularExpressionValidator>
                <br />
                <br />
                <asp:Button ID="btnAddCity" runat="server" Text="Add City" OnClientClick="return confirm('sure?');" OnClick="btnAddCity_Click" Style="height: 29px" />
                <br />
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:GridView ID="gvData" DataKeyNames="Id" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvData_RowDataBound" OnRowCancelingEdit="gvData_RowCancelingEdit" OnRowDeleting="gvData_RowDeleting" OnRowEditing="gvData_RowEditing" OnRowUpdating="gvData_RowUpdating">
            <Columns>
                <asp:TemplateField HeaderText="Id" Visible="false" ControlStyle-Font-Size="Smaller">
                    <ItemTemplate>
                        <asp:Label ID="lid" runat="server" Text='<%# Eval("Id") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="State" ControlStyle-Font-Size="Smaller">
                    <ItemTemplate>
                        <asp:Label ID="lblState" runat="server" Text='<%# Eval("State") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList runat="server" ID="eddlState">
                            <asp:ListItem Text="--Select--" Value="0" Selected="True" />
                            <asp:ListItem Text="GUJRAT" Value="21" />
                            <asp:ListItem Text="MAHARASHTRA" Value="22" />
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="City" ControlStyle-Font-Size="Smaller">
                    <ItemTemplate>
                        <asp:Label ID="lblCity" runat="server" Text='<%# Eval("City") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGCity" runat="server" Text='<%# Eval("City") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ControlStyle-Font-Size="Smaller">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/icon/edit_icon.png" BackColor="White" CommandName="Edit" ToolTip="Edit" Height="16px" Width="16px"></asp:ImageButton>
                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/icon/delete_icon.png" BackColor="White" CommandName="Delete" ToolTip="Delete" Height="16px" Width="16px"></asp:ImageButton>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/icon/update_icon.png" BackColor="White" CommandName="Update" ToolTip="Update" Height="16px" Width="16px"></asp:ImageButton>
                        <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/icon/cancel.png" BackColor="White" CommandName="Cancel" ToolTip="Cencle" Height="16px" Width="16px"></asp:ImageButton>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

