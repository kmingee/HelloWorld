<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 480px;
        }
        .style3
        {
            width: 756px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td class="style2">
                    <strong>欢迎你！<asp:Label ID="Label1" runat="server" Text="Anonymous"></asp:Label>
                    </strong>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />
        <br />
    
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="LocalSqlServer">
        <HeaderTemplate>
            <table border="0" cellpadding="3" cellspacing="0" width="100%">
        </HeaderTemplate>
            <ItemTemplate>
                <tr><td><a href="MsgList.aspx?categoryid=<%# Eval("categoryid") %>"><%# Eval("categoryname") %></a></td></tr>
                <tr><td><%#Eval("categorydes") %></td></tr>
            </separatortemplate>
            </ItemTemplate>
           <FooterTemplate>
                </table>
           </FooterTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="LocalSqlServer" runat="server" 
            ConnectionString="<%$ ConnectionStrings:BBSConnectionString %>" 
            SelectCommand="SELECT * FROM [BBSCategory]"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
