﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_AddCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        BBSManager mybbs = new BBSManager();
        bool result = mybbs.AddBBSCategory(TextBox1.Text, TextBox2.Text);
        if (result)
            Label1.Text = "论坛类别添加成功！请刷新";
        Label1.Visible = true;
    }
}