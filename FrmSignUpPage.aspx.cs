/*
  FrmSignUpPage

  @author 홍기현
  @version 1.0
  @로그인한 사용자가 새롭게 질문을 추가하는 페이지
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

        /*
            회원가입 요청 메소드
            @param object sender
            @param EventArgs e
            @return 없음
        */
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

        /*
            아이디 중복 확인 요청 메소드
            @param object sender
            @param EventArgs e
            @return 없음
        */
        protected void check_Click(object sender, EventArgs e)
        {
            try
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
                    if ((item["id"].ToString() == id.Text))
                    {
                        check = 1;
                        checkResult.Text = "ID가 중복됩니다";
                    }
                }

                if (check == 0)
                {
                    checkResult.Text = "ID가 중복되지 않습니다";
                }

                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Redirect("Frm404NotFound.aspx?err=" + ex.Message);
            }
            
        }
    }
}