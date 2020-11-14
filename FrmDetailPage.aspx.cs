using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
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
            if (Request.QueryString["wid"] == null)
            {
                Response.Redirect("~/FrmMainPage.aspx");
            }

            string tempMem = "";
            if(Session["user"] != null)
                tempMem = ((Member)Session["user"]).getUserName();


            int myViewCount = 0;

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
                
                if (((Member)Session["user"] == null) || ($"{item["userName"].ToString()}" != ((Member)Session["user"]).getUserName()))
                {
                    updateWrite.Visible = false;
                    deleteWrite.Visible = false;
                }


                userName.Text = $"{item["userName"].ToString()}";
                createDay.Text = $"{item["createDay"].ToString().Split(' ')[0]}";
                updateDay.Text = $"{item["updateDay"].ToString().Split(' ')[0]}";
                title.Text = $"{item["title"].ToString()}";
                body.Text = $"{item["body"].ToString()}";

                //viewCountControl($"{item["viewCount"].ToString()}");
                myViewCount = int.Parse($"{item["viewCount"].ToString()}");
                emailAtts.ImageUrl = "~/files/" + $"{item["emailAtt"].ToString()}";
            }

            if (!IsPostBack)
            {
                viewCount.Text = viewCountControl(myViewCount);
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
                            "&nbsp;&nbsp;&nbsp;&nbsp;";
                if(tempMem == item["userName"].ToString())
                    myBoard += $"<a href='FrmDeleteComment.aspx?wid={item["writeId"].ToString()}&delete={item["commentId"].ToString()}'>x</a>";
                myBoard +=
                        $"</td>" +
                    $"</tr>";
            }

            myBoard += "</table>";

            commentList.Text = myBoard;
            defaultSetting();

            conn.Close();
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
                myPage.Visible = true;
            }
        }

        protected void updateWrite_Click(object sender, EventArgs e)
        {
            string writeId = Request.QueryString["wid"].ToString();
            Response.Redirect("~/FrmUpdateWrite.aspx?wid=" + writeId);
        }

        protected void deleteWrite_Click(object sender, EventArgs e)
        {
            string writeId = Request.QueryString["wid"].ToString();

            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
            conn.Open();

            string deleteSql = "delete from Comment where writeId=@writeId";
            SqlCommand cmd = new SqlCommand(deleteSql, conn);

            cmd.Parameters.AddWithValue("@writeId", writeId);

            cmd.ExecuteNonQuery();
            conn.Close();


            conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
            conn.Open();

            deleteSql = "delete from Write where writeId=@writeId";
            cmd = new SqlCommand(deleteSql, conn);

            cmd.Parameters.AddWithValue("@writeId", writeId);

            cmd.ExecuteNonQuery();
            conn.Close();

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

            conn.Open();
            string selectSql = "select * from Member, Write where Member.userId = Write.userId and writeId = @writeId";
            cmd = new SqlCommand(selectSql, conn);

            cmd.Parameters.AddWithValue("@writeId", Request.QueryString["wid"].ToString());

            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            da.Fill(ds, "Board");

            foreach (DataRow item in ds.Tables["Board"].Rows)
                if(int.Parse($"{item["alarm"].ToString()}") == 1)
                    sendMessage($"{item["phoneNum"].ToString()}");

            conn.Close();

            Response.Redirect("~/FrmDetailPage.aspx?wid=" + Request.QueryString["wid"].ToString());
        }

        private void sendMessage(string number)
        {
            string jsonStr = "{'text':'새로운 댓글이 올라왔습니다.', 'number':'" + number + "'}";
            HttpUtility.JavaScriptStringEncode(jsonStr);

            HttpWebRequest httpWebRequest = (HttpWebRequest)WebRequest.Create("https://tztc6qlz5a.execute-api.us-east-1.amazonaws.com/default/lambda_for_sns");
            httpWebRequest.ContentType = "application/json; charset=utf-8";
            httpWebRequest.Method = "POST";
            using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
            {
                streamWriter.Write(jsonStr);
                streamWriter.Flush();
                streamWriter.Close();
            }
            string result = "";
            try
            {
                using (var response = httpWebRequest.GetResponse() as HttpWebResponse)
                {
                    if (httpWebRequest.HaveResponse && response != null)
                    {
                        using (var reader = new StreamReader(response.GetResponseStream()))
                        {

                        }
                    }
                }

            }
            catch (WebException ex)
            {
                if (ex.Response != null)
                {
                    using (var errorResponse = (HttpWebResponse)ex.Response)
                    {
                        using (var reader = new StreamReader(errorResponse.GetResponseStream()))
                        {
                            string error = reader.ReadToEnd();
                            result = error;
                        }
                    }
                }
            }
        }
    }
}