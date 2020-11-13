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
                        <asp:Label ID="myCategory" runat="server" Text="카테고리 : "></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="category" runat="server">
                            <asp:ListItem Value="1">공지사항</asp:ListItem>
                            <asp:ListItem Value="2">Q&A</asp:ListItem>
                            <asp:ListItem Value="3">FAQ</asp:ListItem>
                        </asp:DropDownList>
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
    </form>
</body>
</html>