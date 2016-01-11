using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        UserControl mylogin = new UserControl();
        if (mylogin.UserLogin(TextBox1.Text, TextBox2.Text) == true)
        {
            HttpCookie cookie = new HttpCookie("MyCook");//初使化并设置Cookie的名称
            DateTime dt = DateTime.Now;
            TimeSpan ts = new TimeSpan(0, 0, 60, 0, 0);//过期时间为60分钟
            cookie.Expires = dt.Add(ts);//设置过期时间
            cookie.Value = TextBox1.Text;
            Response.AppendCookie(cookie);
            Response.Redirect("default.aspx");
        }
        else
        {
            Label1.Text = "用户名或密码错误，请重新输入";
            Label1.Visible = true;
        }
    }
}