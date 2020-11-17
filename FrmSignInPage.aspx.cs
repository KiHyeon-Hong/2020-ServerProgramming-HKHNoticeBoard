/*
  FrmSignInPage

  @author 홍기현
  @version 1.0
  @사용자 로그인 페이지
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
    public partial class FrmSignInPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["user"] != null)
            {
                Session["user"] = null;
            }

            if(Request.QueryString["msg"] != null)
                resultMessage.Text = "<font color='red'>" + Request.QueryString["msg"] + "</font>";
        }

        /*
            로그인 메소드
            @param object sender
            @param EventArgs e
            @return 없음
        */
        protected void signIn_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
            conn.Open();

            string selectSql = "select * from Member";
            SqlCommand cmd = new SqlCommand(selectSql, conn);

            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds, "member");

            int check = 0;

            foreach (DataRow item in ds.Tables["member"].Rows)
            {
                if ((item["id"].ToString() == id.Text) && (item["pwd"].ToString() == pwd.Text))
                {
                    Member mem = new Member(int.Parse(item["userId"].ToString()), item["id"].ToString(), item["pwd"].ToString(), item["userName"].ToString(), item["userEmail"].ToString(), int.Parse(item["birthYear"].ToString()), int.Parse(item["birthMon"].ToString()), int.Parse(item["birthDay"].ToString()), item["phoneNum"].ToString(), int.Parse(item["alarm"].ToString()), item["userProfile"].ToString());

                    Session["user"] = mem;
                    conn.Close();
                    Response.Redirect("~/FrmMainPage.aspx");
                }
                else if ((item["id"].ToString() == id.Text) && (item["pwd"].ToString() != pwd.Text))
                {
                    resultMessage.Text = "<font color='red'>비밀번호 틀림</font>";
                    check = 1;
                }
            }

            if (check == 0)
            {
                resultMessage.Text = "<font color='red'>정보가 없습니다.</font>";
            }

            conn.Close();

        }
    }
}