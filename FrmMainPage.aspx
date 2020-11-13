<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmMainPage.aspx.cs" Inherits="HKHNoticeBoard.FrmMainPage" %>

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

            <table style="width: 70%; margin-left: auto; margin-right: auto;"  class="">
                <tr>
                    <td>
                        <asp:DropDownList ID="searchCriteria" runat="server">
                            <asp:ListItem Value="0">제목</asp:ListItem>
                            <asp:ListItem Value="1">내용</asp:ListItem>
                            <asp:ListItem Value="2">작성자</asp:ListItem>
                        </asp:DropDownList>
                        <asp:TextBox ID="searchText" runat="server"></asp:TextBox>
                        <asp:Button ID="search" runat="server" Text="검색" CssClass="btn btn-primary" OnClick="search_Click" />
                    </td>
                    <td style="text-align: right">
                        <asp:Button ID="addWrite" runat="server" Text="글쓰기" type="button" CssClass="btn btn-primary" OnClientClick="return myCheck()" OnClick="addWrite_Click" />
                    </td>
                </tr>
            </table>
            <br />

            <asp:Label ID="board" runat="server" Text=""></asp:Label>
            <hr />
                
                <nav style="text-align: center">
                    <ul class="pagination">
                        <asp:Label ID="myPaginnation" runat="server" Text=""></asp:Label>
                    </ul>
                </nav>

        </main>
    </form>
</body>
</html>