using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HKHNoticeBoard
{
    public partial class FrmDeleteComment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string writeId = Request.QueryString["wid"].ToString();
            string commentId = Request.QueryString["delete"].ToString();

            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
            conn.Open();

            string deleteSql = "delete from Comment where commentId=@commentId";
            SqlCommand cmd = new SqlCommand(deleteSql, conn);

            cmd.Parameters.AddWithValue("@commentId", commentId);

            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("~/FrmDetailPage.aspx?wid=" + writeId);
        }
    }
}