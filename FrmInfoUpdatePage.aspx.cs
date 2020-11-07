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
    public partial class FrmInfoUpdatePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                for (int i = 1900; i <= 2020; i++)
                    birthYear.Items.Add(new ListItem(i.ToString(), i.ToString()));

                for (int i = 1; i <= 12; i++)
                    birthMon.Items.Add(new ListItem(i.ToString(), i.ToString()));

                for (int i = 1; i <= 31; i++)
                    birthDay.Items.Add(new ListItem(i.ToString(), i.ToString()));

                Member mem = (Member)Session["user"];

                id2.Text = mem.getId();
                pwd.Text = mem.getPwd();
                userName.Text = mem.getUserName();

                phoneNum.Text = mem.getPhoneNum();
                userEmail.Text = mem.getUserEmail();

                defaultSetting();
            }
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

        protected void infoUpdate_Click(object sender, EventArgs e)
        {
            Member temp = (Member)Session["user"];
            int userId = temp.getUserId();

            Member mem = new Member(userId, id2.Text, pwd.Text, userName.Text, userEmail.Text, int.Parse(birthYear.Text), int.Parse(birthMon.Text), int.Parse(birthDay.Text), phoneNum.Text, int.Parse(alarm.SelectedValue), userProfile.FileName);

            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
            conn.Open();

            string updateSql = "update Member set pwd=@pwd, userName=@userName, userEmail=@userEmail, birthYear=@birthYear, birthMon=@birthMon, birthDay=@birthDay, phoneNum=@phoneNum, alarm=@alarm, userProfile=@userProfile where userId=@userId";
            SqlCommand cmd = new SqlCommand(updateSql, conn);

            cmd.Parameters.AddWithValue("@userId", mem.getUserId());
            cmd.Parameters.AddWithValue("@id", mem.getId());
            cmd.Parameters.AddWithValue("@pwd", mem.getPwd());
            cmd.Parameters.AddWithValue("@userName", mem.getUserName());
            cmd.Parameters.AddWithValue("@userEmail", mem.getUserEmail());
            cmd.Parameters.AddWithValue("@birthYear", mem.getBirthYear());
            cmd.Parameters.AddWithValue("@birthMon", mem.getBirthMon());
            cmd.Parameters.AddWithValue("@birthDay", mem.getBirthDay());
            cmd.Parameters.AddWithValue("@phoneNum", mem.getPhoneNum());
            cmd.Parameters.AddWithValue("@alarm", mem.getAlarm());
            cmd.Parameters.AddWithValue("@userProfile", mem.getUserProfile());


            cmd.ExecuteNonQuery();
            conn.Close();

            string fileName = Server.MapPath("/userProfiles") + @"/" + userProfile.FileName;
            userProfile.SaveAs(fileName);

            Session["user"] = mem;

            Response.Redirect("~/FrmMyPage.aspx");
        }
    }
}