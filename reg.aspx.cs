using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class reg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        UserControl NewUser = new UserControl();
        if (NewUser.UserAdd(TextBox1.Text, TextBox2.Text, TextBox4.Text, TextBox5.Text, TextBox6.Text) == true)
        {
            Response.Redirect("Login.aspx");
            Literal1.Text="注册成功，请返回登录！";
        }
        else
        {
            Literal1.Text = "注册失败，请重试！";
        }

    }
}