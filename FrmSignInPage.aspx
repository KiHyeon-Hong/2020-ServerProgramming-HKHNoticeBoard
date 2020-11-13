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
            <span style="top: 4%; right: 40%; position: absolute">
                <a href="FrmMainPage.aspx?category=0">전체</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="FrmMainPage.aspx?category=1">공지사항</a>&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="FrmMainPage.aspx?category=2">Q&A</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="FrmMainPage.aspx?category=3">FAQ</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
    </form>
</body>
</html>