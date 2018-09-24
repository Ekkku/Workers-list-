<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Töötajate_nimekiri.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnect %>" SelectCommand="select * from [workers] where ABS(DATEDIFF(day, DATEFROMPARTS ( YEAR(getdate()), MONTH(Sünnikuupäev), DAY(Sünnikuupäev) ), GETDATE())) <= 3 OR ABS(DATEDIFF(day, DATEFROMPARTS ( YEAR(getdate())+1, MONTH(Sünnikuupäev), DAY(Sünnikuupäev) ), GETDATE())) <= 3 OR ABS(DATEDIFF(day, DATEFROMPARTS ( YEAR(getdate())-1, MONTH(Sünnikuupäev), DAY(Sünnikuupäev) ), GETDATE())) <= 3 "></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px">
            <Columns>
                <asp:BoundField HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Nimi" HeaderText="Nimi" SortExpression="Nimi" />
                <asp:BoundField DataField="Sünnikuupäev"  HeaderText="Sünnikuupäev" SortExpression="Sünnikuupäev" DataFormatString="{0:dd/MM}"/>
                <asp:BoundField DataField="Amet" HeaderText="Amet" SortExpression="Amet" />
                <asp:BoundField DataField="Osakond" HeaderText="Osakond" SortExpression="Osakond" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Lisa uus töötaja" />
        <p>
            <asp:TextBox ID="TextOtsi" runat="server"></asp:TextBox>
            <asp:Button ID="ButtonOtsi" runat="server" style="height: 29px" Text="Leia osakond" OnClick="ButtonOtsi_Click" />
        </p>
    </form>
</body>
</html>
