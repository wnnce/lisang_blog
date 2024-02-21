## 前言

一个基于`SpringBoot`、`Vue`实现的博客系统。写这个博客系统是我在学习`SpringBoot`和`Vue`的时候萌生的一个想法。起因就是之前的博客框架用的是`Hexo、Hugo`，发布的是静态网页，当需要对博客的内容进行修改时会略微有点麻烦。后来想了想觉得逻辑并不复杂，就认定了自己要建一个前后端分离，带有完整后台管理的博客网站。因为没有系统的学过`Vue`和前端，很多东西都是边学边写，所以网站现在还有很多不完善的地方处于一个非常基础的阶段。后续自己也会慢慢修复BUG以及添加功能，逐渐做为自己的主力博客来使用，用来记录一下学习心得和踩坑笔记！

演示地址[Demo](https://blog.zeroxn.com)

前端代码仓库[Github](https://github.com/wnnce/lisang_blog_vue)

后端代码仓库[Github](https://github.com/wnnce/lisang_blog_server)

> 使用Go和Nextjs重构中，请切换dev分支

## 项目介绍



<img src="https://img.shields.io/static/v1?style=appveyor&logo=Spring Boot&label=SpringBoot&message=2.7.7&color=green" /> <img src="https://img.shields.io/static/v1?style=appveyor&logo=MyBatis&label=MyBatis&message=3.0.1&color=red" /> <img src="https://img.shields.io/static/v1?style=appveyor&logo=druid&label=Druid&message=1.2.15&color=red" /> <img src="https://img.shields.io/static/v1?style=appveyor&logo=Redis&label=Redis&message=7.0.8&color=red" /> <img src="https://img.shields.io/static/v1?style=appveyor&logo=PostgreSQL&label=PostgreSQL&message=14.6&color=blue" /> <img src="https://img.shields.io/static/v1?style=appveyor&logo=Axios&label=Axios&message=1.2.2&color=purple" /> <img src="https://img.shields.io/static/v1?style=appveyor&logo=vue.js&label=Vue&message=3.2.45&color=green" /> <img src="https://img.shields.io/static/v1?style=appveyor&label= Element-Plus&message=2.2.28&color=blue" /> <img src="https://img.shields.io/static/v1?style=appveyor&logo=Ant Design&label= Ant Design Vue&message=3.2.14&color=blue" /> 



网站前端总体使用`Vue3`、博客页面使用`Ant Design Vue`Ui库，后台管理页面使用`Element Plus`Ui库（使用两个Ui库是因为自己想看看哪个Ui比较好用。后续可能会弃用`Element Plus`，全部使用`Ant Design Vue`）、`markdown`的编辑和预览使用的是[v-md-editor](https://github.com/code-farmer-i/vue-markdown-editor)。除了后台管理和博客详情页面，其余页面都做了缓存避免一直大量请求后端。用户可以在后台对博客进行完善的管理，包括但不限于（用户信息修改、文章管理、分类管理、标签管理、评论管理、站点配置）。博客页面进行了移动端适配，后台管理页面暂时还没有。

使用的UI库都做了按需加载，在使用`Vite`打包过后。加载数据最多的首页数据加载量大概`1.1MB`，后续应该还能继续优化到`1MB`以下。代码高亮使用了`v-md-editor`推荐的`prismjs`，自我感觉高亮效果比`highlight`好、全局状态管理使用[pinia](https://pinia.web3doc.top/)，也是Vue官方推荐使用的状态管理库、评论系统调用了[Artalk](https://artalk.js.org/)，一个自托管的评论系统，通过Docker部署在自己的服务器上、前后端端交互使用`axios`，同时使用`nginx`反代后端地址，避免了前后端交互时存在的跨域和`Cookie`问题。

后端主要使用`SpringBoot`做了一个单体项目，数据库使用`Postgresql`、缓存使用`Redis`、数据源引入了阿里的`Druid`数据源配置了线程池和开启了`SQL`监控、Json序列化放弃了`Jackson`使用了谷歌的`gson`、Web服务器也放弃了`tomcat`转而使用`undertow`、分页使用`PageHelper`、登录鉴权使用`Sa-Token`、数据库交互使用`MyBatis`。文章排行榜通过`Redis`的zSet实现，每次服务启动或销毁时都是进行一次数据库和Rerdis的同步。在运行过程中也会通过定时任务每30分钟同步一次数据到数据库。图片上传和验证码发送都是调用了阿里云的API。

## 后续计划

- 后台管理页面移动端适配
- UI和交互优化
- 一些功能修复
- 前台性能优化
- 后台性能优化（缓存更多数据、引入多线程）
- 弃用`Element-Plus`，全部使用`Ant Design Vue`

## 博客预览

**更多图片可以查看images文件夹或者访问上面的演示站点**

![截屏2023-02-11 15.18.52](https://github.com/wnnce/lisang_blog/blob/main/images/%E6%88%AA%E5%B1%8F2023-02-11%2015.17.58.png)

![截屏2023-02-11 15.20.05](https://github.com/wnnce/lisang_blog/blob/main/images/%E6%88%AA%E5%B1%8F2023-02-11%2015.20.05.png)

 ![截屏2023-02-11 15.19.07](https://github.com/wnnce/lisang_blog/blob/main/images/%E6%88%AA%E5%B1%8F2023-02-11%2015.19.07.png)

 ![截屏2023-02-11 15.20.28](https://github.com/wnnce/lisang_blog/blob/main/images/%E6%88%AA%E5%B1%8F2023-02-11%2015.20.28.png)

 ![截屏2023-02-11 15.20.41](https://github.com/wnnce/lisang_blog/blob/main/images/%E6%88%AA%E5%B1%8F2023-02-11%2015.20.41.png)

![截屏2023-02-11 15.21.19](https://github.com/wnnce/lisang_blog/blob/main/images/%E6%88%AA%E5%B1%8F2023-02-11%2015.21.19.png)