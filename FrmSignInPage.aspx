<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmSignInPage.aspx.cs" Inherits="HKHNoticeBoard.FrmSignInPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        function myCheck() {
            let myState = document.getElementById("signInState");
            if (myState.innerHTML == "로그아웃")
                return true;
            else {
                let result = alert("로그인을 해주세요");
                return false;
            }
        }

        function loginCheck() {
            let idCheck = document.getElementById("id");
            let pwdCheck = document.getElementById("pwd");

            if (idCheck.value == "") {
                alert("ID를 입력해주세요");
                return false;
            }
            else if (pwdCheck.value == "") {
                alert("비밀번호를 입력해주세요");
                return false;
            }
            else {
                return true;
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <header style="float:left;width:100%">
            <br />
            &nbsp;<asp:ImageButton ID="myLogo" runat="server" ImageUrl="~/PageImages/logo.png" PostBackUrl="FrmMainPAge.aspx"  Height="50px" Width="150px" />
            <span style="top: 4%; right: 35%; position: absolute">
                <a href="FrmMainPage.aspx?category=0">전체</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="FrmMainPage.aspx?category=1">새질문</a>&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="FrmMainPage.aspx?category=2">답변등록중</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="FrmMainPage.aspx?category=3">답변완료</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                <table style="width: 30%; margin-left: auto; margin-right: auto; margin-top: auto; margin-bottom:auto;">
                    <tr>
                        <td>
                            <asp:Label ID="lblId" runat="server" Text="ID : "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="id" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td rowspan="2">
                            &nbsp;<asp:Button ID="signIn" runat="server" Text="Sign In" CssClass="btn btn-default btn-lg btn-info" OnClientClick="return loginCheck()" OnClick="signIn_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPwd" runat="server" Text="PWD : "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="pwd" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:LinkButton ID="signUp" runat="server" PostBackUrl="~/FrmSignUpPage.aspx">Sign Up</asp:LinkButton>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:LinkButton ID="findIdPwd" runat="server" PostBackUrl="~/FrmFindPage.aspx">Find Id / PWD</asp:LinkButton>
                        </td>
                    </tr>
                    <tr style="text-align: center">
                        <td colspan="2">
                            <asp:Label ID="resultMessage" runat="server" Text=""></asp:Label>
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