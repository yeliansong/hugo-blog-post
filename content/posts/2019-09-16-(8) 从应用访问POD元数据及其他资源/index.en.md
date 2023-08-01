---
title: 八、Access POD metadata and other resources from applications
subtitle: Kubernetes in action reading notes
date: 2019-10-12T15:11:51+08:00
lastmod: 2019-10-12T15:11:51+08:00
draft: false
author: Liansong
authorLink: ""
description: "Reading Notes for K8S Learning"

tags: [K8S, microservice]
categories: [K8S-study notes]

hiddenFromHomePage: false
hiddenFromSearch: false

images: []
resources:
- name: "featured-image"
  src: "featured-image.png"

toc:
  enable: true
math:
  enable: false
lightgallery: true
license: ""
---

### 1. Downward API passing metadata

To be honest, this chapter is also in the clouds, and it feels similar to the environment variable configuration. My understanding is that the Downward API is used to configure the metadata of the POD or container, and the environment variables are used to define some regular variable parameters. Downward API supports environment variables and files, which is more flexible.

<img src="https://cdn.jsdelivr.net/gh/yeliansong/github-blog-PIC/blog-images006y8mN6gy1g71nmvhxxqj30io07qn0x.jpg" style="zoom:200%;" />

<img src="https://cdn.jsdelivr.net/gh/yeliansong/github-blog-PIC/blog-images006y8mN6gy1g71nmwlm48j30en0ew0uk.jpg" style="zoom: 150%;" />



### 2. Kubernetes API server interaction

In fact, this section mainly talks about how to use the Kubernetes API. Using the API is actually accessing its server. Each level of directory is a first-level resource.

<img src="https://p.ipic.vip/w70043.jpg" alt="123" style="zoom:200%;" />



This is to access the API server through the ambassador container. Of course, the API server can also be accessed through the client. The content of this chapter is mainly to configure the metadata of POD and access resources through API.