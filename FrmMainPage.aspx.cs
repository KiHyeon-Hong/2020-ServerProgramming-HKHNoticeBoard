/*
  FrmMainPage

  @author 홍기현
  @version 1.0
  @게시판 프로그램의 메인 페이지
*/
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
            string searchName = Request.QueryString["searchName"];
            string searchValue = Request.QueryString["searchValue"];

            if (page == null)
                page = "1";
            else
                page = page.ToString();

            if (cate == null)
                cate = "0";
            else
                cate = cate.ToString();

            defaultPagination(cate, defaultWebSetting(cate, int.Parse(page), 10, searchName, searchValue), 10);
            defaultSetting();
        }
        /*
            페이지네이션 설정 메소드
            @param string cate : 사용자가 선택한 카테고리(새질문, 답변중, 답변완료)
            @param int count : 
            @param int onePage
            @return 없음
        */
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
        }

        /*
            검색 조건에 따라 쿼리 생성 후 게시글을 띄우는 메소드
            @param string cate : 사용자가 선택한 카테고리(새질문, 답변중, 답변완료)
            @param int page : 페이지네이션으로 선택한 페이지 번호
            @param int onePage : 한 페이지에 들어가는 게시글 수
            @param string searchName : 사용자가 검색 조건(제목, 내용, 작성자)
            @param string searchValue : 사용자의 검색 단어
            @return int count : 게시글 개수
        */
        private int defaultWebSetting(string cate, int page, int onePage, string searchName, string searchValue)
        {
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
            conn.Open();

            string selectSql;
            if (searchName != null)
            {
                if(searchName == "0")
                    selectSql = "select * from Member, Write where Member.userId = Write.userId and title like N'%" + searchValue + "%' order by writeId desc";
                else if (searchName == "1")
                    selectSql = "select * from Member, Write where Member.userId = Write.userId and body like N'%" + searchValue + "%' order by writeId desc";
                else
                    selectSql = "select * from Member, Write where Member.userId = Write.userId and userName like N'%" + searchValue + "%' order by writeId desc";
            }
            else if (cate == "0")
                selectSql = "select * from Member, Write where Member.userId = Write.userId order by writeId desc";
            else
                selectSql = "select * from Member, Write where Member.userId = Write.userId and category=" + cate + "order by writeId desc";

            SqlCommand cmd = new SqlCommand(selectSql, conn);

            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            da.Fill(ds, "BoardList");

            string myBoard =
                "<table border=\"1\" style=\"width: 70%; margin-left: auto; margin-right: auto; \"  class=\"table table-striped table-hover table-condensed table-bordered\">" +
                    "<tr style=\"text-align: center\" class=\"active\">" +
                        "<td>" +
                            "<b>분류</b>" +
                        "</td>" +
                        "<td>" +
                            "<b>제목</b>" +
                        "</td>" +
                        "<td>" +
                            "<b>작성자</b>" +
                        "</td>" +
                        "<td>" +
                            "<b>작성일</b>" +
                        "</td>" +
                        "<td>" +
                            "<b>조회수</b>" +
                        "</td>" +
                    "</tr>";

            int count = 0;

            foreach (DataRow item in ds.Tables["BoardList"].Rows)
            {
                if((count >= (page -1) * onePage) && (count < (page) * onePage))
                {
                    myBoard +=
                    $"<tr>" +
                        $"<td style=\"text-align: center\">" +
                            (($"{item["category"].ToString()}" == "1")? "[새질문]": ($"{item["category"].ToString()}" == "2")? "[답변등록중]": "[답변완료]") +
                        $"</td>" +
                        $"<td>" +
                            "[  <img src=\"files/" + $"{item["emailAtt"].ToString()}" + "\" height=\"25px\" width=\"25px\">  ] " +
                            $"<a href='FrmDetailPage.aspx?wid={item["writeId"].ToString()}'>{item["title"].ToString()}</a>" +
                        $"</td>" +
                        $"<td style=\"text-align: center\">" +
                            "<img src=\"userProfiles/" + item["userProfile"] + "\" height=\"25px\" width=\"25px\">" +
                            $"{item["userName"].ToString()}" +
                        $"</td>" +
                        $"<td style=\"text-align: center\">" +
                            $"{item["createDay"].ToString().Split(' ')[0]}" +
                        $"</td>" +
                        $"<td style=\"text-align: center\">" +
                            $"{item["viewCount"].ToString().Split(' ')[0]}" +
                        $"</td>" +
                    $"</tr>";
                }

                count++;
            }

            myBoard += "</table>";
            board.Text = myBoard;

            conn.Close();

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

        /*
            질문글 추가 페이지로 이동 메소드
            @param object sender
            @param EventArgs e
            @return 없음
        */
        protected void addWrite_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/FrmAddWritePage.aspx");
        }

        /*
            검색버튼 클릭 메소드
            @param object sender
            @param EventArgs e
            @return 없음
        */
        protected void search_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/FrmMainPage.aspx?category=0&searchName=" + searchCriteria.SelectedValue + "&searchValue=" + searchText.Text);
        }
    }
}