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
    sno        nvarchar(50)  primary key,--学科编号
    sname      nvarchar(255) not null--学科名称
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
    no                       nvarchar(50),--机构编码1
    tech_no                  nvarchar(50),--需求编码2
    tech_name                nvarchar(50),--技术需求名称3
    tech_intro_majorproblem  nvarchar(500),--技术需求概述(主要问题)4
    tech_intro_keytechnology nvarchar(500),--技术需求概述(技术关键)5
    tech_intro_target        nvarchar(500),--技术需求概述(预期目标)6
    time_start               nvarchar(50),--需求开始年7
    time_end                 nvarchar(50),--需求结束年8
    keyword                  nvarchar(50),--关键字9
    money_investment         nvarchar(50),--拟投资金额10
    solution                 nvarchar(50),--技术需求解决方式11
    name_join_unit           nvarchar(50),--合作意向单位12
    action_type              nvarchar(50),--科技活动类型13
    suject_specific          nvarchar(50),--学科分类14
    field                    nvarchar(100),--需求技术领域15
    application_industry     nvarchar(50),--应用行业16
    state                    nvarchar(50),--审核状态17
    name                     nvarchar(50),--机构名称18
    glbm                     nvarchar(50),--原因19
    primary key(no,tech_no),
    foreign key(no)  references info(no),
);
drop table basis_information;

--基础研究需求表
create table basis(
    no         nvarchar(50)  not null,--机构编码
    sno        nvarchar(8)  not null,--学科分类编码
    primary key(no,sno),
    foreign key(no)  references info(no),
    foreign key(sno) references suject(sno)
);
drop table basis;

--非基础需求表
create table non_basis(
    no         nvarchar(50)  primary key,--机构编码
    type       nvarchar(20),--研究类型
    field      nvarchar(20),--需求技术领域
    b_use      nvarchar(20),--应用行业
    oper       nvarchar(20),--技术需求合作模式
    b_name     nvarchar(50),--合作意向单位
    money     float,--拟投资总金额
    foreign key(no)  references info(no)
)
drop table non_basis;

--用户权限表
create table qx(
    no         nvarchar(50),--机构编码
    xqzj       nvarchar(50),--需求征集
    xqgl       nvarchar(50),--需求管理
    yhxx       nvarchar(50),--用户信息
    xgmm       nvarchar(50),--修改密码
    xssh       nvarchar(50),--形式审核
    bmsh       nvarchar(50),--部门审核
    tjcx       nvarchar(50),--统计查询
    xtjs       nvarchar(50),--系统介绍
    bzwj       nvarchar(50),--帮助文件
    cjwtjd     nvarchar(50),--常见问题解答
    power      nvarchar(50),--权限
);
drop table qx;

create table glbmb(
    glbm_no    nvarchar(50),--管理部门编码1
    glbm_name  nvarchar(50),--管理部门名称2
)
drop table glbmb;

select count(*) from basis_information;