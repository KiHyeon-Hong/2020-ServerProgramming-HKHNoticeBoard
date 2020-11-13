<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmDetailPage.aspx.cs" Inherits="HKHNoticeBoard.FrmDetailPage" %>

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
        function deleteCheck() {
            return confirm("정말로 삭제하시겠습니까?");
        }

        function commentCheck() {
            let commentCheck = document.getElementById("comment");
            let myState = document.getElementById("signInState");
            if (commentCheck.value == "") {
                alert("코멘트를 입력해주세요");
                return false;
            }
            else if (myState.innerHTML == "로그인") {
                alert("로그인을 해주세요");
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
                        <asp:Label ID="myCreateDay" runat="server" Text="작성일 : "></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="createDay" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="myUpdateDay" runat="server" Text="수정일 : "></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="updateDay" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="myViewCount" runat="server" Text="조회수 : "></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="viewCount" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="myTitle" runat="server" Text="제목 : "></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:Label ID="title" runat="server" Width="650px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="myBody" runat="server" Text="내용 : "></asp:Label>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="body" runat="server" TextMode="MultiLine" Height="300px" Width="650px" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        
                    </td>
                    <td class="auto-style1" style="text-align: center">
                       <hr />
                        <asp:Image ID="emailAtts" runat="server" Height="250px" Width="250px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        
                    </td>
                    <td style="text-align: right" class="auto-style1">
                        <asp:Button ID="updateWrite" runat="server" Text="수정" CssClass="btn" OnClientClick="return myCheck()" OnClick="updateWrite_Click" />
                        <asp:Button ID="deleteWrite" runat="server" Text="삭제" CssClass="btn" OnClientClick="return deleteCheck()" OnClick="deleteWrite_Click" />
                        <asp:Button ID="boardList" runat="server" Text="글목록" CssClass="btn" PostBackUrl="~/FrmMainPage.aspx" />
                    </td>
                </tr>
                <tr>
                    <td>
                       
                    </td>
                    <td>
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="myComment" runat="server" Text="댓글 : "></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="comment" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:Button ID="addComment" runat="server" Text="작성" OnClientClick="return commentCheck()" OnClick="addComment_Click" />
                    </td>
                </tr>
                <asp:Label ID="commentList" runat="server" Text=""></asp:Label>
            </table>
        </main>
    </form>
</body>
</html>