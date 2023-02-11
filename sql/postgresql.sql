create table if not exists public.tb_user
(
    id       serial
        primary key,
    author   varchar(30),
    avatar   varchar(100),
    username varchar(30),
    password varchar(40),
    email    varchar(40)
);

comment on table public.tb_user is '用户表';

comment on column public.tb_user.id is 'id主键';

comment on column public.tb_user.author is '作者名称';

comment on column public.tb_user.avatar is '作者头像';

comment on column public.tb_user.username is '后台登录用户名';

comment on column public.tb_user.password is '后台登录密码';

comment on column public.tb_user.email is '邮箱';

alter table public.tb_user
    owner to lisang;

create table if not exists public.tb_user_link
(
    id          serial
        primary key,
    name        varchar(40),
    url         varchar(100),
    logo_url    varchar(100),
    create_time timestamp,
    status      smallint default 1,
    update_time timestamp
);

comment on table public.tb_user_link is '联系方式表';

comment on column public.tb_user_link.id is 'id主键';

comment on column public.tb_user_link.name is '联系方式名称';

comment on column public.tb_user_link.url is '联系方式链接';

comment on column public.tb_user_link.logo_url is '联系方式封面';

comment on column public.tb_user_link.create_time is '联系方式创建时间';

comment on column public.tb_user_link.status is '联系方式状态，1启用：0禁用';

alter table public.tb_user_link
    owner to lisang;

create table if not exists public.tb_category
(
    id          serial
        primary key,
    name        varchar(30) not null
        constraint unique_category
            unique,
    create_time timestamp,
    status      smallint default 1
);

comment on table public.tb_category is '文章分类表';

comment on column public.tb_category.id is 'id主键';

comment on column public.tb_category.name is '分类名称';

comment on column public.tb_category.create_time is '分类创建时间';

comment on column public.tb_category.status is '分类状态，1启用：0禁用';

alter table public.tb_category
    owner to lisang;

create table if not exists public.tb_tag
(
    id          serial
        primary key,
    name        varchar(30) not null
        constraint unique_tag
            unique,
    create_time timestamp,
    status      smallint default 1
);

comment on table public.tb_tag is '文章标签表';

comment on column public.tb_tag.id is 'id主键';

comment on column public.tb_tag.name is '标签名称';

comment on column public.tb_tag.create_time is '标签创建时间';

comment on column public.tb_tag.status is '标签状态，1启用：0禁用';

alter table public.tb_tag
    owner to lisang;

create table if not exists public.tb_article_category
(
    id          serial
        primary key,
    article_id  integer,
    category_id integer
);

comment on table public.tb_article_category is '文章和文章分类关系表';

comment on column public.tb_article_category.id is 'id主键';

comment on column public.tb_article_category.article_id is '文章id';

comment on column public.tb_article_category.category_id is '分类id';

alter table public.tb_article_category
    owner to lisang;

create table if not exists public.tb_article_tag
(
    id         serial
        primary key,
    article_id integer,
    tag_id     integer
);

comment on table public.tb_article_tag is '文章和文章标签关系表';

comment on column public.tb_article_tag.id is 'id主键';

comment on column public.tb_article_tag.article_id is '文章id';

comment on column public.tb_article_tag.tag_id is '标签id';

alter table public.tb_article_tag
    owner to lisang;

create table if not exists public.tb_article
(
    id          integer  default nextval('tb_article_temp_id_seq'::regclass) not null
        constraint tb_article_temp_pkey
            primary key,
    title       varchar(100)                                                 not null
        constraint unique_title
            unique,
    summary     varchar(200),
    cover       varchar(100),
    content     text,
    is_comment  boolean  default true,
    click_num   integer  default 0,
    create_time timestamp,
    update_time timestamp,
    status      smallint default 1
);

comment on table public.tb_article is '文章表';

comment on column public.tb_article.id is 'id主键';

comment on column public.tb_article.title is '文章标题';

comment on column public.tb_article.summary is '文章简介';

comment on column public.tb_article.cover is '文章封面';

comment on column public.tb_article.content is '文章内容，Markdown格式';

comment on column public.tb_article.is_comment is '是否开启评论';

comment on column public.tb_article.click_num is '文章点击数';

comment on column public.tb_article.create_time is '文章创建时间';

comment on column public.tb_article.update_time is '文章更新时间';

comment on column public.tb_article.status is '文章状态，1已发布：0待发布';

alter table public.tb_article
    owner to lisang;

create table if not exists public.tb_setting
(
    id          serial
        primary key,
    update_time timestamp,
    notice      varchar(100) not null,
    record      varchar(100),
    date        date         not null,
    protocol    varchar(100) not null,
    explanation varchar(300),
    about       text
);

comment on column public.tb_setting.id is 'id主键';

comment on column public.tb_setting.update_time is '更新时间';

comment on column public.tb_setting.notice is '网站公告';

comment on column public.tb_setting.record is '备案信息';

comment on column public.tb_setting.date is '开始时间';

comment on column public.tb_setting.protocol is '文章许可协议';

comment on column public.tb_setting.explanation is '底栏自定义信息';

comment on column public.tb_setting.about is '关于';

alter table public.tb_setting
    owner to lisang;

create table if not exists public.tb_links
(
    id          serial
        primary key,
    title       varchar(100) not null,
    summary     varchar(200),
    username    varchar(100),
    url         varchar(200) not null,
    logo_url    text,
    create_time timestamp,
    update_time timestamp,
    is_show     boolean      not null
);

alter table public.tb_links
    owner to lisang;

