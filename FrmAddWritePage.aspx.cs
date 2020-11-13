using System;
using System.Collections.Generic;
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

        protected void addWrite_Click(object sender, EventArgs e)
        {
            Member mem = (Member)Session["user"];
            int userId = mem.getUserId();

            Write write = new Write(0, int.Parse(category.SelectedValue), title.Text, body.Text, DateTime.Now, DateTime.Now, emailAtt.FileName, mem.getUserId(), 0);

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

            //sendMessage(mem.getPhoneNum());

            Response.Redirect("~/FrmMainPage.aspx");
        }


        private void sendMessage(string number)
        {
            string jsonStr = "{'text':'새로운 공지사항이 올라왔습니다.', 'number':'" + number + "'}";
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