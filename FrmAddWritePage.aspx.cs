/*
  FrmAddWritePage.aspx

  @author 홍기현
  @version 1.0
  @로그인한 사용자가 새롭게 질문을 추가하는 페이지
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
    public partial class FrmAddWritePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*
                비로그인 사용자가 URL을 통하여 접속하려고 시도할 시 로그인 페이지로 Redirect 
            */
            if(Session["user"] == null)
            {
                Response.Redirect("~/FrmSignInPage.aspx");
            }

            /*
                새롭게 글을 추가하려는 사용자의 이름을 화면에 띄움
            */
            Member mem = (Member)Session["user"];
            userName.Text = mem.getUserName();
            defaultSetting();
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
            제목, 내용, 첨부 이미지를 모두 작성 후 DB에 내용을 반영하는 메소드
            @param object sender
            @param EventArgs e
            @return 없음
        */
        protected void addWrite_Click(object sender, EventArgs e)
        {
            /*
                제목, 내용에 비속어가 포함되면 로그아웃시키며 로그인 페이지로 Redirect
            */
            string filePath = Request.PhysicalApplicationPath + @"badword\";
            string fileName1 = "";
            fileName1 = filePath + "badword.txt";

            string textValue = System.IO.File.ReadAllText(fileName1);
            string[] badword = textValue.Split(',');

            for(int i = 0; i < badword.Length; i++)
            {
                if ((title.Text).Contains(badword[i]))
                    Response.Redirect("~/FrmSignInPage.aspx?msg=제목에 비속어가 들어갔습니다");
                else if ((body.Text).Contains(badword[i]))
                    Response.Redirect("~/FrmSignInPage.aspx?msg=내용에 비속어가 들어갔습니다");
            }

            Member mem = (Member)Session["user"];
            int userId = mem.getUserId();

            Write write = new Write(0, 1, title.Text, body.Text, DateTime.Now, DateTime.Now, emailAtt.FileName, mem.getUserId(), 0);

            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
            conn.Open();

            string insertSql = "insert into Write(title, category, body, createDay, updateDay, emailAtt, userId) values(@title, @category, @body, @createDay, @updateDay, @emailAtt, @userId)";
            SqlCommand cmd = new SqlCommand(insertSql, conn);

            cmd.Parameters.AddWithValue("@title", write.getTitle());
            cmd.Parameters.AddWithValue("@category", write.getCategory());
            cmd.Parameters.AddWithValue("@body", write.getBody());
            cmd.Parameters.AddWithValue("@createDay", write.getCreateDay());
            cmd.Parameters.AddWithValue("@updateDay", write.getUpdateDay());
            cmd.Parameters.AddWithValue("@emailAtt", write.getEmailAtt());
            cmd.Parameters.AddWithValue("@userId", write.getUserId());

            cmd.ExecuteNonQuery();
            conn.Close();

            string fileName = Server.MapPath("/files") + @"/" + emailAtt.FileName;
            emailAtt.SaveAs(fileName);

            conn.Open();
            string selectSql = "select * from Member where alarm=1";
            cmd = new SqlCommand(selectSql, conn);

            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            da.Fill(ds, "Board");

            /*
                새로운 질문글이 올라오면 알람 받기 설정 사용자에게 문자 메시지 전송
            */
            //foreach (DataRow item in ds.Tables["Board"].Rows)
            //    if(int.Parse($"{item["alarm"].ToString()}") == 1)
            //        sendMessage($"{item["phoneNum"].ToString()}");

            conn.Close();

            Response.Redirect("~/FrmMainPage.aspx");
            
        }

        /*
                회원가입때 입력한 전화번호를 기반으로 알람 서비스 허용 사용자에게 메시지를 전송하는 메소드
                @param string number
                @return 없음
        */
        private void sendMessage(string number)
        {
            string jsonStr = "{'text':'새로운 질문글이 올라왔습니다.', 'number':'" + number + "'}";
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

        protected void cancelWrite_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/FrmMainPage.aspx");
        }
    }
}