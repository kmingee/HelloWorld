using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Security;

/// <summary>
///SqlHelper 的摘要说明
/// </summary>


public class SqlHelper
{
public static readonly string ConnectionStringLocalTransaction = ConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString;
private static Hashtable parmCache = Hashtable.Synchronized(new Hashtable());
    public SqlHelper()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}
public static SqlParameter[] GetCachedParameters(string cacheKey)
{
    SqlParameter[] cachedParms = (SqlParameter[])parmCache[cacheKey];
    
    if(cachedParms == null)
        return null;
    
    SqlParameter[] clonedParms = new SqlParameter[cachedParms.Length];

    for(int i=0,j=cachedParms.Length;i<j;i++)
        clonedParms[i]=(SqlParameter)((ICloneable)cachedParms[i]).Clone();

    return clonedParms;
}
 private static void PrepareCommand(SqlCommand cmd, SqlConnection conn, SqlTransaction trans, CommandType cmdType, string cmdText, SqlParameter[] cmdParms)
    {

        //判断数据库连接状态
        if (conn.State != ConnectionState.Open)
            conn.Open();

        cmd.Connection = conn;
        cmd.CommandText = cmdText;

        //判断是否需要事物处理
        if (trans != null)
            cmd.Transaction = trans;

        cmd.CommandType = cmdType;

        if (cmdParms != null)
        {
            foreach (SqlParameter parm in cmdParms)
                cmd.Parameters.Add(parm);
        }
    }

public static object ExecuteScalar(string connectionString, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
{
    SqlCommand cmd = new SqlCommand();

    using (SqlConnection connection = new SqlConnection(connectionString))
    {
        PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
        object val = cmd.ExecuteScalar();
        cmd.Parameters.Clear();
        return val;
    }
}
public static void CacheParameters(string cacheKey, params SqlParameter[] commandParameters)
{   //哈希表parmCache[ ]前面已定义
    parmCache[cacheKey] = commandParameters;
}


}