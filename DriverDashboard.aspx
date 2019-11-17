<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="DriverDashboard.aspx.cs" Inherits="DriverDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="Css/Style.css" rel="stylesheet" />
    <link href="Css/StyleSheet.css" rel="stylesheet" />
    <div>
        <table>
            <tr style="width: 1100px; height: 50px">
                <td>
                    <ul>
                        <li>
                            <asp:Button ID="btnLogOut" runat="server" CssClass="button" Text="Sign Out" OnClick="btnLogOut_Click"/>
                        </li>
                    </ul>
                </td>
            </tr>
        </table>
    </div>
    <div class="login-box">
        <asp:GridView ID="gvData" DataKeyNames="Booking_id" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvData_RowDataBound" OnRowCancelingEdit="gvData_RowCancelingEdit" OnRowDeleting="gvData_RowDeleting" OnRowEditing="gvData_RowEditing" OnRowUpdating="gvData_RowUpdating">
            <Columns>
                <asp:TemplateField HeaderText="Booking-ID" ControlStyle-Font-Size="Smaller">
                    <ItemTemplate>
                        <asp:Label ID="gvlblBookingid" runat="server" Text='<%# Eval("Booking_id") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="User-ID" ControlStyle-Font-Size="Smaller">
                    <ItemTemplate>
                        <asp:Label ID="gvlblUserId" runat="server" Text='<%# Eval("User_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cab" ControlStyle-Font-Size="Smaller">
                    <ItemTemplate>
                        <asp:Label ID="gvlblCab" runat="server" Text='<%# Eval("Cab") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Pick-Up" ControlStyle-Font-Size="Smaller">
                    <ItemTemplate>
                        <asp:Label ID="gvlblPickUp" runat="server" Text='<%# Eval("PickupArea") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Drop" ControlStyle-Font-Size="Smaller">
                    <ItemTemplate>
                        <asp:Label ID="gvlblDrop" runat="server" Text='<%# Eval("DropArea") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Date" ControlStyle-Font-Size="Smaller">
                    <ItemTemplate>
                        <asp:Label ID="gvlblDate" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Time" ControlStyle-Font-Size="Smaller">
                    <ItemTemplate>
                        <asp:Label ID="gvlblTime" runat="server" Text='<%# Eval("Time") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Distance" ControlStyle-Font-Size="Smaller">
                    <ItemTemplate>
                        <asp:Label ID="gvlblDistance" runat="server" Text='<%# Eval("Distance") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Price" ControlStyle-Font-Size="Smaller">
                    <ItemTemplate>
                        <asp:Label ID="gvlblDayPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status" ControlStyle-Font-Size="Smaller">
                    <ItemTemplate>
                        <asp:Label ID="gvlblStatus" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="gvddlStatus" runat="server">
                            <asp:ListItem Text="<---Select--->" Value="<---select--->"></asp:ListItem>
                            <asp:ListItem Text="Complate" Value="Complate"></asp:ListItem>
                            <asp:ListItem Text="Panding" Value="Panding"></asp:ListItem>
                        </asp:DropDownList>
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

