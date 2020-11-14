<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmSignUpPage.aspx.cs" Inherits="HKHNoticeBoard.FrmSignUpPage" %>

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

        function idCheck() {
            let idCheck = document.getElementById("id");
            if (idCheck.value == "") {
                alert("ID를 입력해주세요");
                return false;
            }
            else {
                return true;
            }
        }


        function signUpCheck() {
            let idCheck = document.getElementById("id");
            let checkResult = document.getElementById("checkResult");
            let pwdCheck = document.getElementById("pwd");
            let rPwdCheck = document.getElementById("rPwd");
            let userNameCheck = document.getElementById("userName");
            let phoneNumCheck = document.getElementById("phoneNum");
            let userEmailCheck = document.getElementById("userEmail");
            let myAlarmCheck = document.getElementById("myAlarm");
            let userProfileCheck = document.getElementById("userProfile");

            if (idCheck.value == "") {
                alert("ID를 입력해주세요");
                return false;
            }
            else if (checkResult.innerHTML != "ID가 중복되지 않습니다") {
                alert("ID 중복 확인 체크해주세요");
                return false;
            }
            else if (pwdCheck.value == "") {
                alert("비밀번호를 입력해주세요");
                return false;
            }
            else if (pwdCheck.value != rPwdCheck.value) {
                alert("비밀번호가 일치하지 않습니다");
                return false;
            }
            else if (userNameCheck.value == "") {
                alert("이름을 입력해주세요");
                return false;
            }
            else if (phoneNumCheck.value == "") {
                alert("폰 번호를 입력해주세요");
                return false;
            }
            else if (userEmailCheck.value == "") {
                alert("이메일을 입력해주세요");
                return false;
            }
            else if (userProfileCheck.value == "") {
                alert("프로필을 선택해주세요");
                return false;
            }
            else {
                return true;
            }
        }
    </script>
    <style type="text/css">
        .auto-style1 {
            width: 362px;
        }
        .auto-style2 {
            width: 118px;
        }
    </style>
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
                <table style="width: 30%; margin-left: auto; margin-right: auto; margin-top: auto; margin-bottom:auto;">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="myId" runat="server" Text="아이디 입력 : "></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="id" runat="server" CssClass="form-control"></asp:TextBox>
                        
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                    </td>
                    <td class="auto-style1">
                        <asp:Button ID="check" runat="server" Text="중복체크" CssClass="btn" OnClientClick="return idCheck()" OnClick="check_Click" />
                        <asp:Label ID="checkResult" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="myPwd" runat="server" Text="비밀번호 입력 : "></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="pwd" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="myRPwd" runat="server" Text="비밀번호 확인 : "></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="rPwd" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="myUserName" runat="server" Text="이름 입력 : "></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="userName" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="myBirth" runat="server" Text="생일 입력 : "></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:DropDownList ID="birthYear" runat="server"></asp:DropDownList>
                        <asp:Label ID="myYear" runat="server" Text="년"></asp:Label>
                        <asp:DropDownList ID="birthMon" runat="server"></asp:DropDownList>
                        <asp:Label ID="myMon" runat="server" Text="월"></asp:Label>
                        <asp:DropDownList ID="birthDay" runat="server"></asp:DropDownList>
                        <asp:Label ID="myDay" runat="server" Text="일"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="myPhoneNum" runat="server" Text="휴대폰 번호 입력 : "></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="phoneNum" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="myEmail" runat="server" Text="이메일 입력 : "></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="userEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="myAlarm" runat="server" Text="알람 수신 여부 : "></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:RadioButtonList ID="alarm" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="0">알람 수신 받지 않음</asp:ListItem>
                            <asp:ListItem Value="1">알람 수신 받음</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="myUserProfile" runat="server" Text="프로필 사진 : "></asp:Label>
                    </td>
                    <td>
                        <asp:FileUpload ID="userProfile" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">

                    </td>
                    <td style="text-align: right" class="auto-style1">
                        <asp:Button ID="signUp" runat="server" Text="회원가입" CssClass="btn" OnClientClick="return signUpCheck()" OnClick="signUp_Click" />
                        <asp:Button ID="cancel" runat="server" Text="취소" PostBackUrl="~/FrmSignInPage.aspx" CssClass="btn" />
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