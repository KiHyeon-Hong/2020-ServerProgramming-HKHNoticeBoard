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
    public partial class FrmSignUpPage : System.Web.UI.Page
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
            }
        }

        protected void signUp_Click(object sender, EventArgs e)
        {
            Member mem = new Member(0, id.Text, pwd.Text, userName.Text, userEmail.Text, int.Parse(birthYear.Text), int.Parse(birthMon.Text), int.Parse(birthDay.Text), phoneNum.Text, int.Parse(alarm.SelectedValue), userProfile.FileName);

            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
            conn.Open();

            string insertSql = "insert into Member(id, pwd, userName, userEmail, birthYear, birthMon, birthDay, phoneNum, alarm, userProfile) values(@id, @pwd, @userName, @userEmail, @birthYear, @birthMon, @birthDay, @phoneNum, @alarm, @userProfile)";
            SqlCommand cmd = new SqlCommand(insertSql, conn);

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

            Response.Redirect("~/FrmSignInPage.aspx");
        }
    }
}