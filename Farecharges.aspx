<%@ Page Title="FARECHARGE" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="Farecharges.aspx.cs" Inherits="Farecharges" %>

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
        <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <center> <asp:Label ID="lblHeading" Text="Farecharges" runat="server" Font-Bold="true" Font-Underline="true" Font-Size="X-Large"></asp:Label></center>
                <br />
                <table class="auto-style1">
                    <tr>
                        <td>
                            <asp:Label ID="lblB4kmDay" runat="server" Text="Before 4km Day"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtB4kmDay" runat="server" Width="85px"></asp:TextBox>
                            Rs
                    <asp:RequiredFieldValidator
                        ID="rValidationBday"
                        runat="server"
                        ValidationGroup="aa"
                        ControlToValidate="txtB4kmDay"
                        ErrorMessage="* Enter Price">
                    </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="validationBday"
                                runat="server"
                                ValidationGroup="aa"
                                ErrorMessage="Only number allowed"
                                ControlToValidate="txtB4kmDay"
                                ValidationExpression="^\d+$" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblB4kmNight" runat="server" Text="Before 4km Night"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtB4kmNight" runat="server" Width="85px"></asp:TextBox>
                            Rs
                             <asp:RequiredFieldValidator
                                 ID="rValidationBnight"
                                 runat="server"
                                 ValidationGroup="aa"
                                 ControlToValidate="txtB4kmNight"
                                 ErrorMessage="* Enter Price">
                             </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="validationBnight"
                                runat="server"
                                ValidationGroup="aa"
                                ErrorMessage="Only number allowed"
                                ControlToValidate="txtB4kmNight"
                                ValidationExpression="^\d+$" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblA4kmDay" runat="server" Text="After 4km Day"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtA4kmDay" runat="server" Width="85px"></asp:TextBox>
                            /km
                             <asp:RequiredFieldValidator
                                 ID="rvalidationAday"
                                 runat="server"
                                 ValidationGroup="aa"
                                 ControlToValidate="txtA4kmDay"
                                 ErrorMessage="* Enter Price">
                             </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="validationAday"
                                runat="server"
                                ValidationGroup="aa"
                                ErrorMessage="Only number allowed"
                                ControlToValidate="txtA4kmDay"
                                ValidationExpression="^\d+$" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblA4kmNight" runat="server" Text="After 4km Night"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtA4kmNight" runat="server" Width="85px"></asp:TextBox>
                            /km
                             <asp:RequiredFieldValidator
                                 ID="rValidationAnight"
                                 runat="server"
                                 ValidationGroup="aa"
                                 ControlToValidate="txtA4kmNight"
                                 ErrorMessage="* Enter Price">
                             </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="validationAnight"
                                runat="server"
                                ValidationGroup="aa"
                                ErrorMessage="Only number allowed"
                                ControlToValidate="txtA4kmNight"
                                ValidationExpression="^\d+$" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblWaitChargeDay" runat="server" Text="Waiting Charge Day"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtWaitChargeDay" runat="server" Width="85px"></asp:TextBox>
                            /min
                             <asp:RequiredFieldValidator
                                 ID="rValidationWday"
                                 runat="server"
                                 ValidationGroup="aa"
                                 ControlToValidate="txtWaitChargeDay"
                                 ErrorMessage="* Enter Price">
                             </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="validationWday"
                                runat="server"
                                ValidationGroup="aa"
                                ErrorMessage="Only number allowed"
                                ControlToValidate="txtWaitChargeDay"
                                ValidationExpression="^\d+$" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblWaitChargeNight" runat="server" Text="Waiting Charge Night"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtWaitChargeNight" runat="server" Width="85px"></asp:TextBox>
                            /min
                                          <asp:RequiredFieldValidator
                                              ID="rValidationWnight"
                                              runat="server"
                                              ValidationGroup="aa"
                                              ControlToValidate="txtWaitChargeNight"
                                              ErrorMessage="* Enter Price">
                                          </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="validationWnight"
                                runat="server"
                                ValidationGroup="aa"
                                ErrorMessage="Only number allowed"
                                ControlToValidate="txtWaitChargeNight"
                                ValidationExpression="^\d+$" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnDone" runat="server" ValidationGroup="aa" OnClientClick="return confirm('sure?');" Text="Done" OnClick="btnDone_Click" />

                        </td>
                    </tr>
                </table>
                <asp:GridView ID="gvData" DataKeyNames="Id" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvData_RowDataBound" OnRowCancelingEdit="gvData_RowCancelingEdit" OnRowDeleting="gvData_RowDeleting" OnRowEditing="gvData_RowEditing" OnRowUpdating="gvData_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderText="Id" Visible="false">
                            <ItemTemplate>
                                <asp:HiddenField ID="hiddenId" Value='<%# Eval("Id") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%-- <asp:TemplateField HeaderText="City" ControlStyle-Font-Size="Smaller">
                    <ItemTemplate>
                        <asp:Label ID="lblCity" runat="server" Text='<%# Eval("City") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCity" ReadOnly="true" runat="server" Text='<%# Eval("City") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>--%>
                        <asp:TemplateField HeaderText="Before 4km Day" ControlStyle-Font-Size="Smaller">
                            <ItemTemplate>
                                <asp:Label ID="lblBday" runat="server" Text='<%# Eval("Before_4km_Day") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtBday" runat="server" Text='<%# Eval("Before_4km_Day") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Before 4km Night" ControlStyle-Font-Size="Smaller">
                            <ItemTemplate>
                                <asp:Label ID="lblBnight" runat="server" Text='<%# Eval("Before_4km_Night") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtBnight" runat="server" Text='<%# Eval("Before_4km_Night") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="After 4km Day" ControlStyle-Font-Size="Smaller">
                            <ItemTemplate>
                                <asp:Label ID="lblAday" runat="server" Text='<%# Eval("after_4km_Day") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtAday" runat="server" Text='<%# Eval("after_4km_Day") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="After 4km Night" ControlStyle-Font-Size="Smaller">
                            <ItemTemplate>
                                <asp:Label ID="lblAnight" runat="server" Text='<%# Eval("after_4km_Night") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtAnight" runat="server" Text='<%# Eval("after_4km_Night") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Waiting Charge Day" ControlStyle-Font-Size="Smaller">
                            <ItemTemplate>
                                <asp:Label ID="lblWday" runat="server" Text='<%# Eval("waiting_charge_Day") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtWday" runat="server" Text='<%# Eval("waiting_charge_Day") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Waiting Charge Night" ControlStyle-Font-Size="Smaller">
                            <ItemTemplate>
                                <asp:Label ID="lblWnight" runat="server" Text='<%# Eval("waiting_charge_Night") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtWnight" runat="server" Text='<%# Eval("waiting_charge_Night") %>'></asp:TextBox>
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
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>

