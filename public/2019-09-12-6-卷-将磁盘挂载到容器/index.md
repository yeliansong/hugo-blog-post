# 六、卷-将磁盘挂载到容器




### 1. 卷（volume）

终于等到你了，卷，volume。 也是kubernetes很重要的一个组件啊。不对，应该不能说是k8s的一个组件，应该说是属于POD中的一个组成部分。

卷是用来解决什么问题呢？POD其实相当于一个逻辑主机，每个POD可能有多个容器，这些容器呢，我们知道其实就相当于逻辑主机的进程，这些进程可以共享CPU，RAM，网络等，但是呢，每个容器是由自己的文件系统的，这些系统是相互隔离的，有没办法让这些容器共享文件系统呢？你想这个场景，比如POD里的一个容器挂了，然后重新起一个，但是起的这个呢依旧用之前那个的文件系统资源，怎么解决这个问题，你必须要用卷吗，相当于用共享的这个文件系统。

<img src="https://cdn.jsdelivr.net/gh/yeliansong/github-blog-PIC/blog-images006y8mN6gy1g6x4eedbqdj30hd0fidkk.jpg" style="zoom:200%;" />

看这个，一个POD里面跑了三个容器，每个都是独立的文件系统，你说这个能跑起来吗？我来介绍下这三个容器，webserver， 就是web的入口，content用来放网页信息，log来存放日志，这三个没有共享文件系统，访问时web容器都找不到网页，日志也存放不了。来，看看改进版本。

<img src="https://cdn.jsdelivr.net/gh/yeliansong/github-blog-PIC/blog-images006y8mN6gy1g6x4egqjntj30f70fngs5.jpg" style="zoom:200%;" />

共享卷之后，哈哈哈，能跑了，爽不爽。



###  2. 卷的几种类型

卷其实还是一种存储介质，它用的是宿主机，也就是POD主机的存储媒介。所以卷的性能是受逻辑主机影响的，当然也可以设置卷用memory的存储。根据使用习惯呢，卷也有很多类型。介绍两种：

- [ ] emptyDir

	> 也是最简单的卷类型了，也是其他卷的基础，很好理解了，就是空卷。它的生命周期是和POD的生命周期一致的。这个是在POD启动时，会初始化一块空白的空间来存储内容。<img src="https://cdn.jsdelivr.net/gh/yeliansong/github-blog-PIC/blog-images006y8mN6gy1g6x4ein3a0j30l10d078g.jpg" style="zoom:200%;" />
	>
	> 这个就是例子了，每一个image可以设置卷的路径，然后在volume节点上可以设置卷的类型。
	>
	> <img src="https://cdn.jsdelivr.net/gh/yeliansong/github-blog-PIC/blog-images006y8mN6gy1g6x4ejucirj30ih02zdg6.jpg" style="zoom:200%;" />
	>
	> 
	>
	> 这个可以定义是用内存还是用的存储媒介。



- [ ] Git存储卷

	> 这个卷也是特别有意思，就是为git仓库设计的，
	>
	> 这个就是模型图了，POD启动时，会把远程的git 仓库拉到这个volume中，但是这个是不能实时同步的，也理解了，不会有这么先进的。 GIT 卷的原形是empty 卷，所以，生命周期也是和POD保持一致。
	>
	> ![1568261085518](<img src="https://cdn.jsdelivr.net/gh/yeliansong/github-blog-PIC/blog-images006y8mN6gy1g6x4elernrj30kz09sn1k.jpg" style="zoom:200%;" />



- [ ] HostPath 卷

	> POD 之间能否共享文件呢，能的，这就是HostPath 卷。
	>
	> <img src="https://cdn.jsdelivr.net/gh/yeliansong/github-blog-PIC/blog-images006y8mN6gy1g6x4eo1yr8j30kt0abdkv.jpg" style="zoom:200%;" />
	>
	> 
	>
	> 你看这个图，两个POD 共享这个HostPath卷，所以即使你删除一个POD也不会对这个卷有影响。但是有一个问题，这个卷是和POD强相关的，就是如果你用其他的POD，就不能访问这个卷了。

	

- [ ] 持久卷

	>  这一部分是很不同的环境相配合的，如果你用的是GCP，则有相应的组件支持，其他的云平台，也有其他的相应组件。所以这部分也不讲了，要弄清楚它的使用场景，这个是需要对数据进行持久化的，就是可以跨不同的节点进行数据访问。后续有用到可以着重看看。




