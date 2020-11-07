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
    }
}