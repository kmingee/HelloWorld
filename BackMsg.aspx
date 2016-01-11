<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BackMsg.aspx.cs" Inherits="BackMsg" %>

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
            width: 68px;
        }
        .style4
        {
            width: 302px;
        }
        .style5
        {
            width: 68px;
            height: 176px;
        }
        .style6
        {
            width: 302px;
            height: 176px;
        }
        .style7
        {
            height: 176px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="style1">
    
        <strong>回复</strong></div>
    <table class="style2">
        <tr>
            <td class="style3">
                回复主题</td>
            <td class="style4">
                <asp:TextBox ID="TextBox1" runat="server" Width="300px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox1" ErrorMessage="主题必须填写" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style5">
                回复内容</td>
            <td class="style6">
                <asp:TextBox ID="TextBox2" runat="server" Height="150px" TextMode="MultiLine" 
                    Width="300px"></asp:TextBox>
            </td>
            <td class="style7">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox2" ErrorMessage="内容必须填写" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="回复" />
            </td>
            <td>
                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    </form>
</body>
</html>
