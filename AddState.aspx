<%@ Page Title="ADD STATE" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddState.aspx.cs" Inherits="AddLocatality" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <link href="Css/Style.css" rel="stylesheet" />
    <div class="login-box">
        <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <center> <asp:Label ID="lblHeading" Text="ADD STATE" runat="server" Font-Bold="true" Font-Underline="true" Font-Size="X-Large"></asp:Label></center>
                <center>   <asp:Label runat="server" Text="" ID="lblMessage"/></center>

                <br />
                <asp:Label runat="server" Text="State" ID="lblState"></asp:Label>
                <asp:TextBox runat="server" ID="txtState"></asp:TextBox>
                <asp:Button runat="server" ID="btnAddState" ValidationGroup="aa" Text="Add State" OnClick="btnAddState_Click" />
                <br />
                <asp:RequiredFieldValidator
                    ID="rValidationState"
                    runat="server"
                    ValidationGroup="aa"
                    ControlToValidate="txtState"
                    ErrorMessage="* Enter State">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator
                    ID="validationState"
                    runat="server"
                    ValidationGroup="aa"
                    ErrorMessage="only characters allowed"
                    ControlToValidate="txtState"
                    ValidationExpression="^[A-Za-z ]*$">
                </asp:RegularExpressionValidator>
                <br />
                <br />
                <asp:GridView ID="gvData" DataKeyNames="Id" runat="server" AutoGenerateColumns="False" OnRowDeleting="gvData_RowDeleting" OnRowCancelingEdit="gvData_RowCancelingEdit" OnRowEditing="gvData_RowEditing" OnRowUpdating="gvData_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderText="State" ControlStyle-Font-Size="Smaller">
                            <ItemTemplate>
                                <asp:Label ID="lblState" runat="server" Text='<%# Eval("State") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtState" runat="server" Text='<%# Eval("State") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ControlStyle-Font-Size="Smaller">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" BackColor="White" ImageUrl="~/icon/edit_icon.png" CommandName="Edit" ToolTip="Edit" Height="16px" Width="16px"></asp:ImageButton>
                                <asp:ImageButton ID="ImageButton2" runat="server" BackColor="White" ImageUrl="~/icon/delete_icon.png" CommandName="Delete" ToolTip="Delete" Height="16px" Width="16px"></asp:ImageButton>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:ImageButton ID="ImageButton3" runat="server" BackColor="White" ImageUrl="~/icon/update_icon.png" CommandName="Update" ToolTip="Update" Height="16px" Width="16px"></asp:ImageButton>
                                <asp:ImageButton ID="ImageButton4" runat="server" BackColor="White" ImageUrl="~/icon/cancel.png" CommandName="Cancel" ToolTip="Cencle" Height="16px" Width="16px"></asp:ImageButton>
                            </EditItemTemplate>

                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>

