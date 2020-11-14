<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmInfomationPage.aspx.cs" Inherits="HKHNoticeBoard.FrmInfomationPage" %>

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
            <table style="width: 70%; margin-left: auto; margin-right: auto;"  class="table table-bordered table-hover">
                <tr>
                    <td style="text-align: center" colspan="2">
                        <b>기본 사항</b>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <b>이름</b>
                    </td>
                    <td>
                        홍기현
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <b>이름(영어)</b>
                    </td>
                    <td>
                        KiHyeon Hong
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <b>생년월일</b>
                    </td>
                    <td>
                        1996년 10월 2일
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <b>휴대폰</b>
                    </td>
                    <td>
                        010-6605-5379
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <b>주소</b>
                    </td>
                    <td>
                        서울시 노원구 월계로 55길 15, 303동 1302호
                    </td>
                </tr>
            </table>
            <br />
            <hr />
            <br />
            <table style="width: 70%; margin-left: auto; margin-right: auto;"  class="table table-bordered table-hover">
                <tr>
                    <td style="text-align: center" colspan="3">
                        <b>교내 수상경력</b>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <b>수상날짜</b>
                    </td>
                    <td style="text-align: center">
                        <b>개발내용</b>
                    </td>
                    <td style="text-align: center">
                        <b>수상내역</b>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        2019.06.04
                    </td>
                    <td style="text-align: center">
                        SW경진대회
                    </td>
                    <td style="text-align: center">
                        최우수상(1등)
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        2019.12.11
                    </td>
                    <td style="text-align: center">
                        학생융합캠프
                    </td>
                    <td style="text-align: center">
                        장려상(3등)
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        2019.12.20
                    </td>
                    <td style="text-align: center">
                        X-Design 경진대회
                    </td>
                    <td style="text-align: center">
                        3등
                    </td>
                </tr>
            </table>
            <br />
            <hr />
            <br />
            <table style="width: 70%; margin-left: auto; margin-right: auto;"  class="table table-bordered table-hover">
                <tr>
                    <td style="text-align: center" colspan="3">
                        <b>논문 성과</b>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <b>출판일자</b>
                    </td>
                    <td style="text-align: center">
                        <b>기관</b>
                    </td>
                    <td style="text-align: center">
                        <b>제목</b>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        2019.11
                    </td>
                    <td style="text-align: center">
                        한국멀티미디어학회
                    </td>
                    <td style="text-align: center">
                        EOG 기반의 개인식별
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        2019.12
                    </td>
                    <td style="text-align: center">
                        중소기업융합학회
                    </td>
                    <td style="text-align: center">
                        맞춤형 수면케어 서비스를 위한 EOG 기반의 실시간 개인식별 알고리즘
                    </td>
                </tr>
            </table>
            <br />
            <hr />
            <br />
            <table style="width: 70%; margin-left: auto; margin-right: auto;"  class="table table-bordered table-hover">
                <tr>
                    <td style="text-align: center" colspan="3">
                        <b>프로젝트 경험</b>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <b>기간</b>
                    </td>
                    <td style="text-align: center">
                        <b>기관</b>
                    </td>
                    <td style="text-align: center">
                        <b>개발내용</b>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        2019.05.01.~06.03
                    </td>
                    <td style="text-align: center">
                        가천대학교
                    </td>
                    <td style="text-align: center">
                        블록체인 기반의 투표 및 투표관리 시스템 개발
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        2019.04.29.~06.07
                    </td>
                    <td style="text-align: center">
                        가천대학교
                    </td>
                    <td style="text-align: center">
                        Prossenger(Programming + Messenger) 개발
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        2019.09.02.~11.19
                    </td>
                    <td style="text-align: center">
                        가천대학교
                    </td>
                    <td style="text-align: center">
                        생체데이터를 이용한 개인식별 및 수면분석 서비스
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        2019.11.25.~12.18
                    </td>
                    <td style="text-align: center">
                        가천대학교
                    </td>
                    <td style="text-align: center">
                        AI 기반 제품 검색 및 사용자 맞춤형 쇼핑몰 서비스
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        2019.12.01.~2020.11.31
                    </td>
                    <td style="text-align: center">
                        가천산학단
                    </td>
                    <td style="text-align: center">
                        수면안대 개발
                    </td>
                </tr>
            </table>
            <br />
            <hr />
            <br />
            <table style="width: 70%; margin-left: auto; margin-right: auto;"  class="table table-bordered table-hover">
                <tr>
                    <td style="text-align: center" colspan="2">
                        <b>자격증</b>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <b>취득일</b>
                    </td>
                    <td style="text-align: center">
                        <b>자격증명</b>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        2014.01.25
                    </td>
                    <td style="text-align: center">
                        JLPT N3
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        2019.04.16
                    </td>
                    <td style="text-align: center">
                        SQLD
                    </td>
                </tr>
            </table>
            <br />
            <hr />
            <br />


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
