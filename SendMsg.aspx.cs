using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SendMsg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        BBSManager mybbs = new BBSManager();
        string username = "admin";
        mybbs.AddMsg(TextBox1.Text, username, int.Parse(DropDownList1.SelectedValue));
        mybbs.AddXML(Server.MapPath(".") + @"\content.xml", TextBox1.Text, TextBox2.Text, username);
        Label1.Text = "帖子发布成功";
        Label1.Visible = true;
    }
}