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
    public partial class FrmMainPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
            conn.Open();

            string selectSql = "select * from Member, Write where Member.userId = Write.userId";
            SqlCommand cmd = new SqlCommand(selectSql, conn);

            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            //Fill로 채운다
            da.Fill(ds, "BoardList");

            string myBoard =
                "<table border=\"1\" style=\"width: 70%; margin-left: auto; margin-right: auto; \"  class=\"table table-striped table-hover table-condensed table-bordered\">" +
                    "<tr style=\"text-align: center\" class=\"active\">" +
                        "<td>" +
                            "<b>제목</b>" +
                        "</td>" +
                        "<td>" +
                            "<b>작성자</b>" +
                        "</td>" +
                        "<td>" +
                            "<b>작성일</b>" +
                        "</td>" +
                    "</tr>";

            foreach (DataRow item in ds.Tables["BoardList"].Rows)
            {
                myBoard +=
                    $"<tr>" +
                        $"<td>" +
                            //$"{item["title"].ToString()}" +
                            $"<a href='FrmDetailPage.aspx?wid={item["writeId"].ToString()}'>{item["title"].ToString()}</a>" +
                        $"</td>" +
                        $"<td style=\"text-align: center\">" +
                            "<img src=\"userProfiles/" + item["userProfile"] + "\" height=\"25px\" width=\"25px\">" +
                            $"{item["userName"].ToString()}" +
                        //"<asp:TextBox ID=\"test\" runat=\"server\"></asp:TextBox>" +
                        //"<a href='www.naver.com'>test</a>" +
                        $"</td>" +
                        $"<td style=\"text-align: center\">" +
                            $"{item["createDay"].ToString().Split(' ')[0]}" +
                        $"</td>" +
                    $"</tr>";
            }

            myBoard += "</table>";

            board.Text = myBoard;

            defaultSetting();
        }

        private void defaultSetting()
        {
            if(Session["user"] != null)
            {
                Member mem = (Member)Session["user"];

                Image1.ImageUrl = "~/userProfiles/" + mem.getUserProfile();
                signInState.Text = "로그아웃";
            }
        }

        protected void addWrite_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/FrmAddWritePage.aspx");
        }
    }
}