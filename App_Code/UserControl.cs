using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;

using System.Web;

/// <summary>
///UserControl 的摘要说明
/// </summary>
public class UserControl
{
    public string LoginName = "";
	public UserControl()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
    public bool UserAdd(string username, string password, string email, string question, string anwser)
    {
        string sql = "INSERT INTO UserTable VALUES('" + username + "','" + password + "','" + email + "','" + question + "','" + anwser + "')";
        SqlCommand cmd = new SqlCommand();
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            conn.Open();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = sql;
            cmd.ExecuteNonQuery();
        }
        return true;
    }
    public bool UserLogin(string username, string password)
    {
        string sqlStr = "select count(*) from UserTable where UserName='" + username + "' and Password='" + password + "'";
        SqlCommand cmd = new SqlCommand();
        using (SqlConnection conn = new SqlConnection(SqlHelper.ConnectionStringLocalTransaction))
        {
            conn.Open();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = sqlStr;
            if (((int)cmd.ExecuteScalar()) > 0 ? true : false)
            {
                LoginName = username;
                return true;
            }
            else
            {
                return false;
            }
        }

    }
}   