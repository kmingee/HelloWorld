<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditCategory.aspx.cs" Inherits="Manager_EditCategory" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-size: larger;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="style1">
    
        <strong>编辑论坛的类别</strong></div>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="CategoryID" 
        DataSourceID="LocalSqlServer">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="CategoryName" HeaderText="论坛名称" 
                SortExpression="CategoryName" />
            <asp:BoundField DataField="CategoryDes" HeaderText="论坛描述" 
                SortExpression="CategoryDes" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="LocalSqlServer" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BBSConnectionString %>" 
        DeleteCommand="DELETE FROM [BBSCategory] WHERE [CategoryID] = @CategoryID" 
        InsertCommand="INSERT INTO [BBSCategory] ([CategoryName], [CategoryDes]) VALUES (@CategoryName, @CategoryDes)" 
        SelectCommand="SELECT [CategoryName], [CategoryDes], [CategoryID] FROM [BBSCategory]" 
        UpdateCommand="UPDATE [BBSCategory] SET [CategoryName] = @CategoryName, [CategoryDes] = @CategoryDes WHERE [CategoryID] = @CategoryID">
        <DeleteParameters>
            <asp:Parameter Name="CategoryID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CategoryName" Type="String" />
            <asp:Parameter Name="CategoryDes" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CategoryName" Type="String" />
            <asp:Parameter Name="CategoryDes" Type="String" />
            <asp:Parameter Name="CategoryID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
