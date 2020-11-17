/*
  FrmDeleteComment

  @author 홍기현
  @version 1.0
  @get 방식으로 넘어온 데이터를 분석하여 답변 삭제, 답변 선택 수행 페이지
*/
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
            /*
                넘어온 파라매터의 종류에 따라 답변 삭제 기능, 답변 선택 기능 수행
            */
            if (Request.QueryString["delete"] != null)
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
            else if (Request.QueryString["best"] != null)
            {
                string writeId = Request.QueryString["wid"].ToString();
                string commentId = Request.QueryString["best"].ToString();

                SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
                conn.Open();

                string updateSql = "update Comment set bestCheck=1 where commentId=@commentId";
                SqlCommand cmd = new SqlCommand(updateSql, conn);

                cmd.Parameters.AddWithValue("@commentId", commentId);

                cmd.ExecuteNonQuery();
                conn.Close();

                conn.Open();

                updateSql = "update Write set category=3 where writeId=@writeId";
                cmd = new SqlCommand(updateSql, conn);

                cmd.Parameters.AddWithValue("@writeId", writeId);

                cmd.ExecuteNonQuery();
                conn.Close();

                Response.Redirect("~/FrmMainPage.aspx");
            }
        }
    }
}