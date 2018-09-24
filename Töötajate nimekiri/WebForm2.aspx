<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Töötajate_nimekiri.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView  ID="adminView" runat="server" AutoGenerateColumns="False" ShowFooter="true" DataKeyNames="Id" CellPadding="4" 
            ShowHeaderWhenEmpty="true"
            OnRowCommand="adminView_RowCommand" OnRowEditing="adminView_RowEditing" OnRowCancelingEdit="adminView_RowCancelingEdit"
            OnRowUpdating="adminView_RowUpdating" OnRowDeleting="adminView_RowDeleting"
            BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px">

            <FooterStyle BackColor="white" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />

            <Columns>
                <asp:TemplateField HeaderText="Nimi">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Nimi") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNimi" Text='<%# Eval("Nimi") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNimiFooter"  runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Sünnikuupäev">
                    <ItemTemplate>
                        <asp:Label Text='<%#((DateTime)Eval("Sünnikuupäev")).ToString("dd/MM/yyyy") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox  ID="txtSünnikuupäev" Text='<%# Eval("Sünnikuupäev") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox placeholder="mm/dd/yyyy" ID="txtSünnikuupäevFooter"  runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Amet">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Amet") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAmet" Text='<%# Eval("Amet") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtAmetFooter"  runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Osakond">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("Osakond") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtOsakond" Text='<%# Eval("Osakond") %>' runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtOsakondFooter"  runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ImageUrl="~/images/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px"/>
                        <asp:ImageButton ImageUrl="~/images/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px"/>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton ImageUrl="~/images/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px"/>
                        <asp:ImageButton ImageUrl="~/images/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px"/>

                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:ImageButton ImageUrl="~/images/addnew.png" runat="server" CommandName="Addnew" ToolTip="Addnew" Width="20px" Height="20px"/>

                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:Label ID="lblSuccessMessage" text="" runat="server" ForeColor="Green"/>
        <br />
        <asp:Label ID="lblErrorMessage" text="" runat="server" ForeColor="Red"/>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Selle nädala sünnipäevalised" />
        </p>
    </form>
</body>
</html>
