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

drop table Member;
drop table Write;
drop table Comment;



select * from Member, Write where Member.userId = Write.userId;

update Member set userProfile='yjs03075.jpg';

insert into Write(category, title, body, createDay, updateDay, emailAtt, userId) values(1, N'테스트용 공지사항입니다.', N'테스트용 공지사항입니다', sysdate(), sysdate(), N'우주.jpg', 1 );

select * from Member, Write where Member.userId = Write.userId order by writeId desc;

update Member set phoneNum='+821066055379' where userId=2;
update Member set phoneNum='+821066055379' where userId=3;
update Member set phoneNum='+821066055379' where userId=4;
update Member set phoneNum='+821066055379' where userId=5;
update Member set phoneNum='+821066055379' where userId=6;
update Member set phoneNum='+821066055379' where userId=7;
update Member set phoneNum='+821066055379' where userId=1002;
update Member set phoneNum='+821066055379' where userId=2;

select * from Member where userName like '%user%';

select * from Member, Write where Member.userId = Write.userId and title like '%테스트%' order by writeId desc;

select * from Write where title like N'%테스트%';

update Write set category=1;