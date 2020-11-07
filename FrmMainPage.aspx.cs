using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
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
            string cate = Request.QueryString["category"];
            string page = Request.QueryString["page"];

            if (page == null)
                page = "1";
            else
                page = page.ToString();

            if (cate == null)
                cate = "0";
            else
                cate = cate.ToString();


            //SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
            //conn.Open();

            //string selectSql = "select * from Member, Write where Member.userId = Write.userId";
            //SqlCommand cmd = new SqlCommand(selectSql, conn);

            //DataSet ds = new DataSet();
            //SqlDataAdapter da = new SqlDataAdapter(cmd);

            ////Fill로 채운다
            //da.Fill(ds, "BoardList");

            //string myBoard =
            //    "<table border=\"1\" style=\"width: 70%; margin-left: auto; margin-right: auto; \"  class=\"table table-striped table-hover table-condensed table-bordered\">" +
            //        "<tr style=\"text-align: center\" class=\"active\">" +
            //            "<td>" +
            //                "<b>제목</b>" +
            //            "</td>" +
            //            "<td>" +
            //                "<b>작성자</b>" +
            //            "</td>" +
            //            "<td>" +
            //                "<b>작성일</b>" +
            //            "</td>" +
            //        "</tr>";

            //foreach (DataRow item in ds.Tables["BoardList"].Rows)
            //{
            //    myBoard +=
            //        $"<tr>" +
            //            $"<td>" +
            //                //$"{item["title"].ToString()}" +
            //                $"<a href='FrmDetailPage.aspx?wid={item["writeId"].ToString()}'>{item["title"].ToString()}</a>" +
            //            $"</td>" +
            //            $"<td style=\"text-align: center\">" +
            //                "<img src=\"userProfiles/" + item["userProfile"] + "\" height=\"25px\" width=\"25px\">" +
            //                $"{item["userName"].ToString()}" +
            //            //"<asp:TextBox ID=\"test\" runat=\"server\"></asp:TextBox>" +
            //            //"<a href='www.naver.com'>test</a>" +
            //            $"</td>" +
            //            $"<td style=\"text-align: center\">" +
            //                $"{item["createDay"].ToString().Split(' ')[0]}" +
            //            $"</td>" +
            //        $"</tr>";
            //}

            //myBoard += "</table>";

            //board.Text = myBoard;

            defaultPagination(cate, defaultWebSetting(cate, int.Parse(page), 10), 10);
            defaultSetting();
        }

        private void defaultPagination(string cate, int count, int onePage)
        {
            myPaginnation.Text = "<nav style=\"text-align: center\">" +
                "<ul class=\"pagination\">" +
                    "<li>" +
                        "<a href=\"FrmMainPage.aspx?category=" + cate + "&page=1\" aria-label=\"Previous\">" +
                            "<span aria-hidden=\"true\">&laquo;</span>" +
                        "</a>" +
                    "</li>";


            for(int i = 0; i < ((count / onePage) + 1); i++)
            {
                myPaginnation.Text += "<li><a href=\"FrmMainPage.aspx?category=" + cate + "&page=" + (i+1) +"\">" + (i+1) + "</a></li>";
            }

            myPaginnation.Text += "<li>" +
                        "<a href=\"FrmMainPage.aspx?category=" + cate + "&page=1\" aria-label=\"Next\">" +
                            "<span aria-hidden=\"true\">&laquo;</span>" +
                        "</a>" +
                    "</li>";


            //< nav style = "text-align: center" >

            //         < ul class="pagination">
            //            <li>
            //                <a href = "#" aria-label="Previous">
            //                    <span aria-hidden="true">&laquo;</span>
            //                </a>
            //            </li>
            //            <li><a href = "#" > 1 </ a ></ li >
            //            < li >< a href="#">2</a></li>
            //            <li><a href = "#" > 3 </ a ></ li >
            //            < li >< a href="#">4</a></li>
            //            <li><a href = "#" > 5 </ a ></ li >
            //            < li >
            //                < a href="#" aria-label="Next">
            //                    <span aria-hidden="true">&raquo;</span>
            //                </a>
            //            </li>
            //        </ul>
            //    </nav>
        }

        private int defaultWebSetting(string cate, int page, int onePage)
        {


            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
            conn.Open();

            //string selectSql = "select * from Member, Write where Member.userId = Write.userId";
            string selectSql;

            if (cate == "0")
                selectSql = "select * from Member, Write where Member.userId = Write.userId";
            else
                selectSql = "select * from Member, Write where Member.userId = Write.userId and category=" + cate;

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

            int count = 0;

            foreach (DataRow item in ds.Tables["BoardList"].Rows)
            {

                if((count >= (page -1) * onePage) && (count < (page) * onePage))
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

                count++;
            }

            myBoard += "</table>";

            board.Text = myBoard;

            return count;
        }

        private void defaultSetting()
        {
            if(Session["user"] != null)
            {
                Member mem = (Member)Session["user"];

                Image1.ImageUrl = "~/userProfiles/" + mem.getUserProfile();
                signInState.Text = "로그아웃";
                myPage.Visible = true;
            }
        }

        protected void addWrite_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/FrmAddWritePage.aspx");
        }
    }
}