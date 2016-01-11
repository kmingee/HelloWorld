using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContentList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string f = Request.QueryString["filename"];
        string file = f+ "file.xml";
        XmlDataSource1.DataFile =file;
        HyperLink2.NavigateUrl = "BackMsg.aspx"+"?"+"filename="+f;
    }
    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}