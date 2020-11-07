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
            }
        }

        protected void addWrite_Click(object sender, EventArgs e)
        {
            Member mem = (Member)Session["user"];
            int userId = mem.getUserId();

            Write write = new Write(0, int.Parse(category.SelectedValue), title.Text, body.Text, DateTime.Now, DateTime.Now, emailAtt.FileName, mem.getUserId());

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

            //sendMessage();

            Response.Redirect("~/FrmMainPage.aspx");
        }
    }
}