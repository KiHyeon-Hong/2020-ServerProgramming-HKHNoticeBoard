create table Member (
	userId int identity(1,1) primary key,
	id nvarchar(20) not null,
	pwd nvarchar(20) not null,
	userName nvarchar(20) not null,
	userEmail nvarchar(20) not null,
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
	foreign key(userId) references Member(userId)
);

create table Comment (
	commentId int identity(1,1) primary key,
	writeId int not null,
	userId int not null,
	body nvarchar(256) not null,
	parentCommentId int,
	foreign key(writeId) references Write(writeId),
	foreign key(userId) references Member(userId),
	foreign key(commentId) references Comment(commentId)
);

create table Comment (
	commentId int identity(1,1) primary key,
	writeId int not null,
	userId int not null,
	body nvarchar(256) not null,
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