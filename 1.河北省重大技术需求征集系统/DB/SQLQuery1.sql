--��λ��Ϣ��
create table info(
    name       nvarchar(50)  not null,--��������1
    no         nvarchar(50)  primary key,--��������2
    pwd        nvarchar(50)  not null,--��¼����3
    address    nvarchar(100)  not null,--ͨѶ��ַ4
    url        nvarchar(50),--��ַ5
    fr         nvarchar(50),--���˴���6
    email      nvarchar(50),--��������7
    pcode      nvarchar(50),--��������8
    contact    nvarchar(50),--��ϵ��9
    phone      nvarchar(50),--�̻�10
    mphone     nvarchar(50),--�ֻ�11
    cz         nvarchar(50),--����12
    pro        nvarchar(50),--��������13
    belong     nvarchar(50)  not null,--��ڹ�����14
    intro      nvarchar(500),--�������15
    szdy       nvarchar(50)--���ڵ���16
);
drop table info;

--ѧ�Ʊ�
create table suject(
    sno        nvarchar(50)  primary key,--ѧ�Ʊ��
    sname      nvarchar(255) not null--ѧ������
);
drop table suject;

--Ӧ����ҵ��
create table industry(
    ino        nvarchar(255)  primary key,--��ҵ���
    iname      nvarchar(255) not null--��ҵ����
);
drop table industry;

--�����
create table basis_information(
    no                       nvarchar(50),--��������1
    tech_no                  nvarchar(50),--�������2
    tech_name                nvarchar(50),--������������3
    tech_intro_majorproblem  nvarchar(500),--�����������(��Ҫ����)4
    tech_intro_keytechnology nvarchar(500),--�����������(�����ؼ�)5
    tech_intro_target        nvarchar(500),--�����������(Ԥ��Ŀ��)6
    time_start               nvarchar(50),--����ʼ��7
    time_end                 nvarchar(50),--���������8
    keyword                  nvarchar(50),--�ؼ���9
    money_investment         nvarchar(50),--��Ͷ�ʽ��10
    solution                 nvarchar(50),--������������ʽ11
    name_join_unit           nvarchar(50),--��������λ12
    action_type              nvarchar(50),--�Ƽ������13
    suject_specific          nvarchar(50),--ѧ�Ʒ���14
    field                    nvarchar(100),--����������15
    application_industry     nvarchar(50),--Ӧ����ҵ16
    state                    nvarchar(50),--���״̬17
    name                     nvarchar(50),--��������18
    glbm                     nvarchar(50),--ԭ��19
    primary key(no,tech_no),
    foreign key(no)  references info(no),
);
drop table basis_information;

--�����о������
create table basis(
    no         nvarchar(50)  not null,--��������
    sno        nvarchar(8)  not null,--ѧ�Ʒ������
    primary key(no,sno),
    foreign key(no)  references info(no),
    foreign key(sno) references suject(sno)
);
drop table basis;

--�ǻ��������
create table non_basis(
    no         nvarchar(50)  primary key,--��������
    type       nvarchar(20),--�о�����
    field      nvarchar(20),--����������
    b_use      nvarchar(20),--Ӧ����ҵ
    oper       nvarchar(20),--�����������ģʽ
    b_name     nvarchar(50),--��������λ
    money     float,--��Ͷ���ܽ��
    foreign key(no)  references info(no)
)
drop table non_basis;

--�û�Ȩ�ޱ�
create table qx(
    no         nvarchar(50),--��������
    xqzj       nvarchar(50),--��������
    xqgl       nvarchar(50),--�������
    yhxx       nvarchar(50),--�û���Ϣ
    xgmm       nvarchar(50),--�޸�����
    xssh       nvarchar(50),--��ʽ���
    bmsh       nvarchar(50),--�������
    tjcx       nvarchar(50),--ͳ�Ʋ�ѯ
    xtjs       nvarchar(50),--ϵͳ����
    bzwj       nvarchar(50),--�����ļ�
    cjwtjd     nvarchar(50),--����������
    power      nvarchar(50),--Ȩ��
);
drop table qx;

create table glbmb(
    glbm_no    nvarchar(50),--�����ű���1
    glbm_name  nvarchar(50),--����������2
)
drop table glbmb;

select count(*) from basis_information;