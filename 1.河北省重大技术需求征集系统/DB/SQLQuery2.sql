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
    sno        nvarchar(8)  primary key,--ѧ�Ʊ��
    sname      nvarchar(20) not null--ѧ������
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
    tech_name                nvarchar(50),--������������17
    tech_intro_majorproblem  nvarchar(500),--�����������(��Ҫ����)18
    tech_intro_keytechnology nvarchar(500),--�����������(�����ؼ�)19
    tech_intro_target        nvarchar(500),--�����������(Ԥ��Ŀ��)20
    time_start               nvarchar(50),--����ʼ��21
    time_end                 nvarchar(50),--���������22
    keyword                  nvarchar(50),--�ؼ���23
    money_investment         nvarchar(50),--��Ͷ�ʽ��24
    solution                 nvarchar(50),--������������ʽ25
    name_join_unit           nvarchar(50),--��������λ26
    action_type              nvarchar(50),--�Ƽ������27
    suject_specific          nvarchar(50),--ѧ�Ʒ���28
    field                    nvarchar(100),--����������29
    application_industry     nvarchar(50),--Ӧ����ҵ30
);
drop table basis_information;

--�����о������
create table basis(
    no         nvarchar(20)  not null,--��������
    sno        nvarchar(8)  not null,--ѧ�Ʒ������
    primary key(no,sno),
    foreign key(no)  references info(no),
    foreign key(sno) references suject(sno)
);
drop table basis;

--�ǻ��������
create table non_basis(
    no         nvarchar(20)  primary key,--��������
    type       nvarchar(20),--�о�����
    field      nvarchar(20),--����������
    b_use      nvarchar(20),--Ӧ����ҵ
    oper       nvarchar(20),--�����������ģʽ
    b_name     nvarchar(50),--��������λ
    money     float,--��Ͷ���ܽ��
    foreign key(no)  references info(no)
)
drop table non_basis;