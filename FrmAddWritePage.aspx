<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmAddWritePage.aspx.cs" Inherits="HKHNoticeBoard.FrmAddWritePage" %>

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

        function writeCheck() {
            let titleCheck = document.getElementById("title");
            let bodyCheck = document.getElementById("body");
            let emailAttCheck = document.getElementById("emailAtt");

            if (titleCheck.value == "") {
                alert("제목을 입력해주세요");
                return false;
            }
            else if (bodyCheck.value == "") {
                alert("내용을 입력해주세요");
                return false;
            }
            else if (emailAttCheck.value == "") {
                alert("이미지를 첨부해주세요");
                return false;
            }
            else {
                return true;
            }
        }

        function cancelCheck() {
            return confirm("작성한 게시글은 저장되지 않습니다. 정말 나갈까요?");
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

            <table style="width: 50%; margin-left: auto; margin-right: auto; margin-top: auto; margin-bottom:auto;">
                <tr>
                    <td>
                        <asp:Label ID="myUserName" runat="server" Text="작성자 : "></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="userName" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="myTitle" runat="server" Text="제목 : "></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="title" runat="server" Width="650px" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="myBody" runat="server" Text="내용 : "></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="body" runat="server" TextMode="MultiLine" Height="300px" Width="650px" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="myEmailAtt" runat="server" Text="첨부파일 : "></asp:Label>
                    </td>
                    <td class="auto-style1">
                       <asp:FileUpload ID="emailAtt" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>

                    </td>
                    <td style="text-align: right" class="auto-style1">
                        <asp:Button ID="addWrite" runat="server" Text="저장" CssClass="btn" OnClientClick="return writeCheck()" OnClick="addWrite_Click" />
                        <asp:Button ID="cancelWrite" runat="server" Text="취소" CssClass="btn" OnClientClick="return cancelCheck()" OnClick="cancelWrite_Click" />
                    </td>
                </tr>
            </table>


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