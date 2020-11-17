/*
  FrmDetailPage

  @author 홍기현
  @version 1.0
  @get 방식으로 넘어온 글 번호에 따라 상세 내용과 현재 답변을 보여주는 페이지
*/
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
            /*
                만약 URL로 직접 들어올 경우 메인 화면으로 Redirect
            */
            if (Request.QueryString["wid"] == null)
            {
                Response.Redirect("~/FrmMainPage.aspx");
            }

            string tempMem = "";
            string writeName = "";
            int writeCategory = 0;

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

            da.Fill(ds, "Board");

            foreach (DataRow item in ds.Tables["Board"].Rows)
            {
                if (((Member)Session["user"] == null) || ($"{item["userName"].ToString()}" != ((Member)Session["user"]).getUserName()))
                {
                    updateWrite.Visible = false;
                    deleteWrite.Visible = false;
                }

                if (item["category"].ToString() == "3")
                    updateWrite.Visible = false;

                writeName = $"{item["userName"].ToString()}";

                userName.Text = $"{item["userName"].ToString()}";
                createDay.Text = $"{item["createDay"].ToString().Split(' ')[0]}";
                updateDay.Text = $"{item["updateDay"].ToString().Split(' ')[0]}";
                title.Text = $"{item["title"].ToString()}";
                body.Text = $"{item["body"].ToString()}";

                myViewCount = int.Parse($"{item["viewCount"].ToString()}");
                emailAtts.ImageUrl = "~/files/" + $"{item["emailAtt"].ToString()}";

                /*
                    답변이 종료된 게시글은 답변 추가 불가능하도록 Visible을 false
                */
                if(item["category"].ToString() == "3")
                {
                    myComment.Visible = false;
                    comment.Visible = false;
                    addComment.Visible = false;
                }
                writeCategory = int.Parse(item["category"].ToString());
            }

            /*
                처음 페이지에 접속했을 경우 조회수를 1 증가
            */
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

            da.Fill(ds, "BoardList");

            /*
                답변이 진행 중인 게시글은 현재까지 달린 모든 댓글을 볼 수 있으며, 답변 삭제 가능
                답변이 종료된 게시글은 베스트 답변 1개만 보이며, 답변 삭제 불가능
            */
            if (writeCategory != 3)
            {
                string myBoard =
                    "<table border=\"1\" style=\"width: 70%; margin-left: auto; margin-right: auto;\"  class=\"table table-striped table-hover table-condensed table-bordered\">" +
                        "<tr style=\"text-align: center\" class=\"active\">" +
                            "<td>" +
                                "<b>작성자</b>" +
                            "</td>" +
                            "<td>" +
                                "<b>답변</b>" +
                            "</td>" +
                        "</tr>";

                foreach (DataRow item in ds.Tables["BoardList"].Rows)
                {
                    myBoard +=
                    $"<tr>" +
                            $"<td style=\"text-align: center; margin: auto;\" rowspan=\"2\">" +
                                "<img src=\"userProfiles/" + item["userProfile"] + "\" height=\"25px\" width=\"25px\">" +
                                $"{item["userName"].ToString()}" +
                            $"</td>" +
                            $"<td style=\"text-align: center\">";

                    if (tempMem == item["userName"].ToString())
                        myBoard += $"<a href='FrmDeleteComment.aspx?wid={item["writeId"].ToString()}&delete={item["commentId"].ToString()}'>답변삭제</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
                    if (writeName == tempMem)
                        myBoard += $"<a href='FrmDeleteComment.aspx?wid={item["writeId"].ToString()}&best={item["commentId"].ToString()}'>답변선택</a>";

                    myBoard +=
                            $"</td>" +
                    $"</tr>" +
                    $"<tr>" +
                            $"<td style=\"text-align: center\">" +
                                "<textarea cols=\"50\" rows=\"5\" readonly>" + item["body"].ToString() + "</textarea>"; ;
                    myBoard +=
                            $"</td>" +
                    $"</tr>";
                }

                myBoard += "</table>";
                commentList.Text = myBoard;
            }
            else
            {
                string myBoard =
                    "<table border=\"1\" style=\"width: 70%; margin-left: auto; margin-right: auto;\"  class=\"table table-striped table-hover table-condensed table-bordered\">" +
                        "<tr style=\"text-align: center\" class=\"active\">" +
                            "<td>" +
                                "<b>작성자</b>" +
                            "</td>" +
                            "<td>" +
                                "<b>베스트 답변</b>" +
                            "</td>" +
                        "</tr>";

                foreach (DataRow item in ds.Tables["BoardList"].Rows)
                {
                    if (item["bestCheck"].ToString() == "1")
                    {
                        myBoard +=
                        $"<tr>" +
                            $"<td style=\"text-align: center\" rowspan=\"2\">" +
                                "<img src=\"userProfiles/" + item["userProfile"] + "\" height=\"25px\" width=\"25px\">" +
                                $"{item["userName"].ToString()}" +
                            $"</td>" +
                            $"<td style=\"text-align: center\">" +
                            $"</td>" +
                        $"</tr>" +
                            $"<tr>" +
                            $"<td style=\"text-align: center\">" +
                                "<textarea cols=\"50\" rows=\"5\" readonly>" + item["body"].ToString() + "</textarea>"; ;
                        myBoard +=
                            $"</td>" +
                        $"</tr>";
                    }
                    
                }

                myBoard += "</table>";
                commentList.Text = myBoard;
            }


            defaultSetting();
            conn.Close();
        }


        /*
            현재 조회수에서 조회수를 1증가시킨 것을 반환하며, 그 결과를 DB에 반영하는 메소드
            @param int myViewCount : 현재 조회수
            @return string myViewCount : 클릭 후 조회수
        */
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

        /*
            작성한 사용자가 질문 수정 선택 메소드
            @param object sender
            @param EventArgs e
            @return 없음
        */
        protected void updateWrite_Click(object sender, EventArgs e)
        {
            string writeId = Request.QueryString["wid"].ToString();
            Response.Redirect("~/FrmUpdateWrite.aspx?wid=" + writeId);
        }

        /*
            작성한 사용자가 질문 삭제 선택 메소드
            @param object sender
            @param EventArgs e
            @return 없음
        */
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

        /*
            답변 추가 선택 메소드
            @param object sender
            @param EventArgs e
            @return 없음
        */
        protected void addComment_Click(object sender, EventArgs e)
        {
            Member mem = (Member)Session["user"];
            int userId = mem.getUserId();

            Comment comm = new Comment(0, int.Parse(Request.QueryString["wid"].ToString()), mem.getUserId(), comment.Text, 0);

            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
            conn.Open();

            string insertSql = "insert into Comment(writeId, userId, body, bestCheck) values(@writeId, @userId, @body, @bestCheck)";
            SqlCommand cmd = new SqlCommand(insertSql, conn);

            cmd.Parameters.AddWithValue("@writeId", comm.getWriteId());
            cmd.Parameters.AddWithValue("@userId", comm.getuserId());
            cmd.Parameters.AddWithValue("@body", comm.getBody());
            cmd.Parameters.AddWithValue("@bestCheck", comm.getBestCheck());

            cmd.ExecuteNonQuery();
            conn.Close();

            conn.Open();

            string updateSql = "update Write set category=@category where writeId=@writeId";
            cmd = new SqlCommand(updateSql, conn);

            cmd.Parameters.AddWithValue("@category", 2);
            cmd.Parameters.AddWithValue("@writeId", comm.getWriteId());

            cmd.ExecuteNonQuery();

            conn.Close();

            conn.Open();
            string selectSql = "select * from Member, Write where Member.userId = Write.userId and writeId = @writeId";
            cmd = new SqlCommand(selectSql, conn);

            cmd.Parameters.AddWithValue("@writeId", Request.QueryString["wid"].ToString());

            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            da.Fill(ds, "Board");

            //foreach (DataRow item in ds.Tables["Board"].Rows)
            //    if (int.Parse($"{item["alarm"].ToString()}") == 1)
            //        sendMessage($"{item["phoneNum"].ToString()}");

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