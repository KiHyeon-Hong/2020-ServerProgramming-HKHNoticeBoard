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
            <span style="top: 4%; right: 35%; position: absolute">
                <a href="FrmMainPage.aspx?category=0">전체</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="FrmMainPage.aspx?category=1">공지사항</a>&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="FrmMainPage.aspx?category=2">Q&A</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="FrmMainPage.aspx?category=3">FAQ</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="FrmInfomationPage.aspx">자기소개</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="FrmPageInformationPage.aspx">페이지소개</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </span>
            <span style="top: 4%; right: 5%; position: absolute">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/userProfiles/default.jpg" Height="25px" Width="25px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="FrmMyPage.aspx">
                    <asp:Label ID="myPage" runat="server" Text="Label" Visible="false">마이페이지</asp:Label>
                </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="FrmSignInPage.aspx">
                    <asp:Label ID="signInState" runat="server" Text="Label">로그인</asp:Label>
                </a>
            </span>
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
        <footer>
            <br />
            <br />
            <br />

            <table style="width: 100%; margin-left: auto; margin-right: auto; background-color: #DDDDDD"  class="">
                <tr>
                    <td colspan="3" style="text-align: center">
                        <b>Addr.</b> 서울특별시 노원구 월계로 55길 15, 303동 1302호(월계동, 사슴아파트)
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align: center">
                        <b>TEL.</b> 010-6605-5379
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align: center">
                        <b>Public e-mail</b> ghdrlgus96@naver.com 
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align: center">
                        <b>Google e-mail</b> ghdrlgus96@gmail.com
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;<asp:ImageButton ID="bottomLogo" runat="server" ImageUrl="~/PageImages/logo.png" PostBackUrl="FrmMainPAge.aspx"  Height="50px" Width="150px" />
                    </td>
                    <td>
                        
                    </td>
                    <td style="text-align: right">
                        <a href="https://www.gachon.ac.kr/main.jsp">
                            <asp:Image ID="myGachon" runat="server" ImageUrl="~/PageImages/gachon.jpg" Height="25px" Width="50px" />
                        </a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="https://kihyeon-hong.github.io/">
                            <asp:Image ID="myBlog" runat="server" ImageUrl="~/PageImages/blog.jpg" Height="25px" Width="25px" />
                        </a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="https://github.com/KiHyeon-Hong">
                            <asp:Image ID="myGit" runat="server" ImageUrl="~/PageImages/git.jpg" Height="25px" Width="25px" />
                        </a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="https://youtube.com/">
                            <asp:Image ID="myYoutube" runat="server" ImageUrl="~/PageImages/youtube.jpg" Height="25px" Width="25px" />
                        </a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                </tr>
            </table>
        </footer>
    </form>
</body>
</html>
