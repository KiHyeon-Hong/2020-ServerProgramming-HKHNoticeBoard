using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HKHNoticeBoard
{
    public partial class FrmDetailPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string writeId = Request.QueryString["wid"].ToString();

            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
            conn.Open();

            string selectSql = "select * from Member, Write where Member.userId = Write.userId and writeId = @writeId";
            SqlCommand cmd = new SqlCommand(selectSql, conn);

            cmd.Parameters.AddWithValue("@writeId", writeId);

            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            //Fill로 채운다
            da.Fill(ds, "Board");

            foreach (DataRow item in ds.Tables["Board"].Rows)
            {
                userName.Text = $"{item["userName"].ToString()}";
                createDay.Text = $"{item["createDay"].ToString()}";
                updateDay.Text = $"{item["updateDay"].ToString()}";
                title.Text = $"{item["title"].ToString()}";
                body.Text = $"{item["body"].ToString()}";

                //viewCountControl($"{item["viewCount"].ToString()}");

                viewCount.Text = viewCountControl(int.Parse($"{item["viewCount"].ToString()}")); ;
                emailAtts.ImageUrl = "~/files/" + $"{item["emailAtt"].ToString()}";
            }

            conn.Close();


            conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
            conn.Open();

            selectSql = "select * from Member, Comment where Comment.userId=Member.userId and writeId=@writeId";
            cmd = new SqlCommand(selectSql, conn);

            cmd.Parameters.AddWithValue("@writeId", writeId);


            ds = new DataSet();
            da = new SqlDataAdapter(cmd);

            //Fill로 채운다
            da.Fill(ds, "BoardList");

            string myBoard =
                "<table border=\"1\" style=\"width: 70%; margin-left: auto; margin-right: auto; \"  class=\"table table-striped table-hover table-condensed table-bordered\">" +
                    "<tr style=\"text-align: center\" class=\"active\">" +
                        "<td>" +
                            "<b>작성자</b>" +
                        "</td>" +
                        "<td>" +
                            "<b>댓글</b>" +
                        "</td>" +
                    "</tr>";

            foreach (DataRow item in ds.Tables["BoardList"].Rows)
            {
                myBoard +=
                    $"<tr>" +
                        $"<td style=\"text-align: center\">" +
                            "<img src=\"userProfiles/" + item["userProfile"] + "\" height=\"25px\" width=\"25px\">" +
                            $"{item["userName"].ToString()}" +
                        //"<asp:TextBox ID=\"test\" runat=\"server\"></asp:TextBox>" +
                        //"<a href='www.naver.com'>test</a>" +
                        $"</td>" +
                        $"<td style=\"text-align: center\">" +
                            $"{item["body"].ToString()}" +
                        $"</td>" +
                    $"</tr>";
            }

            myBoard += "</table>";

            commentList.Text = myBoard;
            defaultSetting();
        }

        private string viewCountControl(int myViewCount)
        {



            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
            conn.Open();

            string updateSql = "update Write set viewCount=@viewCount where writeId=@writeId";
            SqlCommand cmd = new SqlCommand(updateSql, conn);

            string writeId = Request.QueryString["wid"].ToString();
            cmd.Parameters.AddWithValue("@writeId", writeId);
            cmd.Parameters.AddWithValue("@viewCount", myViewCount + 1);

            cmd.ExecuteNonQuery();
            conn.Close();

            return myViewCount + 1 + "";
        }

        private void defaultSetting()
        {
            if (Session["user"] != null)
            {
                Member mem = (Member)Session["user"];

                Image1.ImageUrl = "~/userProfiles/" + mem.getUserProfile();
                signInState.Text = "로그아웃";
            }
        }

        protected void updateWrite_Click(object sender, EventArgs e)
        {
            string writeId = Request.QueryString["wid"].ToString();
            Response.Redirect("~/FrmUpdateWrite.aspx?wid=" + writeId);
        }

        protected void deleteWrite_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/FrmMainPage.aspx");
        }

        protected void addComment_Click(object sender, EventArgs e)
        {
            Member mem = (Member)Session["user"];
            int userId = mem.getUserId();

            Comment comm = new Comment(0, int.Parse(Request.QueryString["wid"].ToString()), mem.getUserId(), comment.Text);


            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
            conn.Open();

            string insertSql = "insert into Comment(writeId, userId, body) values(@writeId, @userId, @body)";
            SqlCommand cmd = new SqlCommand(insertSql, conn);


            cmd.Parameters.AddWithValue("@writeId", comm.getWriteId());
            cmd.Parameters.AddWithValue("@userId", comm.getuserId());
            cmd.Parameters.AddWithValue("@body", comm.getBody());

            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("~/FrmDetailPage.aspx?wid=" + Request.QueryString["wid"].ToString());
        }
    }
}