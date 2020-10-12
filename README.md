# v2ray
简单的v2ray+ws+tls+nginx一键脚本
```
wget https://github.com/zsxwz/v2ray/blob/master/v2ray.sh && chmod +x v2ray.sh && ./v2ray.sh
```


# ibm脚本使用：

ibmcloud cli的使用可以参考：
[https://zsxwz.com/2020/09/30/](https://zsxwz.com/2020/09/30/)

打开ibmcloud cli shell

```
#生成一个uuid
cat /proc/sys/kernel/random/uuid

# vmess协议版本下载运行脚本
wget https://github.com/zsxwz/v2ray/raw/master/ibmcloud && chmod +x ibmcloud &&./ibmcloud

# vmess/vless自选版本，vless部分客户端可能无法使用，性能稍有提升。
wget https://github.com/zsxwz/v2ray/raw/master/ibm-vless && chmod +x ibm-vless && ./ibm-vless

```


push：

```
# 进入ibm文件夹
cd ibm

# 登录自己的帐号
ibmcloud login

# 安装Cloud Foundry
ibmcloud cf install
ibmcloud target --cf

# push
ibmcloud cf push

#ssh登录，使用你自己的app名称。
ibmcloud cf ssh appname
```

ssh登录之后，
```
# 进入app文件夹，上传之后的内容都在这里了，如果文件夹里还有v2相关内容，记得删除
cd app

rm -rf v2

# 查看进程，是否有./zsxwz ....
ps -ef
```

为了避免滥用，脚本使用shc加密。。。
为了保活，自己可以不定期ssh登录，随便做点什么就行，不推荐经常重启，不推荐使用action。

如果可以使用低调使用即可，请勿宣传，请勿fork。请勿滥用。

v2配置：
uuid就是你手动生成的id

path就是你自己输入的路径

alterId: 64 （vless协议不需要这个）

使用vless协议，如果使用tls，套cdn自选ip之类的目前还是不太推荐使用，虽然轻量，这么一套搞下来，速度多多少少还是有些影响的。

传输协议：ws

其他的和ibmyes等等都是一样的，看你是直接用还是套cf。。。


