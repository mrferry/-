--单位信息表
create table info(
    name       nvarchar(50)  not null,--机构名称1
    no         nvarchar(50)  primary key,--机构编码2
    pwd        nvarchar(50)  not null,--登录密码3
    address    nvarchar(100)  not null,--通讯地址4
    url        nvarchar(50),--网址5
    fr         nvarchar(50),--法人代表6
    email      nvarchar(50),--电子邮箱7
    pcode      nvarchar(50),--邮政编码8
    contact    nvarchar(50),--联系人9
    phone      nvarchar(50),--固话10
    mphone     nvarchar(50),--手机11
    cz         nvarchar(50),--传真12
    pro        nvarchar(50),--机构属性13
    belong     nvarchar(50)  not null,--归口管理部门14
    intro      nvarchar(500),--机构简介15
    szdy       nvarchar(50)--所在地域16
);
drop table info;

--学科表
create table suject(
    sno        nvarchar(8)  primary key,--学科编号
    sname      nvarchar(20) not null--学科名称
);
drop table suject;

--应用行业表
create table industry(
    ino        nvarchar(255)  primary key,--行业编号
    iname      nvarchar(255) not null--行业名称
);
drop table industry;

--需求表
create table basis_information(
    tech_name                nvarchar(50),--技术需求名称17
    tech_intro_majorproblem  nvarchar(500),--技术需求概述(主要问题)18
    tech_intro_keytechnology nvarchar(500),--技术需求概述(技术关键)19
    tech_intro_target        nvarchar(500),--技术需求概述(预期目标)20
    time_start               nvarchar(50),--需求开始年21
    time_end                 nvarchar(50),--需求结束年22
    keyword                  nvarchar(50),--关键字23
    money_investment         nvarchar(50),--拟投资金额24
    solution                 nvarchar(50),--技术需求解决方式25
    name_join_unit           nvarchar(50),--合作意向单位26
    action_type              nvarchar(50),--科技活动类型27
    suject_specific          nvarchar(50),--学科分类28
    field                    nvarchar(100),--需求技术领域29
    application_industry     nvarchar(50),--应用行业30
);
drop table basis_information;

--基础研究需求表
create table basis(
    no         nvarchar(20)  not null,--机构编码
    sno        nvarchar(8)  not null,--学科分类编码
    primary key(no,sno),
    foreign key(no)  references info(no),
    foreign key(sno) references suject(sno)
);
drop table basis;

--非基础需求表
create table non_basis(
    no         nvarchar(20)  primary key,--机构编码
    type       nvarchar(20),--研究类型
    field      nvarchar(20),--需求技术领域
    b_use      nvarchar(20),--应用行业
    oper       nvarchar(20),--技术需求合作模式
    b_name     nvarchar(50),--合作意向单位
    money     float,--拟投资总金额
    foreign key(no)  references info(no)
)
drop table non_basis;