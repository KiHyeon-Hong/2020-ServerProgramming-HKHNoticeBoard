/*
  FrmInfomationPage

  @author 홍기현
  @version 1.0
  @게시판 페이지 작성한 프로그래머의 자기 자랑 페이지
*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HKHNoticeBoard
{
    public partial class FrmInfomationPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
    }
}