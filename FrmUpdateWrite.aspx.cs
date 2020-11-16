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

                //Fill로 채운다
                da.Fill(ds, "Board");

                foreach (DataRow item in ds.Tables["Board"].Rows)
                {
                    userName.Text = $"{item["userName"].ToString()}";
                    title.Text = $"{item["title"].ToString()}";
                    body.Text = $"{item["body"].ToString()}";
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

        protected void updateWrite_Click(object sender, EventArgs e)
        {
            Member mem = (Member)Session["user"];
            int userId = mem.getUserId();

            Write write = new Write(int.Parse(Request.QueryString["wid"].ToString()), int.Parse(category.SelectedValue), title.Text, body.Text, DateTime.Now, DateTime.Now, emailAtt.FileName, mem.getUserId(), 0);
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

        protected void boardList_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/FrmMainPage.aspx");
        }
    }
}