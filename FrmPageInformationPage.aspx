<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmPageInformationPage.aspx.cs" Inherits="HKHNoticeBoard.FrmPageInformationPage" %>

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
                    <td style="text-align: center" rowspan="5" >
                        <b>공통기능</b>
                    </td>
                    <td>
                        ImageButton 기능을 이용하여 logo를 클릭하면 메인 게시판으로 이동
                    </td>
                </tr>
                <tr>
                    <td>
                        하이퍼 링크를 통하여 공지사항, Q&A, FAQ, 자기소개, 페이지소개로 이동 가능
                    </td>
                </tr>
                <tr>
                    <td>
                        비로그인 시 기본 프로필 사진이 뜨며, 로그인 후 프로필 사진 변경과 동시에 마이페이지로 이동 가능
                    </td>
                </tr>
                <tr>
                    <td>
                        footer에 기본 정보제공
                    </td>
                </tr>
                <tr>
                    <td>
                        하이퍼 링크와 image를 이용하여 각각의 git, blog, youtube 아이콘을 클릭하여 나의 페이지로 이동 가능
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center" rowspan="4" >
                        <b>FrmMainPage.aspx</b>
                    </td>
                    <td>
                        제목, 내용, 작성자별로 글 찾기 기능 추가
                    </td>
                </tr>
                <tr>
                    <td>
                        글쓰기 기능 : 비로그인 시 경고창을 띄움
                    </td>
                </tr>
                <tr>
                    <td>
                        게시판 글 클릭 시 상세 화면으로 넘어감, 첨부 이미지를 미리 볼 수 있음
                    </td>
                </tr>
                <tr>
                    <td>
                        페이지네이션 기능을 통하여 한 페이지에는 총 10개의 게시글만 볼 수 있음
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center" rowspan="3" >
                        <b>FrmSignUInPage.aspx</b>
                    </td>
                    <td>
                        아이디, 혹은 비밀번호 미입력 시 경고창을 띄움
                    </td>
                </tr>
                <tr>
                    <td>
                        아이디, 혹은 비밀번호 미일치 시 경고문과 함계 비밀번호를 지움
                    </td>
                </tr>
                <tr>
                    <td>
                        회원가입 기능과 아이디 및 비밀번호 찾기 페이지로 넘어갈 수 있음
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center" rowspan="3" >
                        <b>FrmSignUpPage.aspx</b>
                    </td>
                    <td>
                        모든 문장의 유효성 검사를 통하여 하나라도 미 입력 시 회원가입 되지 않음
                    </td>
                </tr>
                <tr>
                    <td>
                        프로필 사진은 추후 게시글 등록, 댓글등에서 이름 옆에 뜨는 사진
                    </td>
                </tr>
                <tr>
                    <td>
                        알람 설정은 게시글 등록이나 댓글이 작성되었을 때 문자 서비스 제공 여부
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center" rowspan="1" >
                        <b>FrmFindPage.aspx</b>
                    </td>
                    <td>
                        아이디, 비밀번호 찾기기능으로 데이터베이스에서 조건을 주어 정보를 알아냄
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center" rowspan="10" >
                        <b>FrmDetailPage.aspx</b>
                    </td>
                    <td>
                        RestFul의 get으로 wid에서 어떤 글인지에 따라 보여주는 것이 다름
                    </td>
                </tr>
                <tr>
                    <td>
                        TextBox에 글을 띄워주지만, ReadOnly로 설정하여 글 변경이 불가능
                    </td>
                </tr>
                <tr>
                    <td>
                        로그인 사용자에 따라 자신이 쓴 글이면 수정, 삭제 버튼이 보이도록 만듬(Visible=true)
                    </td>
                </tr>
                <tr>
                    <td>
                        글 작성일과 별개로 최근 글 수정일을 볼 수 있음
                    </td>
                </tr>
                <tr>
                    <td>
                        글 작성시 첨부했던 이미지를 볼수 있도록 만듬
                    </td>
                </tr>
                <tr>
                    <td>
                        댓글을 달 수 있음
                    </td>
                </tr>
                <tr>
                    <td>
                        댓글을 달아도 남의 댓글 옆에는 삭제 버튼이 안보이지만, 내가 쓴 댓글이면 삭제 버튼이 보임
                    </td>
                </tr>
                <tr>
                    <td>
                        게시글 클릭마다 조회수가 1씩 증가함
                    </td>
                </tr>
                <tr>
                    <td>
                        새로운 댓글이 달리면 게시글 작성자에게 문자 메시지가 날아감
                    </td>
                </tr>
                <tr>
                    <td>
                        댓글 옆에는 댓글을 단 사람의 프로필 사진도 함께 뜸
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center" rowspan="4" >
                        <b>FrmAddWritePage.aspx</b>
                    </td>
                    <td>
                        예외처리를 통하여 제목, 내용, 첨부 이미지 중 하나라도 없는 경우 경고창과 함께 작성이 되지 않음
                    </td>
                </tr>
                <tr>
                    <td>
                        DropDownList를 통하여 공지사항, Q&A, FAQ 중 하나를 선택할 수 있음
                    </td>
                </tr>
                <tr>
                    <td>
                        FileUpload를 통하여 첨부 이미지를 올릴 수 있음
                    </td>
                </tr>
                <tr>
                    <td>
                        OnClientClick 후 Onclick을 통하여 기본적인 검사는 서버가 아닌 클라이언트에서 실시
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center" rowspan="2" >
                        <b>FrmUpdateWrite.aspx</b>
                    </td>
                    <td>
                        wid를 읽어와 띄워주고, 수정, 업데이트 날짜 변경 등 게시글을 수정할 수 있음
                    </td>
                </tr>
                <tr>
                    <td>
                        만약 중간에 나가려고 한다면, 경고창을 띄워 한번 더 확인 가능
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center" rowspan="1" >
                        <b>FrmMyPage.aspx</b>
                    </td>
                    <td>
                        회원가입 정보를 볼 수 있으며, 정보 수정도 가능
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center" rowspan="2" >
                        <b>FrmInfoUpdatePAge.aspx</b>
                    </td>
                    <td>
                        회원가입 정보 수정 기능
                    </td>
                </tr>
                <tr>
                    <td>
                        세샨의 내 정보를 불러와 띄워주고, 수정한 것을 update로 데이터베이스에 실시간 반영
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center" rowspan="1" >
                        <b>FrmInfomationPage.aspx</b>
                    </td>
                    <td>
                        홈페이지 작성자의 정보 페이지
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
