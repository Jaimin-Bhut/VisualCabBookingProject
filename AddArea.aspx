<%@ Page Title="ADD AREA" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddArea.aspx.cs" Inherits="AddArea" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="contentAddArea" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <link href="Css/Style.css" rel="stylesheet" />
    <div class="login-box">
        <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <center> <asp:Label ID="lblHeading" Text="ADD AREA" runat="server" Font-Bold="true" Font-Underline="true" Font-Size="X-Large"></asp:Label></center>
                <br />
                <table class="auto-style1">
                    <tr>
                        <td>
                            <asp:Label ID="lblState" runat="server" Text="Select State"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="fieldValidationState" ValidationGroup="btnAddArea"
                                runat="server"
                                ControlToValidate="ddlState"
                                ErrorMessage="Select State">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCity" runat="server" Text="Select City"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlCity" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCity_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rValidationCity" ValidationGroup="btnAddArea" runat="server" ControlToValidate="ddlCity" ErrorMessage="Select City"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblArea" runat="server" Text="Area Name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtArea" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rvalidationArea"
                                ValidationGroup="btnAddArea"
                                runat="server"
                                ControlToValidate="txtArea"
                                ErrorMessage="Enter Data">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
                <asp:RegularExpressionValidator
                    ID="validationArea"
                    runat="server"
                    ErrorMessage="only characters allowed"
                    ControlToValidate="txtArea"
                    ValidationExpression="^[A-Za-z ]*$">
                </asp:RegularExpressionValidator>
                <br />
                <br />
                <asp:Button ID="btnAddArea" runat="server" Text="Add Area" OnClientClick="return confirm('sure?');" OnClick="btnAddArea_Click" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:GridView ID="gvData" DataKeyNames="Id" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvData_RowDataBound" OnRowCancelingEdit="gvData_RowCancelingEdit" OnRowDeleting="gvData_RowDeleting" OnRowEditing="gvData_RowEditing" OnRowUpdating="gvData_RowUpdating">
            <Columns>
                <asp:TemplateField HeaderText="Id" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="gvlblId" Text='<%# Eval("Id") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="State">
                    <ItemTemplate>
                        <asp:Label ID="lblState" runat="server" Text='<%# Eval("State") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList runat="server" ID="eddlState" AutoPostBack="true" DataSourceID="SqlDataSource" DataTextField="State" DataValueField="Id" OnSelectedIndexChanged="eddlState_SelectedIndexChanged"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="gridfieldValidationState"
                            runat="server"
                            ControlToValidate="eddlState"
                            ErrorMessage="Select State">
                        </asp:RequiredFieldValidator>
                        <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:conString%>" ProviderName="<%$ ConnectionStrings:conString.ProviderName %>" SelectCommand="SELECT * FROM [tblState]"></asp:SqlDataSource>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="City">
                    <ItemTemplate>
                        <asp:Label ID="lblCity" runat="server" Text='<%# Eval("City") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList runat="server" ID="eddlCity" DataSourceID="SqlDataSource1" DataTextField="City" DataValueField="Id"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="gridfieldValidationCity"
                            runat="server"
                            ControlToValidate="eddlCity"
                            ErrorMessage="Select City">
                        </asp:RequiredFieldValidator>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conString%>" ProviderName="<%$ ConnectionStrings:conString.ProviderName %>" SelectCommand="SELECT * FROM [tblCity]"></asp:SqlDataSource>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Area">
                    <ItemTemplate>
                        <asp:Label ID="lblArea" runat="server" Text='<%# Eval("Area") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="etxtArea" runat="server" Text='<%# Eval("Area") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="gridfieldValidationArea"
                            runat="server"
                            ControlToValidate="etxtArea"
                            ErrorMessage="Enter Area">
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
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

