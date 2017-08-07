create database votedb;

use votedb;

--用户表
create table voteuser
(
  uid   int primary key auto_increment,
  uname varchar(50),
  pwd varchar(50)
)

select * from voteuser where uname = 'a' and pwd = '6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2'

  
--投票主题
create table votesubject
(
  vsid    int primary key auto_increment,       
  title   varchar( 2000),
  stype int
)



--投票内容对应的选项表
create table voteoption
(
  voteid     int primary key auto_increment,    
  voteoption    VARCHAR(2000) not null,   
  vsid     int not null, 
  voteorder  int not null  
)

alter table voteoption
    add constraint fk_voteoption
       foreign key( vsid) references votesubject(vsid);


--用户投票取值表
create table voteitem
(
  viid      int primary key auto_increment, 
  voteid      int  not null, 
  vsid     int not null, 
  uid int not null 
)




alter table voteitem
    add constraint fk_voteitem_voteid
       foreign key( voteid) references voteoption(voteid);
alter table voteitem
    add constraint fk_voteitem_vsid
       foreign key( vsid) references votesubject(vsid);
alter table voteitem
    add constraint fk_voteitem_uid
       foreign key( uid) references voteuser(uid);



--添加用户
insert into voteuser ( uname, pwd)
values ('a', 'a');
insert into voteuser ( uname, pwd)
values ('b', 'a');
insert into voteuser ( uname, pwd)
values ('c', 'a');

select * from voteuser

update voteuser set pwd='6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2'

--添加投票主题
insert into votesubject (TITLE, sTYPE)
values ( '选出你心目中最好的下载工具', 2);
insert into votesubject (TITLE, sTYPE)
values ( '选出你心目中最好的输入法', 1);
insert into votesubject (TITLE, sTYPE)
values ( '选出你心目中最好的网络聊天工具', 2);
insert into votesubject (TITLE, sTYPE)
values ( '你最想区的地方', 1);
insert into votesubject (TITLE, sTYPE)
values ( '选出你心目中最好的浏览器', 1);
insert into votesubject (TITLE, sTYPE)
values ('选出你心目中最好的杀毒软件', 1);
insert into votesubject(title, stype)
values( '中国的首都是?',1);

--添加主题中的选项
insert into voteoption ( voteoption, vsid, voteorder)
values ('腾讯QQ', 3, 1);
insert into voteoption ( voteoption, vsid, voteorder)
values ('MSN', 3, 2);
insert into voteoption ( voteoption, vsid, voteorder)
values ( '迅雷', 1, 1);
insert into voteoption ( voteoption, vsid, voteorder)
values ('新浪UC', 3, 3);
insert into voteoption ( voteoption, vsid, voteorder)
values ( '飞信', 3, 4);
insert into voteoption ( voteoption, vsid, voteorder)
values ( 'Skype', 3, 5);
insert into voteoption ( voteoption, vsid, voteorder)
values ( '阿里旺旺', 3, 6);
insert into voteoption ( voteoption, vsid, voteorder)
values ('百度HI', 3, 7);
insert into voteoption ( voteoption, vsid, voteorder)
values ( '微软IE浏览器', 5, 1);
insert into voteoption ( voteoption, vsid, voteorder)
values ( '火狐（Firefox）浏览器', 5, 2);
insert into voteoption ( voteoption, vsid, voteorder)
values ( '网际快车', 1, 2);
insert into voteoption ( voteoption, vsid, voteorder)
values ( '电驴', 1, 3);
insert into voteoption ( voteoption, vsid, voteorder)
values ( '比特精灵', 1, 4);
insert into voteoption ( voteoption, vsid, voteorder)
values ( '超级旋风', 1, 5);
insert into voteoption ( voteoption, vsid, voteorder)
values ( '搜狗拼音', 2, 1);
insert into voteoption ( voteoption, vsid, voteorder)
values ( '搜狗五笔', 2, 2);
insert into voteoption ( voteoption, vsid, voteorder)
values ( 'QQ拼音', 2, 3);
insert into voteoption ( voteoption, vsid, voteorder)
values ( 'QQ五笔', 2, 4);
insert into voteoption ( voteoption, vsid, voteorder)
values ( '谷歌拼音', 2, 5);
insert into voteoption ( voteoption, vsid, voteorder)
values ( '紫光拼音', 2, 6);
insert into voteoption ( voteoption, vsid, voteorder)
values ( '智能ABC', 2, 7);
insert into voteoption ( voteoption, vsid, voteorder)
values ( '微软拼音', 2, 8);
insert into voteoption ( voteoption, vsid, voteorder)
values ( '万能拼音', 2, 9);
insert into voteoption ( voteoption, vsid, voteorder)
values ( '万能五笔', 2, 10);
insert into voteoption ( voteoption, vsid, voteorder)
values ( '极品拼音', 2, 11);
insert into voteoption ( voteoption, vsid, voteorder)
values ( '极品五笔', 2, 12);
insert into voteoption ( voteoption, vsid, voteorder)
values ( '世界之窗浏览器', 5, 3);
insert into voteoption ( voteoption, vsid, voteorder)
values ( '360浏览器', 5, 4);
insert into voteoption ( voteoption, vsid, voteorder)
values ( '傲游浏览器', 5, 5);
insert into voteoption ( voteoption, vsid, voteorder)
values ( '谷歌（Chrome）浏览器', 5, 6);
insert into voteoption ( voteoption, vsid, voteorder)
values ( '卡巴斯基', 6, 1);
insert into voteoption ( voteoption, vsid, voteorder)
values ( '360杀毒', 6, 2);
insert into voteoption ( voteoption, vsid, voteorder)
values ( 'McAfee', 6, 3);
insert into voteoption ( voteoption, vsid, voteorder)
values ( 'AVG', 6, 4);
insert into voteoption ( voteoption, vsid, voteorder)
values ( '诺顿杀毒', 6, 5);
insert into voteoption ( voteoption, vsid, voteorder)
values ( '瑞星杀毒', 6, 6);
insert into voteoption ( voteoption, vsid, voteorder)
values ('金山毒霸', 6, 7);
insert into voteoption ( voteoption, vsid, voteorder)
values ( '江民杀毒', 6, 8);
insert into voteoption ( voteoption, vsid, voteorder)
values ( '微点防御', 6, 9);
insert into voteoption ( voteoption, vsid, voteorder)
values ( '趋势杀毒', 6, 10);
insert into voteoption ( voteoption, vsid, voteorder)
values ('地域', 4, 1);
insert into voteoption ( voteoption, vsid, voteorder)
values ( '天堂', 4, 2);


insert into voteitem(voteid,vsid,uid) values( 1,3,1);      --1号用户投票3号主题(选出你心目中最好的网络聊天工具, 7个选项)选了a( 腾讯QQ)
insert into voteitem(voteid,vsid,uid) values( 2,3,1);      ----1号用户投票3号主题(选出你心目中最好的网络聊天工具)选了b(MSN)
insert into voteitem(voteid,vsid,uid) values( 4,3,1);      ----1号用户投票3号主题(选出你心目中最好的网络聊天工具)选了c(新浪UC)

insert into voteitem(voteid,vsid,uid) values( 4,3,2);      ----2号用户投票3号主题(选出你心目中最好的网络聊天工具)选了c(新浪UC)

insert into voteitem(voteid,vsid,uid) values( 3,1,1);      ----1号用户投票1号主题(选出你心目中最好的下载工具, 5个选项)选了a(迅雷)

-- distinct(uid)去重, 因为一个用户可以对多选题进行多个投票
select a.vsid,a.title,a.stype,a.usercount,  ifnull(b.optioncount,0) as optioncount from (
		select votesubject.vsid,votesubject.title,votesubject.stype,count( distinct(uid)) as usercount 
		from voteitem 
		right join votesubject
		on voteitem.vsid=votesubject.vsid
		group by voteitem.vsid, votesubject.title
	) a
	left join (
		select votesubject.vsid, count( * ) as optioncount
		from votesubject
		inner join voteoption
		on voteoption.vsid=votesubject.vsid
		group by votesubject.vsid
	)b
	on a.vsid=b.vsid 
where a.vsid=6



--求出某个主题(如3号主题)下每个选项的用户选择数
select a.voteid,a.voteoption,ifnull(b.votecount,0) as votecount from 
(
	select vsid, voteid,voteoption from voteoption where vsid=1
)a
left join 
(
	select vsid,voteid,count(voteid) as votecount  from voteitem
	where vsid=1 
	group by voteid
)b
on a.voteid=b.voteid

select * from voteitem;

select * from voteoption;

select a.vsid,a.title,a.stype,a.usercount,  ifnull(b.optioncount,0) as optioncount from (   select votesubject.vsid,votesubject.title,votesubject.stype,count( distinct(uid)) as usercount   from voteitem  right join votesubject  on voteitem.vsid=votesubject.vsid  group by voteitem.vsid, votesubject.title  ) a  left join (  select votesubject.vsid, count( * ) as optioncount  from votesubject  inner join voteoption  on voteoption.vsid=votesubject.vsid  group by votesubject.vsid  )b  on a.vsid=b.vsid 








