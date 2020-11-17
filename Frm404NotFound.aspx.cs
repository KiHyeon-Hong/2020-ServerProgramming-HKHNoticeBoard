/*
  404 not found 페이지

  @author 홍기현
  @version 1.0
  @오류 발생 시 예외처리의 결과로 넘어오는 페이지
*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HKHNoticeBoard
{
    public partial class Frm404NotFound : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            defaultSetting();
        }

        /*
            로그인을 했을 경우 세션에 담긴 사용자 정보로 로그인 여부를 확인시켜주는 메소드
            @param 없음
            @return 없움
        */
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