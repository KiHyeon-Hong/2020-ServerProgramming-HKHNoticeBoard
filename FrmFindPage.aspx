<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmFindPage.aspx.cs" Inherits="HKHNoticeBoard.FrmFindPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <header style="float:left;width:100%">
            <br />
            &nbsp;<asp:ImageButton ID="myLogo" runat="server" ImageUrl="~/PageImages/logo.png" PostBackUrl="FrmMainPAge.aspx"  Height="50px" Width="150px" />
            <span style="top: 4%; right: 40%; position: absolute">
                <a href="FrmMainPage.aspx?category=0">전체</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="FrmMainPage.aspx?category=1">공지사항</a>&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="FrmMainPage.aspx?category=2">Q&A</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="FrmMainPage.aspx?category=3">FAQ</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </span>
            <asp:Image ID="Image1" runat="server" ImageUrl="~/userProfiles/default.jpg"  style="top: 4%; right: 12%; position: absolute" Height="25px" Width="25px" />
            <a href="FrmMyPage.aspx" style="top: 4%; right: 7%; position: absolute">
                <asp:Label ID="myPage" runat="server" Text="Label" Visible="false">마이페이지</asp:Label>
            </a>
            <a href="FrmSignInPage.aspx" style="top: 4%; right: 3%; position: absolute">
                <asp:Label ID="signInState" runat="server" Text="Label">로그인</asp:Label>
            </a>
            <hr />
        </header>
        <main>
            <div>
                <table style="width: 40%; margin-left: auto; margin-right: auto; margin-top: auto; margin-bottom:auto;">
                    <tr style="text-align: center">
                        <td colspan="3">
                            <asp:Label ID="lblId" runat="server" Text="ID 찾기"></asp:Label>
                        </td>
                        <td>

                        </td>
                        <td colspan="3">
                            <asp:Label ID="lblPwd" runat="server" Text="비밀번호 찾기"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="idUserName" runat="server" Text="이름 : "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="userName" runat="server"></asp:TextBox>
                        </td>
                        <td rowspan="2">
                            <asp:Button ID="findId" runat="server" Text="ID찾기" OnClick="findId_Click" CssClass="btn"/>
                        </td>
                        <td>

                        </td>
                        <td>
                            <asp:Label ID="pwdId" runat="server" Text="ID : "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="id" runat="server"></asp:TextBox>
                        </td>
                        <td rowspan="2">
                            <asp:Button ID="findPwd" runat="server" Text="비밀번호찾기" OnClick="findPwd_Click" CssClass="btn"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="idEmail" runat="server" Text="email : "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="userEmail" runat="server"></asp:TextBox>
                        </td>
                        <td>

                        </td>
                        <td>
                            <asp:Label ID="pwdPhoneNum" runat="server" Text="phone : "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="phoneNum" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="text-align: center">
                        <td colspan="7">
                            <asp:Label ID="idPwdResult" runat="server" Text="정보를 입력해주세요"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">

                        </td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="로그인화면으로" PostBackUrl="~/FrmSignInPage.aspx"/>
                        </td>
                        <td colspan="3">

                        </td>
                    </tr>
                </table>
            </div>
        </main>
        <footer style="background-color: #CCCCCC; float:left; width:100%; bottom: 0%; position: absolute">
            <p style="text-align: center">안녕하세요</p>
            <p style="text-align: center">이곳은 Footer 입니다</p>
            <p style="text-align: center"></p>
            <p style="text-align: center"><b>Tel. </b>+8210-6605-5379</p>
            <p style="text-align: center"><b>E-mail. </b>ghdrlgus96@naver.com</p>

            <br />
            &nbsp;<asp:Image ID="Image3" runat="server" ImageUrl="~/PageImages/logo.png" Height="50px" Width="150px" />
            <a href="https://github.com/KiHyeon-Hong" style="bottom: 10%; right: 3%; position: absolute">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/PageImages/git.jpg" Height="25px" Width="25px" />
            </a>
            <a href="https://www.youtube.com/" style="bottom: 10%; right: 7%; position: absolute">
                <asp:Image ID="Image4" runat="server" ImageUrl="~/PageImages/youtube.jpg" Height="25px" Width="25px" />
            </a>
        </footer>
    </form>
</body>
</html>
