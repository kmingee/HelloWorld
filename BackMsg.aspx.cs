using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackMsg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["mycook"];
        string name = cookie.Value;


        BBSManager mybbs = new BBSManager();

        string f = Request.QueryString["filename"];
        string filename = Server.MapPath(".") + @"\" +f+"file.xml";
        mybbs.UpdateXml(filename, TextBox1.Text, TextBox2.Text,name);
        mybbs.UpdateMsg(int.Parse(f));
        Literal1.Text = "更新成功";
        Response.Redirect("contentlist.aspx?filename=" + f);
    }
}