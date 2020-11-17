/*
  FrmAMyPage

  @author 홍기현
  @version 1.0
  @로그인 사용자 정보 확인 페이지
*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HKHNoticeBoard
{
    public partial class FrmMyPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("~/FrmSignInPage.aspx");
            }

            Member mem = (Member)Session["user"];

            userProfile.ImageUrl = "~/userProfiles/" + mem.getUserProfile();
            id.Text = mem.getId();
            pwd.Text = mem.getPwd();
            userName.Text = mem.getUserName();
            birth.Text = mem.getBirthYear() + "년 " + mem.getBirthMon() + "월 " + mem.getBirthDay() + "일";
            phoneNum.Text = mem.getPhoneNum();
            email.Text = mem.getUserEmail();

            if (mem.getAlarm() == 0)
                alarm.Text = "알람 받지 않음";
            else
                alarm.Text = "알람 받음";

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
            사용자 정보 변경으로 이동 메소드
            @param object sender
            @param EventArgs e
            @return 없음
        */
        protected void infoUpdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/FrmInfoUpdatePage.aspx");
        }
    }
}