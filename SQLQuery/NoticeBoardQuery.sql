create table Member (
	userId int identity(1,1) primary key,
	id nvarchar(20) not null,
	pwd nvarchar(20) not null,
	userName nvarchar(20) not null,
	userEmail nvarchar(50) not null,
	birthYear int not null,
	birthMon int not null,
	birthDay int not null,
	phoneNum nvarchar(20) not null,
	alarm int not null,
	userProfile nvarchar(20) not null
);

create table Write (
	writeId int identity(1,1) primary key,
	category int not null,
	title nvarchar(256) not null,
	body ntext not null,
	createDay date not null,
	updateDay date,
	emailAtt nvarchar(20),
	userId int not null,
	viewCount int not null default 0,
	foreign key(userId) references Member(userId)
);


create table Comment (
	commentId int identity(1,1) primary key,
	writeId int not null,
	userId int not null,
	body nvarchar(256) not null,
	bestCheck int not null,
	foreign key(writeId) references Write(writeId),
	foreign key(userId) references Member(userId)
);


select * from Member;
select * from Write;
select * from Comment;


insert into Member(id, pwd, userName, userEmail, birthYear, birthMon, birthDay, phoneNum, alarm, userProfile) values(N'user1', N'1234', N'홍기현', N'ghdrlgus96@naver.com', 1996, 10, 2, N'+821066055379', 1, N'cute.gif');
insert into Member(id, pwd, userName, userEmail, birthYear, birthMon, birthDay, phoneNum, alarm, userProfile) values(N'user2', N'1234', N'user2', N'user2@naver.com', 1997, 1, 1, N'+821066055379', 0, N'user2.jpg');
insert into Member(id, pwd, userName, userEmail, birthYear, birthMon, birthDay, phoneNum, alarm, userProfile) values(N'user3', N'1234', N'user3', N'user3@naver.com', 1980, 3, 10, N'+821066055379', 0, N'user3.jpg');
insert into Member(id, pwd, userName, userEmail, birthYear, birthMon, birthDay, phoneNum, alarm, userProfile) values(N'user4', N'1234', N'user4', N'user4@naver.com', 2002, 7, 7, N'+821066055379', 0, N'user4.jpg');
insert into Member(id, pwd, userName, userEmail, birthYear, birthMon, birthDay, phoneNum, alarm, userProfile) values(N'user5', N'1234', N'user5', N'user5@naver.com', 1970, 3, 1, N'+821066055379', 0, N'user9.jpg');

insert into Write(category, title, body, createDay, updateDay, emailAtt, userId, viewCount) values(2, N'미국의 수도는?', N'미국의 수도는 어디일까요?', N'2020-11-10', N'2020-11-15', N'미국.jpg', 1, 6);
insert into Write(category, title, body, createDay, updateDay, emailAtt, userId, viewCount) values(2, N'독일의 수도는?', N'독일의 수도는 어디일까요? 가르쳐주세요!', N'2020-11-10', N'2020-11-15', N'독일.JPG', 1, 2);
insert into Write(category, title, body, createDay, updateDay, emailAtt, userId, viewCount) values(1, N'브라질의 수도는?', N'브라질의 수도는 어디일까요? 가르쳐주세요!', N'2020-11-10', N'2020-11-15', N'브라질.jpg', 1, 0);
insert into Write(category, title, body, createDay, updateDay, emailAtt, userId, viewCount) values(2, N'스위스의 수도는?', N'스위스의 수도는 어디일까요? 가르쳐주세요!', N'2020-11-10', N'2020-11-15', N'스위스.jpg', 1, 7);
insert into Write(category, title, body, createDay, updateDay, emailAtt, userId, viewCount) values(1, N'우주에서 가장 아름다운 별은 어딨을까요?', N'어딨을까요?', N'2020-11-11', N'2020-11-15', N'image10.jpg', 2, 2);
insert into Write(category, title, body, createDay, updateDay, emailAtt, userId, viewCount) values(2, N'하늘이 푸른색인 이유는?', N'무엇일까요?', N'2020-11-11', N'2020-11-15', N'image7.jpg', 2, 4);
insert into Write(category, title, body, createDay, updateDay, emailAtt, userId, viewCount) values(1, N'가장 맑은 호수는 어딨나요?', N'궁금합니다!', N'2020-11-11', N'2020-11-15', N'image9.jpg', 2, 0);
insert into Write(category, title, body, createDay, updateDay, emailAtt, userId, viewCount) values(1, N'스페인의 수도는?', N'스페인의 수도는 어디일까요? 가르쳐주세요!', N'2020-11-11', N'2020-11-16', N'스페인.jpg', 3, 0);
insert into Write(category, title, body, createDay, updateDay, emailAtt, userId, viewCount) values(1, N'올림픽 1회는 왜 그리스인가요?', N'왜 일까요?', N'2020-11-11', N'2020-11-16', N'그리스.jpg', 1, 1);
insert into Write(category, title, body, createDay, updateDay, emailAtt, userId, viewCount) values(2, N'게임 추천 부탁드립니다!', N'게임 추천 부탇드립니다!', N'2020-11-12', N'2020-11-16', N'cute.gif', 1, 7);
insert into Write(category, title, body, createDay, updateDay, emailAtt, userId, viewCount) values(2, N'일본의 수도는?', N'일본의 수도는 어디일까요? 가르쳐주세요!', N'2020-11-12', N'2020-11-16', N'일본.jpg',1, 14);
insert into Write(category, title, body, createDay, updateDay, emailAtt, userId, viewCount) values(1, N'인도 여행 예정인데 어디갈지 추천받아요', N'추천받습니다!', N'2020-11-12', N'2020-11-16', N'인도.jpg', 1, 1);
insert into Write(category, title, body, createDay, updateDay, emailAtt, userId, viewCount) values(3, N'노을은 왜 빨간색인가요?', N'왜일까요?', N'2020-11-12', N'2020-11-16', N'image8.jpg', 3, 9);
insert into Write(category, title, body, createDay, updateDay, emailAtt, userId, viewCount) values(2, N'이 사진 이뻐요', N'진짜 이쁩니다', N'2020-11-12', N'2020-11-16', N'image2.jpg', 3, 5);
insert into Write(category, title, body, createDay, updateDay, emailAtt, userId, viewCount) values(1, N'캐나다의 국기에는 왜 단풍잎이 있나요?', N'어째서 일까요?', N'2020-11-13', N'2020-11-16', N'캐나다.jpg', 3, 0);
insert into Write(category, title, body, createDay, updateDay, emailAtt, userId, viewCount) values(1, N'스페인 국기 어떻게 그려요?', N'어떻게 그릴까요? 어려워요', N'2020-11-13', N'2020-11-16', N'스페인.jpg', 3, 0);
insert into Write(category, title, body, createDay, updateDay, emailAtt, userId, viewCount) values(1, N'이번 방학에 스페인 여행 예정인데...', N'어디갈까요?', N'2020-11-13', N'2020-11-16', N'스페인.jpg', 3, 1);
insert into Write(category, title, body, createDay, updateDay, emailAtt, userId, viewCount) values(1, N'글 작성 시 알람 기능 추가된게 사실인가요?', N'사실인가요?', N'2020-11-13', N'2020-11-16', N'user5.jpg', 2, 6);
insert into Write(category, title, body, createDay, updateDay, emailAtt, userId, viewCount) values(3, N'댓글 달아도 문자 가나요?', N'가나요?', N'2020-11-13', N'2020-11-17', N'user7.jpg', 3, 16);
insert into Write(category, title, body, createDay, updateDay, emailAtt, userId, viewCount) values(3, N'대한민국의 수도는?', N'대한민국의 수도는 어디일까요? 가르쳐주세요!', N'2020-11-14', N'2020-11-17', N'image1.jpg', 1, 9);

insert into Comment(writeId, userId, body, bestCheck) values(4, 2, N'스위스는 시계를 잘 만듭니다', 0);
insert into Comment(writeId, userId, body, bestCheck) values(4, 2, N'수도는 잘 모르겠어요', 0);
insert into Comment(writeId, userId, body, bestCheck) values(11, 2, N'일본의 수도는 아마도 교토입니다!', 0);
insert into Comment(writeId, userId, body, bestCheck) values(11, 2, N'교토 아니면 오사카 입니다!', 0);
insert into Comment(writeId, userId, body, bestCheck) values(11, 2, N'오사카도 아니면 잘 모르겠습니다!', 0);
insert into Comment(writeId, userId, body, bestCheck) values(11, 3, N'일본의 수도는 도쿄입니다', 0);
insert into Comment(writeId, userId, body, bestCheck) values(11, 4, N'뉴욕입니다', 0);
insert into Comment(writeId, userId, body, bestCheck) values(1, 3, N'뉴욕?', 0);
insert into Comment(writeId, userId, body, bestCheck) values(2, 3, N'소세지랑 맥주가 맛있어요', 0);
insert into Comment(writeId, userId, body, bestCheck) values(14, 1, N'질문 게시판에는 질문만 올려주세요', 0);
insert into Comment(writeId, userId, body, bestCheck) values(14, 1, N'아니면 나빠요', 0);
insert into Comment(writeId, userId, body, bestCheck) values(13, 1, N'그것은 빨간색이기 때문입니다...', 1);
insert into Comment(writeId, userId, body, bestCheck) values(13, 2, N'그것도 모르나요?', 0);
insert into Comment(writeId, userId, body, bestCheck) values(6, 1, N'그것은 푸른색이기 때문입니다...', 0);
insert into Comment(writeId, userId, body, bestCheck) values(10, 2, N'게임할 시간에 코딩합시다^^', 0);
insert into Comment(writeId, userId, body, bestCheck) values(10, 2, N'정처기 공부도 좋아요!', 0);
insert into Comment(writeId, userId, body, bestCheck) values(19, 2, N'네 갑니다!', 1);
insert into Comment(writeId, userId, body, bestCheck) values(19, 1, N'아뇨 안갑니다!', 0);
insert into Comment(writeId, userId, body, bestCheck) values(20, 2, N'도쿄입니다!', 0);
insert into Comment(writeId, userId, body, bestCheck) values(20, 3, N'서울입니다!', 1);