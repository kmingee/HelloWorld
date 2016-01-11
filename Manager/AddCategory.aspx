<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddCategory.aspx.cs" Inherits="Manager_AddCategory" %>

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
            width: 125px;
        }
        .style3
        {
            font-size: larger;
            height: 22px;
            width: 296px;
        }
        .style4
        {
            width: 125px;
            height: 22px;
        }
        .style5
        {
            height: 22px;
        }
        .style6
        {
            width: 125px;
            height: 20px;
        }
        .style7
        {
            height: 20px;
        }
        .style8
        {
            width: 296px;
        }
        .style9
        {
            height: 20px;
            width: 296px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="style1">
        <tr>
            <td class="style4">
            </td>
            <td class="style3">
                <strong>论坛类别添加主页面</strong></td>
            <td class="style5">
            </td>
        </tr>
        <tr>
            <td class="style2">
                论坛名称：</td>
            <td class="style8">
                <asp:TextBox ID="TextBox1" runat="server" Width="300px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox1" ErrorMessage="论坛名称不能为空" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
                论坛描述信息：</td>
            <td class="style9">
                <asp:TextBox ID="TextBox2" runat="server" Height="142px" TextMode="MultiLine" 
                    Width="300px"></asp:TextBox>
            </td>
            <td class="style7">
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="论坛描述信息不能为空" ForeColor="Red" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style8">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="添加类别" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style8">
                <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Label" 
                    Visible="False"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style8">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <div>
    
    </div>
    </form>
</body>
</html>
