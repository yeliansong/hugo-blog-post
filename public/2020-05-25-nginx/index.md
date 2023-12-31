# Nginx


### 1.Nginx是什么？

从Google搜索结果来看，Nginx是一个免费、开源、高性能的HTTP服务器和反向代理，同时也是一个IMAP/POP3代理服务器。 Nginx 以其高性能、稳定性、丰富的功能集、简单的配置和低资源消耗而闻名。 Nginx 最多支持 50000 个并发应用程序。

### 2. 正向和反向代理

转发代理是客户端和目标服务器之间的代理服务器。 为了从原始服务器获取内容，客户端向代理服务器发送请求，并指定目标服务器，然后代理传输到目标服务器，并将获取的内容返回给客户端。

<img src="https://cdn.jsdelivr.net/gh/yeliansong/github-blog-PIC/blog-images/007S8ZIlgy1gf4iaf9a6xj317s0i6dlj.jpg" style="zoom:200%;" />

这样，如果您可以直接访问，则无法访问 www.google.com。 但您可以使用转发代理。 在正向代理中，真正的客户端对服务器来说是不可见的。 最终的结果是你可以通过代理服务器访问www.google.com网站。 这就是转发代理。

好的，现在我们可以比较反向代理了。 事实恰恰相反。 对于客户端来说，反向代理就像目标服务器一样，客户端不需要进行任何设置。 客户端向反向代理发送请求，然后反向代理判断请求的去向，并将请求转发给客户端。

![](https://cdn.jsdelivr.net/gh/yeliansong/github-blog-PIC/blog-images/007S8ZIlgy1gf4j1ik578j31qa0i4tdk.jpg)

和上面一样，反向代理就是代理服务器，很常见。 例如，你每天访问www.google.com，它实际上是一个反向代理，你不知道真实的服务器地址。 只需显示代理地址即可。

### 3.负载均衡

负载均衡，是指将负载均衡分配给多个作业单元运行，以协同完成工作任务。 负载均衡建立在原有的网络结构之上，为扩展服务器和网络设备的带宽、加强网络数据处理能力、增加吞吐量、增加网络可用性和灵活性提供了一种透明且廉价且有效的方法。

<img src="https://cdn.jsdelivr.net/gh/yeliansong/github-blog-PIC/blog-images/007S8ZIlgy1gf4kh82548j30vd0u047l.jpg" style="缩放：50%;" />

上面的架构很常见。 它可以通过负载均衡来平衡互联网请求。 它是在高并发的情况下使用的。

### 4.热备

![img](https://user-gold-cdn.xitu.io/2018/7/4/16463cd149a85d6d?imageslim)

在这张图中，我们可以看到一个负载平衡应用程序。 可用率很高。 有 2 台负载均衡服务器，包括主服务器和辅助服务器。 主从通过健康检查进行通信。 如果主服务器宕机了，那么辅助服务器就无法与主服务器联系，就会知道出了问题。 流量将转发到辅助服务器而不是主服务器。 这样，就可以保证系统的正常运行。

### 5.动静分离

动静分离是让动态网站中的动态网页按照一定的规则区分出不变的资源和不断变化的资源。

Nginx 可以通过配置文件来分离资源。 通过这种方式可以提高性能。

### 6. 最佳实践

可以参考网站。
