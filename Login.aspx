<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
        .style2
        {
            width: 100%;
            margin-right: 0px;
        }
        .style4
        {
            width: 81px;
            text-align: left;
        }
        .style5
        {
            height: 23px;
        }
        .style6
        {
            width: 81px;
            text-align: right;
            height: 23px;
        }
        .style7
        {
            height: 23px;
            width: 181px;
            text-align: left;
        }
        .style8
        {
            width: 181px;
        }
        .style9
        {
            height: 23px;
            width: 408px;
        }
        .style10
        {
            width: 408px;
        }
        .style11
        {
            width: 81px;
            text-align: right;
        }
        .style12
        {
            width: 408px;
            height: 49px;
        }
        .style13
        {
            width: 81px;
            text-align: left;
            height: 49px;
        }
        .style14
        {
            width: 181px;
            height: 49px;
        }
        .style15
        {
            height: 49px;
        }
        .style16
        {
            width: 181px;
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="style1">
    
        <strong>登录<br />
        </strong>
        <table class="style2">
            <tr>
                <td class="style9">
                </td>
                <td class="style6">
                    用户名：</td>
                <td class="style7">
                    <asp:TextBox ID="TextBox1" runat="server" 
                        style="text-align: left; margin-left: 0px" Width="148px"></asp:TextBox>
                </td>
                <td class="style5">
                </td>
            </tr>
            <tr>
                <td class="style10">
                    &nbsp;</td>
                <td class="style11">
                    密码：</td>
                <td class="style16">
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style12">
                    </td>
                <td class="style13">
                    </td>
                <td class="style14">
                    <asp:Button ID="Button1" runat="server" style="margin-left: 0px" Text="登录" 
                        Width="75px" onclick="Button1_Click" />
                </td>
                <td style="text-align: left" class="style15">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style10">
                    &nbsp;</td>
                <td class="style4">
                    <a href="reg.aspx">注册</a></td>
                <td class="style8">
                    <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Label" 
                        Visible="False"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
