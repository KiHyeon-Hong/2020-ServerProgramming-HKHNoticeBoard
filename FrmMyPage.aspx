<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmMyPage.aspx.cs" Inherits="HKHNoticeBoard.FrmMyPage" %>

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
                <table style="width: 40%; margin-left: auto; margin-right: auto; margin-top: auto; margin-bottom:auto;">
                <tr>
                    <td class="auto-style2" Rowspan="7">
                        <asp:Image ID="userProfile" runat="server" Height="400px" Width="400px" />
                    </td>
                    <td>

                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="myId" runat="server" Text="아이디 : "></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="id" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="myPwd" runat="server" Text="비밀번호 : "></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="pwd" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="myUserName" runat="server" Text="이름 : "></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="userName" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="myBirth" runat="server" Text="생일 입력 : "></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="birth" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="myPhoneNum" runat="server" Text="휴대폰 번호: "></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="phoneNum" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="myEmail" runat="server" Text="이메일 : "></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="email" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>

                    </td>
                    <td class="auto-style2">
                        <asp:Label ID="myAlarm" runat="server" Text="알람 수신 여부 : "></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="alarm" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">

                    </td>
                    <td>

                    </td>
                    <td style="text-align: right" class="auto-style1">
                        <asp:Button ID="infoUpdate" runat="server" Text="정보수정" CssClass="btn" OnClick="infoUpdate_Click" />
                    </td>
                </tr>
                </table>
            </div>


        </main>
    </form>
</body>
</html>