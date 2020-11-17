/*
  FrmUpdateWrite

  @author 홍기현
  @version 1.0
  @게시글 작성한 사용자의 게시글 수정 페이지
*/
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
    public partial class FrmUpdateWrite : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("~/FrmSignInPage.aspx");
            }

            if (!IsPostBack)
            {
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
                    userName.Text = $"{item["userName"].ToString()}";
                    title.Text = $"{item["title"].ToString()}";
                    body.Text = $"{item["body"].ToString()}";
                    myCategory.Text = $"{item["category"].ToString()}";
                }

                conn.Close();

            }
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
            게시글 수정 메소드
            @param object sender
            @param EventArgs e
            @return 없음
        */
        protected void updateWrite_Click(object sender, EventArgs e)
        {
            string filePath = Request.PhysicalApplicationPath + @"badword\";
            string fileName1 = "";
            fileName1 = filePath + "badword.txt";

            string textValue = System.IO.File.ReadAllText(fileName1);
            string[] badword = textValue.Split(',');

            for (int i = 0; i < badword.Length; i++)
            {
                if ((title.Text).Contains(badword[i]))
                    Response.Redirect("~/FrmSignInPage.aspx?msg=제목에 비속어가 들어갔습니다");
                else if ((body.Text).Contains(badword[i]))
                    Response.Redirect("~/FrmSignInPage.aspx?msg=내용에 비속어가 들어갔습니다");
            }

            Member mem = (Member)Session["user"];
            int userId = mem.getUserId();

            Write write = new Write(int.Parse(Request.QueryString["wid"].ToString()), int.Parse(myCategory.Text), title.Text, body.Text, DateTime.Now, DateTime.Now, emailAtt.FileName, mem.getUserId(), 0);
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
            conn.Open();

            string updateSql = "update Write set title=@title, category=@category, body=@body, updateDay=@updateDay, emailAtt=@emailAtt where writeId=@writeId";
            SqlCommand cmd = new SqlCommand(updateSql, conn);

            cmd.Parameters.AddWithValue("@title", write.getTitle());
            cmd.Parameters.AddWithValue("@category", write.getCategory());
            cmd.Parameters.AddWithValue("@body", write.getBody());
            cmd.Parameters.AddWithValue("@updateDay", write.getUpdateDay());
            cmd.Parameters.AddWithValue("@emailAtt", write.getEmailAtt());
            cmd.Parameters.AddWithValue("@writeId", write.getWriteId());

            cmd.ExecuteNonQuery();
            conn.Close();

            string fileName = Server.MapPath("/files") + @"/" + emailAtt.FileName;
            emailAtt.SaveAs(fileName);


            Response.Redirect("~/FrmMainPage.aspx");

        }

        /*
            메인 화면으로 이동 메소드
            @param object sender
            @param EventArgs e
            @return 없음
        */
        protected void boardList_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/FrmMainPage.aspx");
        }
    }
}