<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SendMsg.aspx.cs" Inherits="SendMsg" %>

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
            width: 114px;
        }
        .style4
        {
            width: 114px;
            height: 20px;
        }
        .style5
        {
            height: 20px;
        }
        .style6
        {
            height: 20px;
            width: 295px;
        }
        .style7
        {
            width: 295px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="style1">
    
        <strong>发帖<br />
        </strong>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx" 
            style="font-size: medium">返回</asp:HyperLink>
    </div>
    <table class="style2">
        <tr>
            <td class="style4">
                帖子主题</td>
            <td class="style6">
                <asp:TextBox ID="TextBox1" runat="server" Width="300px"></asp:TextBox>
            </td>
            <td class="style5">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox1" ErrorMessage="帖子主题必须填写" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                帖子内容</td>
            <td class="style7">
                <asp:TextBox ID="TextBox2" runat="server" Height="150px" TextMode="MultiLine" 
                    Width="300px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="帖子内容必须填写" ForeColor="Red" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style7">
                &nbsp;
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="CategoryName" 
                    DataValueField="CategoryID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:BBSConnectionString %>" 
                    SelectCommand="SELECT * FROM [BBSCategory]"></asp:SqlDataSource>
&nbsp;<asp:Button ID="Button1" runat="server" Text="发帖" onclick="Button1_Click" Height="21px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style7">
                <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Label" 
                    Visible="False"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    </form>
</body>
</html>
