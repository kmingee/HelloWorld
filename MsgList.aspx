<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MsgList.aspx.cs" Inherits="MsgList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            text-align: left;
            font-size: larger;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="style1">
    
        <strong>帖子</strong></div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="InfoID" DataSourceID="SqlDataSource1" AllowPaging="True" 
        onselectedindexchanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Title" HeaderText="帖子主题" SortExpression="Title" />
            <asp:BoundField DataField="PostUser" HeaderText="发帖人" 
                SortExpression="PostUser" />
            <asp:BoundField DataField="PostTime" HeaderText="发帖时间" 
                SortExpression="PostTime" />
            <asp:BoundField DataField="ReplyCount" HeaderText="回复数" 
                SortExpression="ReplyCount" />
            <asp:BoundField DataField="LastReplytime" HeaderText="最后回复时间" 
                SortExpression="LastReplytime" />
            <asp:BoundField DataField="FileName" SortExpression="FileName" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BBSConnectionString %>" 
        SelectCommand="SELECT * FROM [BBSInfo] WHERE ([CategoryID] = @CategoryID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="CategoryID" QueryStringField="categoryid" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
