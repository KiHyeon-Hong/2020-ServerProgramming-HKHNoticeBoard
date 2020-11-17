/*
  FrmFindPage

  @author 홍기현
  @version 1.0
  @아이디, 비밀번호 찾기 페이지
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
    public partial class FrmFindPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /*
            아이디 찾기 메소드
            @param object sender
            @param EventArgs e
            @return 없음
        */
        protected void findId_Click(object sender, EventArgs e)
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
                if ((item["userName"].ToString() == userName.Text) && (item["userEmail"].ToString() == userEmail.Text))
                {
                    idPwdResult.Text = "<font color='red'>ID : " + item["id"].ToString() + "</font>";
                    check = 1;
                }
            }

            if (check == 0)
            {
                idPwdResult.Text = "<font color='red'>정보가 없습니다.</font>";
            }

            conn.Close();
        }

        /*
            비밀번호 찾기 메소드
            @param object sender
            @param EventArgs e
            @return 없음
        */
        protected void findPwd_Click(object sender, EventArgs e)
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
                if ((item["id"].ToString() == id.Text) && (item["phoneNum"].ToString() == phoneNum.Text))
                {
                    idPwdResult.Text = "<font color='red'>PWD : " + item["pwd"].ToString() + "</font>";
                    check = 1;
                }
            }

            if (check == 0)
            {
                idPwdResult.Text = "<font color='red'>정보가 없습니다.</font>";
            }

            conn.Close();

        }
    }
}