using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Xml;
using System.IO;

/// <summary>
///BBSManager 的摘要说明
///论坛类别操作类
/// </summary>



public class BBSManager
{
    private string xmlfilename = "";
    private const string SQL_INSERT_BBSINFO = "INSERT INTO bbsinfo VALUES " +
        "(@title,@filename,@posttime,@replycount,@lastreplytime, @postuser,@categoryid)";
    private const string PARM_BBS_TITLE = "@title";
    private const string PARM_BBS_FILENAME = "@filename";
    private const string PARM_BBS_POSTTIME = "@posttime";
    private const string PARM_BBS_REPLYCOUNT = "@replycount";
    private const string PARM_BBS_LASTREPLYTIME = "@lastreplytime";
    private const string PARM_BBS_POSTUSER = "@postuser";
    private const string PARM_BBS_CATEGORYID = "@categoryid";

	public BBSManager()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
    public bool AddBBSCategory(string CategoryName, string CategoryDes)
    {
        StringBuilder strSQL = new StringBuilder();
        SqlParameter[] newsParms = new SqlParameter[]{
            new SqlParameter("@CategoryName",SqlDbType.NVarChar,20),
            new SqlParameter("@CategoryDes",SqlDbType.NVarChar,100)};

        SqlCommand cmd = new SqlCommand();

        newsParms[0].Value = CategoryName;
        newsParms[1].Value = CategoryDes;

        foreach(SqlParameter parm in newsParms)
            cmd.Parameters.Add(parm);

        using(SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            strSQL.Append("Insert into BBSCategory values(@CategoryName,@CategoryDes)");
            conn.Open();

            cmd.Connection=conn;
            cmd.CommandType=CommandType.Text;
            cmd.CommandText=strSQL.ToString();
            int val=cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();

            if(val>0)
                return true;
            else
                return false;

        }
        }
    //将发帖内容保存到XML文件中的方法
    public void AddXML(string filename, string title, string content, string user)
    {
        XmlDocument mydoc = new XmlDocument();
        mydoc.Load(filename);

        //添加帖子主题
        XmlElement ele = mydoc.CreateElement("title");
        XmlText text = mydoc.CreateTextNode(title);

        //添加发帖时间
        XmlElement ele1 = mydoc.CreateElement("posttime");
        XmlText text1 = mydoc.CreateTextNode(DateTime.Now.ToString());

        //添加发帖内容
        XmlElement ele2 = mydoc.CreateElement("content");
        XmlText text2 = mydoc.CreateTextNode(content);

        //添加发帖人
        XmlElement ele3 = mydoc.CreateElement("postuser");
        XmlText text3 = mydoc.CreateTextNode(user);

        //添加文件的节点-msgrecord
        XmlNode newElem = mydoc.CreateNode("element", "xmlrecord", "");
        //在节点中添加元素

        newElem.AppendChild(ele);
        newElem.LastChild.AppendChild(text);
        
        newElem.AppendChild(ele1);
        newElem.LastChild.AppendChild(text1);

        newElem.AppendChild(ele2);
        newElem.LastChild.AppendChild(text2);

        newElem.AppendChild(ele3);
        newElem.LastChild.AppendChild(text3);

        //将结点添加到文档中
        XmlElement root = mydoc.DocumentElement;
        root.AppendChild(newElem);

        //获取文件路径
        int index = filename.LastIndexOf(@"\");
        string path = filename.Substring(0, index);

        //新文件名
        path = path + @"\" + xmlfilename + "file.xml";
        FileStream mystream = File.Create(path);
        mystream.Close();

        //保存所有修改-到指定文件中：注意编码语言的选择
        XmlTextWriter mytw = new XmlTextWriter(path, Encoding.Default);
        mydoc.Save(mytw);
        mytw.Close();
       
    }
    //给新建的xml文件起名
    private int getFilename()
    {
        int cardrule = 0;
        string strsql = "select top 1 infoid from bbsinfo order by infoid desc";
        try
        {
            cardrule = (int)SqlHelper.ExecuteScalar(SqlHelper.ConnectionStringLocalTransaction,CommandType.Text,strsql,null);
        }
        catch
        {
            cardrule=0;
        }
        return cardrule+1;
    }

    //添加记录
    public void AddMsg(string title, string user, int categoryid)
    {
        StringBuilder strSQL = new StringBuilder();
        SqlParameter[] newsParms = GetParameters();
        SqlCommand cmd = new SqlCommand();
        newsParms[0].Value = title;
        newsParms[1].Value = getFilename().ToString();
        xmlfilename = getFilename().ToString();
        newsParms[2].Value = DateTime.Now;
        newsParms[3].Value = 0;
        newsParms[4].Value = DateTime.Now;
        newsParms[5].Value = user;
        newsParms[6].Value = categoryid;

        foreach (SqlParameter parm in newsParms)
            cmd.Parameters.Add(parm);

        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            strSQL.Append(SQL_INSERT_BBSINFO);
            conn.Open();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSQL.ToString();

            int val = cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
        }
    }
    ///创建或获取缓存参数的私有方法
    private static SqlParameter[] GetParameters()
    {
        SqlParameter[] parms = SqlHelper.GetCachedParameters(SQL_INSERT_BBSINFO);
        if (parms == null)
        {
            parms = new SqlParameter[]{
                    new SqlParameter(PARM_BBS_TITLE,SqlDbType.NVarChar,50),
                    new SqlParameter(PARM_BBS_FILENAME,SqlDbType.NVarChar,100),
                    new SqlParameter(PARM_BBS_POSTTIME,SqlDbType.DateTime),
                    new SqlParameter(PARM_BBS_REPLYCOUNT,SqlDbType.Int),
                    new SqlParameter(PARM_BBS_LASTREPLYTIME,SqlDbType.DateTime),
                    new SqlParameter(PARM_BBS_POSTUSER,SqlDbType.NVarChar,50),
                    new SqlParameter(PARM_BBS_CATEGORYID,SqlDbType.Int)
            };
        SqlHelper.CacheParameters(SQL_INSERT_BBSINFO,parms);
        }
        return parms;
 
    }
   
    ///更新数据库中的回复时间
    public bool UpdateMsg(int infoid)
    {
        StringBuilder strSQL = new StringBuilder();
        SqlParameter[] newsParms =  new SqlParameter[]
        {
            new SqlParameter("@lastposttime",SqlDbType.DateTime),
            new SqlParameter("@infoid",SqlDbType.Int)
        };

        SqlCommand cmd = new SqlCommand();
        newsParms[0].Value=DateTime.Now;
        newsParms[1].Value=infoid;

        foreach(SqlParameter parm in newsParms)
        {
            cmd.Parameters.Add(parm);
        }

        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            strSQL.Append(
            @"UPDATE bbsinfo SET replycount=replycount+1,
            lastreplytime=@lastposttime WHERE infoid=@infoid");
            conn.Open();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSQL.ToString();

            int val = cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();

            if (val > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
       
        }

    }
    public void UpdateXml(string filename, string title, string content, string user)
    {
        XmlDocument mydoc = new XmlDocument();
        mydoc.Load( filename);

        XmlElement ele = mydoc.CreateElement("title");
        XmlText text = mydoc.CreateTextNode(title);

        XmlElement ele1 = mydoc.CreateElement("posttime");
        XmlText text1 = mydoc.CreateTextNode(DateTime.Now.ToString());

        XmlElement ele2 = mydoc.CreateElement("content");
        XmlText text2 = mydoc.CreateTextNode(content);

        XmlElement ele3 = mydoc.CreateElement("postuser");
        XmlText text3 = mydoc.CreateTextNode(user);

        XmlNode newElem = mydoc.CreateNode("element", "xmlrecord", "");

        newElem.AppendChild(ele);
        newElem.LastChild.AppendChild(text);
        
        newElem.AppendChild(ele1);
        newElem.LastChild.AppendChild(text1);

        newElem.AppendChild(ele2);
        newElem.LastChild.AppendChild(text2);

        newElem.AppendChild(ele3);
        newElem.LastChild.AppendChild(text3);

        XmlElement root = mydoc.DocumentElement;
        root.AppendChild(newElem);

        mydoc.Save(filename);
    }
    }