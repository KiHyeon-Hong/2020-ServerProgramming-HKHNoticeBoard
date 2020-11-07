<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmSignUpPage.aspx.cs" Inherits="HKHNoticeBoard.FrmSignUpPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
            <span style="top: 4%; right: 40%; position: absolute">
                <a href="FrmMainPage.aspx?category=0">전체</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="FrmMainPage.aspx?category=1">공지사항</a>&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="FrmMainPage.aspx?category=2">Q&A</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="FrmMainPage.aspx?category=3">FAQ</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </span>
            <asp:Image ID="Image1" runat="server" ImageUrl="~/userProfiles/default.jpg"  style="top: 4%; right: 12%; position: absolute" Height="25px" Width="25px" />
            <a href="#" style="top: 4%; right: 7%; position: absolute">
                <asp:Label ID="myPage" runat="server" Text="Label">마이페이지</asp:Label>
            </a>
            <a href="FrmSignInPage.aspx" style="top: 4%; right: 3%; position: absolute">
                <asp:Label ID="signInState" runat="server" Text="Label">로그인</asp:Label>
            </a>
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
                        <asp:Button ID="check" runat="server" Text="중복체크" CssClass="btn" />
                    </td>
                    <td>
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
                        <asp:Button ID="signUp" runat="server" Text="회원가입" CssClass="btn" OnClick="signUp_Click" />
                        <asp:Button ID="cancel" runat="server" Text="취소" PostBackUrl="~/FrmSignInPage.aspx" CssClass="btn" />
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