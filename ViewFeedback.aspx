<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="ViewFeedback.aspx.cs" Inherits="ViewBill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="Css/Style.css" rel="stylesheet" />

    <div class="login-box">
        <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <center> <asp:Label ID="lblHeading" Text="User Feedback" runat="server" Font-Bold="true" Font-Underline="true" Font-Size="X-Large"></asp:Label></center>
                <br />
                <asp:GridView ID="gvData" DataKeyNames="Feedback_id" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="Id" Visible="false">
                            <ItemTemplate>
                                <asp:HiddenField ID="hiddenId" Value='<%# Eval("Feedback_id") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User Id" ControlStyle-Font-Size="Smaller">
                            <ItemTemplate>
                                <asp:Label ID="gvlblUserId" runat="server" Text='<%# Eval("User_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User Name" ControlStyle-Font-Size="Smaller">
                            <ItemTemplate>
                                <asp:Label ID="gvlblUserName" runat="server" Text='<%# Eval("User_name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date" ControlStyle-Font-Size="Smaller">
                            <ItemTemplate>
                                <asp:Label ID="gvlblDate" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Feedback" ControlStyle-Font-Size="Smaller">
                            <ItemTemplate>
                                <asp:Label ID="gvlblFeedback" runat="server" Text='<%# Eval("Comment") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>

