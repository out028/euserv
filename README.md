# v2ray
简单的v2ray+ws+tls+nginx一键脚本
```
wget https://github.com/zsxwz/v2ray/blob/master/v2ray.sh && chmod +x v2ray.sh && ./v2ray.sh
```


# ibm脚本使用：
11月07测试可以使用

ibmcloud cli的使用可以参考：
[https://zsxwz.com/2020/09/30/](https://zsxwz.com/2020/09/30/)

打开ibmcloud cli shell

```
#生成一个uuid
cat /proc/sys/kernel/random/uuid


# vmess/vless自选版本，vless部分客户端可能无法使用，性能稍有提升。
wget https://github.com/zsxwz/v2ray/raw/master/ibm-vless && chmod +x ibm-vless && ./ibm-vless

```


push：

```
# 进入ibm文件夹
cd ibm 
# 配置文件都在这个目录，只有进入到这个目录才能正常部署。可以ls，看看是否有配置文件。

# 登录自己的帐号
ibmcloud login

# 安装Cloud Foundry
ibmcloud cf install 
# 如果使用ibm网站的shell，这一步现在可以不要，如果是自己下载cli使用的卡娜还是要的。
ibmcloud target --cf 
# 这一步多试几次，返回你的账号数据则表示正常

# push
ibmcloud cf push 
# 出现各种错误先看看，自己配置有没有写对，写path的时候，最好不要加什么特殊符号，如/ $ #等等。

#ssh登录，使用你自己的app名称。
ibmcloud cf ssh appname # 也可以从资源面板，运行时，ssh进入
```

ssh登录之后，
```
# 进入app文件夹，上传之后的内容都在这里了，如果文件夹里还有v2相关内容，避免被扫描，记得删除
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

传输协议：ws

其他的和ibmyes等等都是一样的，看你是直接用还是套cf。。。


