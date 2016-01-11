<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContentList.aspx.cs" Inherits="ContentList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-size: xx-large;
        }
        .style2
        {
            width: 100%;
        }
        .style3
        {
            width: 739px;
            font-size: medium;
        }
        .style4
        {
            font-size: smaller;
        }
        .style5
        {
            font-size: medium;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="style1">
    
        <strong>帖子<br style="font-size: xx-small" />
        </strong>
        <table class="style2">
            <tr class="style4">
                <td class="style3">
                    &nbsp;</td>
                <td class="style5">
                    <asp:HyperLink ID="HyperLink2" runat="server">回复主题</asp:HyperLink>
                </td>
            </tr>
        </table>
    </div>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="XmlDataSource1" 
        onselectedindexchanged="DataList1_SelectedIndexChanged" Width="465px">
        <HeaderTemplate><b>帖子详细内容</b><table></HeaderTemplate>
        <ItemTemplate>
        <tr>
        <td>主题：<b><%#XPath("title") %></b></td>
        <td>发帖人：<%#XPath("postuser") %></td>
        </tr>
        <tr><td colspan="2">发帖时间：<%#XPath("posttime") %></td></tr>
        <tr><td></td></tr>
        <tr><td colspan="2"><%#XPath("content") %></td></tr>
        <br />
        </ItemTemplate>
        <FooterTemplate></table></FooterTemplate>
    </asp:DataList>
    <asp:XmlDataSource ID="XmlDataSource1" runat="server"></asp:XmlDataSource>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </form>
</body>
</html>
