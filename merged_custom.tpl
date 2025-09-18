mixed-port: 7890
allow-lan: false
mode: rule
log-level: warning
external-controller: 127.0.0.1:9090
unified-delay: true
global-client-fingerprint: chrome
keep-alive-interval: 360
clash-for-android:
  append-system-dns: false
cfw-bypass:
  - localhost
  - 127.*
  - 10.*
  - 172.16.*
  - 192.168.*
  - <local>
hosts:
  mtalk.google.com: 108.177.125.188
  paoluz.link: 104.21.71.42
dns:
  enable: true
  listen: 127.0.0.1:5335
  respect-rules: true
  default-nameserver: [119.29.29.29, 223.5.5.5]
  proxy-server-nameserver: [https://223.5.5.5/dns-query, https://doh.pub/dns-query]
  use-hosts: true
  use-system-hosts: true
  enhanced-mode: redir-host
  fake-ip-filter: ["*.market.xiaomi.com","*.n.n.srv.nintendo.net", +.stun.playstation.net, xbox.*.*.microsoft.com, "*.msftncsi.com", "*.msftconnecttest.com", WORKGROUP, "*.lan", stun.*.*.*, stun.*.*, time.windows.com, time.nist.gov, time.apple.com, time.asia.apple.com, "*.ntp.org.cn", "*.openwrt.pool.ntp.org", time1.cloud.tencent.com, time.ustc.edu.cn, pool.ntp.org, ntp.ubuntu.com, "*.*.xboxlive.com", speedtest.cros.wr.pvp.net, stun.services.mozilla1.com, ntp.nasa.gov]
  nameserver: [https://doh.pub/dns-query, https://223.5.5.5/dns-query]
  nameserver-policy:
    "geosite:bytedance":
        - 180.184.1.1
        - 180.184.2.2
    "geosite:cn,apple,category-games@cn":
        - 119.29.29.29
        - 223.6.6.6
        - system
    "geosite:private":
        - system
  fallback:
    - https://8.8.8.8/dns-query
    - https://1.1.1.1/dns-query
  fallback-filter:
    geosite:
      - category-porn
      - category-forums
      - category-cryptocurrency
    ipcidr:
      - 240.0.0.0/4
      - 116.89.243.0/24

proxies: # proxies - 1p 为节点信息区块, proxies - 3p 为节点列表区块 proxies - 3p - auto 为节点自动列表区块, 单独占一行
%proxies-1p%

proxy-groups:
  - name: 🚀 节点选择
    type: select
    proxies: 
      - 🇭🇰 香港节点
      - 🇨🇳 台湾节点
      - 🇸🇬 狮城节点
      - 🇯🇵 日本节点
      - 🇺🇲 美国节点
      - 🇰🇷 韩国节点
      - 🌍 其他地区
      - 🚀 手动切换
      - DIRECT
      
  - name: 🚀 手动切换
    type: select
    include-all: true
    exclude-type: direct
    proxies:
      - DIRECT
      
  # 地区节点组 - 使用正则表达式自动筛选
  - name: 🇭🇰 香港节点
    type: url-test
    include-all: true
    exclude-type: direct
    filter: "(?i)港|hk|hong kong|香港"
    url: http://www.gstatic.com/generate_204
    interval: 300
    tolerance: 50
    
  - name: 🇯🇵 日本节点
    type: url-test
    include-all: true
    exclude-type: direct
    filter: "(?i)日本|川日|东京|大阪|泉日|埼玉|沪日|深日|[^-]日|jp|japan"
    url: http://www.gstatic.com/generate_204
    interval: 300
    tolerance: 50
    
  - name: 🇺🇲 美国节点
    type: url-test
    include-all: true
    exclude-type: direct
    filter: "(?i)美|波特兰|达拉斯|俄勒冈|凤凰城|费利蒙|硅谷|拉斯维加斯|洛杉矶|圣何塞|圣克拉拉|西雅图|芝加哥|us|united states"
    url: http://www.gstatic.com/generate_204
    interval: 300
    tolerance: 50
    
  - name: 🇸🇬 狮城节点
    type: url-test
    include-all: true
    exclude-type: direct
    filter: "(?i)新加坡|坡|狮城|sg|singapore"
    url: http://www.gstatic.com/generate_204
    interval: 300
    tolerance: 50
    
  - name: 🇨🇳 台湾节点
    type: url-test
    include-all: true
    exclude-type: direct
    filter: "(?i)台|新北|彰化|tw|taiwan"
    url: http://www.gstatic.com/generate_204
    interval: 300
    tolerance: 50
    
  - name: 🇰🇷 韩国节点
    type: url-test
    include-all: true
    exclude-type: direct
    filter: "(?i)kr|korea|kor|首尔|韩|韩国"
    url: http://www.gstatic.com/generate_204
    interval: 300
    tolerance: 50
    
  - name: 🌍 其他地区
    type: select
    include-all: true
    exclude-type: direct
    filter: "^(?!.*(🇮🇱|🇮🇸|🇮🇩|🇹🇷|🇵🇰|🇧🇷|🇩🇪|🇮🇹|🇳🇴|🇫🇷|🇵🇱|🇹🇭|🇦🇺|🇨🇭|🇬🇧|🇳🇱|🇵🇭|🇦🇷|🇦🇪|🇲🇾|🇻🇳|🇱🇺|🇺🇦|🇷🇺|🇨🇦|🇿🇦|🇮🇳|🇪🇬|🇲🇽|🇲🇩|🇨🇱|🇰🇵|🇮🇪|🇸🇪|🇪🇸|🇳🇬|🇻🇦|南极|🇰🇵|🇰🇭|🇲🇲|🇫🇮)).*"
    
  # 应用分组
  - name: 📢 谷歌
    type: select
    proxies: [🚀 节点选择, DIRECT, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, 🌍 其他地区, 🚀 手动切换]
    
  - name: 📲 电报消息
    type: select
    proxies: [🚀 节点选择, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, 🌍 其他地区, 🚀 手动切换, DIRECT]
    
  - name: 📢 Gemini
    type: select
    proxies: [🚀 节点选择, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, 🚀 手动切换, DIRECT]
    
  - name: 💬 OpenAi
    type: select
    proxies: [🚀 节点选择, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, 🚀 手动切换, DIRECT]
    
  - name: 🎮 学马仕
    type: select
    proxies: [🚀 节点选择, 🚀 手动切换, DIRECT]
    
  - name: 📲 Twitter
    type: select
    proxies: [🚀 节点选择, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, 🌍 其他地区, 🚀 手动切换, DIRECT]
    
  - name: 📲 Facebook
    type: select
    proxies: [🚀 节点选择, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, 🌍 其他地区, 🚀 手动切换, DIRECT]
    
  - name: 📲 Instagram
    type: select
    proxies: [🚀 节点选择, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, 🌍 其他地区, 🚀 手动切换, DIRECT]
    
  - name: 📲 Pixiv
    type: select
    proxies: [🚀 节点选择, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, 🌍 其他地区, 🚀 手动切换, DIRECT]
    
  - name: 📲 EH
    type: select
    proxies: [🚀 节点选择, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, 🌍 其他地区, 🚀 手动切换, DIRECT]
    
  - name: 📲 DMM
    type: select
    proxies: [🚀 节点选择, 🚀 手动切换, DIRECT]
    
  - name: 📹 油管video
    type: select
    proxies: [🚀 节点选择, 🇭🇰 香港节点, 🇸🇬 狮城节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, 🌍 其他地区, 🚀 手动切换, DIRECT]
    
  - name: 📹 油管music
    type: select
    proxies: [🚀 节点选择, 🇭🇰 香港节点, 🇸🇬 狮城节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, 🌍 其他地区, 🚀 手动切换, DIRECT]
    
  - name: 📺 TikTok
    type: select
    proxies: [🚀 节点选择, 🇭🇰 香港节点, 🇸🇬 狮城节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, 🌍 其他地区, 🚀 手动切换, DIRECT]
    
  - name: 🎥 奈飞视频
    type: select
    proxies: [🚀 节点选择, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, 🌍 其他地区, 🚀 手动切换, DIRECT]
    
  - name: 🎥 Amazon
    type: select
    proxies: [🚀 节点选择, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, 🌍 其他地区, 🚀 手动切换, DIRECT]
    
  - name: 🎥 Disney+
    type: select
    proxies: [🚀 节点选择, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, 🌍 其他地区, 🚀 手动切换, DIRECT]
    
  - name: 🎥 HBO_GO_HKG
    type: select
    proxies: [🚀 节点选择, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, 🌍 其他地区, 🚀 手动切换, DIRECT]
    
  - name: 📺 Spotify
    type: select
    proxies: [🚀 节点选择, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, 🌍 其他地区, 🚀 手动切换, DIRECT]
    
  - name: 📺 巴哈姆特
    type: select
    proxies: [🇨🇳 台湾节点, 🚀 节点选择, 🚀 手动切换, DIRECT]
    
  - name: 📺 AbemaTV
    type: select
    proxies: [🚀 节点选择, 🚀 手动切换, DIRECT]
    
  - name: 📺 Niconico
    type: select
    proxies: [🚀 节点选择, 🚀 手动切换, DIRECT]
    
  - name: 📺 Emby
    type: select
    proxies: [🚀 节点选择, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, 🌍 其他地区, 🚀 手动切换, DIRECT]
    
  - name: 📺 哔哩哔哩
    type: select
    proxies: [🎯 全球直连, 🇨🇳 台湾节点, 🇭🇰 香港节点]
    
  - name: 🌍 国外媒体
    type: select
    proxies: [🚀 节点选择, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇸🇬 狮城节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, 🌍 其他地区, 🚀 手动切换, DIRECT]
    
  - name: 🌍 国内媒体
    type: select
    proxies: [DIRECT, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇸🇬 狮城节点, 🇯🇵 日本节点, 🌍 其他地区, 🚀 手动切换]
    
  - name: 📢 谷歌FCM
    type: select
    proxies: [DIRECT, 🚀 节点选择, 🇺🇲 美国节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇸🇬 狮城节点, 🇯🇵 日本节点, 🇰🇷 韩国节点, 🌍 其他地区, 🚀 手动切换]
    
  - name: 📢 谷歌🇨🇳Play下载
    type: select
    proxies: [🚀 节点选择, DIRECT, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, 🌍 其他地区, 🚀 手动切换]
    
  - name: 📢 谷歌🇨🇳Play服务
    type: select
    proxies: [🚀 节点选择, DIRECT, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, 🌍 其他地区, 🚀 手动切换]
    
  - name: 📢 谷歌🇨🇳
    type: select
    proxies: [DIRECT, 🚀 节点选择, 🇺🇲 美国节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇸🇬 狮城节点, 🇯🇵 日本节点, 🇰🇷 韩国节点, 🌍 其他地区, 🚀 手动切换]
    
  - name: ☁️ 微软云盘
    type: select
    proxies: [DIRECT, 🚀 节点选择, 🇺🇲 美国节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇸🇬 狮城节点, 🇯🇵 日本节点, 🇰🇷 韩国节点, 🌍 其他地区, 🚀 手动切换]
    
  - name: ☁️ 微软服务
    type: select
    proxies: [DIRECT, 🚀 节点选择, 🇺🇲 美国节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇸🇬 狮城节点, 🇯🇵 日本节点, 🇰🇷 韩国节点, 🌍 其他地区, 🚀 手动切换]
    
  - name: 🍎 苹果服务
    type: select
    proxies: [DIRECT, 🚀 节点选择, 🇺🇲 美国节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇸🇬 狮城节点, 🇯🇵 日本节点, 🇰🇷 韩国节点, 🌍 其他地区, 🚀 手动切换]
    
  - name: 🎮 游戏平台
    type: select
    proxies: [DIRECT, 🚀 节点选择, 🇺🇲 美国节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇸🇬 狮城节点, 🇯🇵 日本节点, 🇰🇷 韩国节点, 🌍 其他地区, 🚀 手动切换]
    
  - name: 🎶 网易音乐
    type: select
    proxies: [DIRECT, 🚀 节点选择]
    
  - name: 🎯 全球直连
    type: select
    proxies: [DIRECT, 🚀 节点选择]
    
  - name: 🛑 强力拦截
    type: select
    proxies: [REJECT, DIRECT]
    
  - name: 🛑 广告拦截
    type: select
    proxies: [REJECT, DIRECT]
    
  - name: 🍃 应用净化
    type: select
    proxies: [REJECT, DIRECT]
    
  - name: 🆎 AdBlock
    type: select
    proxies: [REJECT, DIRECT]
    
  - name: 🛡️ 隐私防护
    type: select
    proxies: [REJECT, DIRECT]
    
  - name: 🛡️ miBlock
    type: select
    proxies: [REJECT, DIRECT]
    
  - name: 🐟 漏网之鱼
    type: select
    proxies: [🚀 节点选择, DIRECT, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇸🇬 狮城节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, 🌍 其他地区, 🚀 手动切换]

rule-providers:
  LocalAreaNetwork:
    type: http
    behavior: classical
    path: ./ruleset/LocalAreaNetwork.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/LocalAreaNetwork.list
    interval: 86400
  UnBan:
    type: http
    behavior: classical
    path: ./ruleset/UnBan.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/UnBan.list
    interval: 86400
  mi:
    type: http
    behavior: classical
    path: ./ruleset/mi.list
    url: https://raw.githubusercontent.com/Aik-R/ACLruleset/main/Ruleset/mi
    interval: 86400
  xuemashi:
    type: http
    behavior: classical
    path: ./ruleset/xuemashi.list
    url: https://raw.githubusercontent.com/Aik-R/ACLruleset/main/Ruleset/xuemashi.list
    interval: 86400
  DMM:
    type: http
    behavior: classical
    path: ./ruleset/DMM.list
    url: https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/DMM/DMM.list
    interval: 86400
  Bahamut:
    type: http
    behavior: classical
    path: ./ruleset/Bahamut.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Bahamut.list
    interval: 86400
  BanAD:
    type: http
    behavior: classical
    path: ./ruleset/BanAD.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanAD.list
    interval: 86400
  BanProgramAD:
    type: http
    behavior: classical
    path: ./ruleset/BanProgramAD.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanProgramAD.list
    interval: 86400
  BanEasyList:
    type: http
    behavior: classical
    path: ./ruleset/BanEasyList.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanEasyList.list
    interval: 86400
  BanEasyListChina:
    type: http
    behavior: classical
    path: ./ruleset/BanEasyListChina.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanEasyListChina.list
    interval: 86400
  BanEasyPrivacy:
    type: http
    behavior: classical
    path: ./ruleset/BanEasyPrivacy.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanEasyPrivacy.list
    interval: 86400
  surge:
    type: http
    behavior: classical
    path: ./ruleset/surge.list
    url: https://anti-ad.net/surge.txt
    interval: 86400
  Gemini:
    type: http
    behavior: classical
    path: ./ruleset/Gemini.list
    url: https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Gemini/Gemini.list
    interval: 86400
  GoogleFCM:
    type: http
    behavior: classical
    path: ./ruleset/GoogleFCM.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/GoogleFCM.list
    interval: 86400
  GoogleCNProxyIP:
    type: http
    behavior: classical
    path: ./ruleset/GoogleCNProxyIP.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/GoogleCNProxyIP.list
    interval: 86400
  GoogleCN:
    type: http
    behavior: classical
    path: ./ruleset/GoogleCN.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/GoogleCN.list
    interval: 86400
  YouTubeMusic:
    type: http
    behavior: classical
    path: ./ruleset/YouTubeMusic.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/YouTubeMusic.list
    interval: 86400
  YouTube:
    type: http
    behavior: classical
    path: ./ruleset/YouTube.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/YouTube.list
    interval: 86400
  Google:
    type: http
    behavior: classical
    path: ./ruleset/Google.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Google.list
    interval: 86400
  GoogleCN_1:
    type: http
    behavior: classical
    path: ./ruleset/GoogleCN_1.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/GoogleCN.list
    interval: 86400
  SteamCN:
    type: http
    behavior: classical
    path: ./ruleset/SteamCN.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/SteamCN.list
    interval: 86400
  OneDrive:
    type: http
    behavior: classical
    path: ./ruleset/OneDrive.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/OneDrive.list
    interval: 86400
  Microsoft:
    type: http
    behavior: classical
    path: ./ruleset/Microsoft.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Microsoft.list
    interval: 86400
  Apple:
    type: http
    behavior: classical
    path: ./ruleset/Apple.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Apple.list
    interval: 86400
  Telegram:
    type: http
    behavior: classical
    path: ./ruleset/Telegram.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Telegram.list
    interval: 86400
  OpenAI:
    type: http
    behavior: classical
    path: ./ruleset/OpenAI.list
    url: https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/OpenAI/OpenAI.list
    interval: 86400
  Twitter:
    type: http
    behavior: classical
    path: ./ruleset/Twitter.list
    url: https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Twitter/Twitter.list
    interval: 86400
  Facebook:
    type: http
    behavior: classical
    path: ./ruleset/Facebook.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Facebook.list
    interval: 86400
  Instagram:
    type: http
    behavior: classical
    path: ./ruleset/Instagram.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Instagram.list
    interval: 86400
  Pixiv:
    type: http
    behavior: classical
    path: ./ruleset/Pixiv.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Pixiv.list
    interval: 86400
  EHGallery:
    type: http
    behavior: classical
    path: ./ruleset/EHGallery.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/EHGallery.list
    interval: 86400
  NetEaseMusic:
    type: http
    behavior: classical
    path: ./ruleset/NetEaseMusic.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/NetEaseMusic.list
    interval: 86400
  Epic:
    type: http
    behavior: classical
    path: ./ruleset/Epic.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Epic.list
    interval: 86400
  Sony:
    type: http
    behavior: classical
    path: ./ruleset/Sony.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Sony.list
    interval: 86400
  Steam:
    type: http
    behavior: classical
    path: ./ruleset/Steam.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Steam.list
    interval: 86400
  Amazon:
    type: http
    behavior: classical
    path: ./ruleset/Amazon.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Amazon.list
    interval: 86400
  DisneyPlus:
    type: http
    behavior: classical
    path: ./ruleset/DisneyPlus.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/DisneyPlus.list
    interval: 86400
  HBO_GO_HKG:
    type: http
    behavior: classical
    path: ./ruleset/HBO_GO_HKG.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/HBO_GO_HKG.list
    interval: 86400
  Netflix:
    type: http
    behavior: classical
    path: ./ruleset/Netflix.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Netflix.list
    interval: 86400
  NetflixIP:
    type: http
    behavior: classical
    path: ./ruleset/NetflixIP.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/NetflixIP.list
    interval: 86400
  AbemaTV:
    type: http
    behavior: classical
    path: ./ruleset/AbemaTV.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/AbemaTV.list
    interval: 86400
  Niconico:
    type: http
    behavior: classical
    path: ./ruleset/Niconico.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Niconico.list
    interval: 86400
  Emby:
    type: http
    behavior: classical
    path: ./ruleset/Emby.list
    url: https://raw.githubusercontent.com/Aik-R/ACLruleset/main/Ruleset/Emby.list
    interval: 86400
  Spotify:
    type: http
    behavior: classical
    path: ./ruleset/Spotify.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Spotify.list
    interval: 86400
  BilibiliHMT:
    type: http
    behavior: classical
    path: ./ruleset/BilibiliHMT.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/BilibiliHMT.list
    interval: 86400
  Bilibili:
    type: http
    behavior: classical
    path: ./ruleset/Bilibili.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Bilibili.list
    interval: 86400
  TikTok:
    type: http
    behavior: classical
    path: ./ruleset/TikTok.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/TikTok.list
    interval: 86400
  ChinaMedia:
    type: http
    behavior: classical
    path: ./ruleset/ChinaMedia.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ChinaMedia.list
    interval: 86400
  ProxyMedia:
    type: http
    behavior: classical
    path: ./ruleset/ProxyMedia.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ProxyMedia.list
    interval: 86400
  ProxyGFWlist:
    type: http
    behavior: classical
    path: ./ruleset/ProxyGFWlist.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ProxyGFWlist.list
    interval: 86400
  ChinaDomain:
    type: http
    behavior: classical
    path: ./ruleset/ChinaDomain.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ChinaDomain.list
    interval: 86400
  ChinaCompanyIp:
    type: http
    behavior: classical
    path: ./ruleset/ChinaCompanyIp.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ChinaCompanyIp.list
    interval: 86400
  Download:
    type: http
    behavior: classical
    path: ./ruleset/Download.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Download.list
    interval: 86400

rules:
  - RULE-SET,LocalAreaNetwork,🎯 全球直连
  - RULE-SET,UnBan,🎯 全球直连
  - RULE-SET,mi,🛡️ miBlock
  - RULE-SET,xuemashi,🎮 学马仕
  - RULE-SET,DMM,📲 DMM
  - RULE-SET,Bahamut,📺 巴哈姆特
  - RULE-SET,BanAD,🛑 广告拦截
  - RULE-SET,BanProgramAD,🍃 应用净化
  - RULE-SET,BanEasyList,🆎 AdBlock
  - RULE-SET,BanEasyListChina,🆎 AdBlock
  - RULE-SET,BanEasyPrivacy,🛡️ 隐私防护
  - RULE-SET,surge,🛑 强力拦截
  - RULE-SET,Gemini,📢 Gemini
  - RULE-SET,GoogleFCM,📢 谷歌FCM
  - DOMAIN-SUFFIX,xn--ngstr-lra8j.com,📢 谷歌🇨🇳Play下载
  - DOMAIN-SUFFIX,services.googleapis.cn,📢 谷歌🇨🇳Play服务
  - RULE-SET,GoogleCNProxyIP,📢 谷歌🇨🇳Play服务
  - RULE-SET,GoogleCN,📢 谷歌🇨🇳
  - RULE-SET,YouTubeMusic,📹 油管music
  - RULE-SET,YouTube,📹 油管video
  - RULE-SET,Google,📢 谷歌
  - RULE-SET,GoogleCN_1,🎯 全球直连
  - RULE-SET,SteamCN,🎯 全球直连
  - RULE-SET,OneDrive,☁️ 微软云盘
  - RULE-SET,Microsoft,☁️ 微软服务
  - RULE-SET,Apple,🍎 苹果服务
  - RULE-SET,Telegram,📲 电报消息
  - RULE-SET,OpenAI,💬 OpenAi
  - RULE-SET,Twitter,📲 Twitter
  - RULE-SET,Facebook,📲 Facebook
  - RULE-SET,Instagram,📲 Instagram
  - RULE-SET,Pixiv,📲 Pixiv
  - RULE-SET,EHGallery,📲 EH
  - RULE-SET,NetEaseMusic,🎶 网易音乐
  - RULE-SET,Epic,🎮 游戏平台
  - RULE-SET,Sony,🎮 游戏平台
  - RULE-SET,Steam,🎮 游戏平台
  - RULE-SET,Amazon,🎥 Amazon
  - RULE-SET,DisneyPlus,🎥 Disney+
  - RULE-SET,HBO_GO_HKG,🎥 HBO_GO_HKG
  - RULE-SET,Netflix,🎥 奈飞视频
  - RULE-SET,NetflixIP,🎥 奈飞视频
  - RULE-SET,AbemaTV,📺 AbemaTV
  - RULE-SET,Niconico,📺 Niconico
  - RULE-SET,Emby,📺 Emby
  - RULE-SET,Spotify,📺 Spotify
  - RULE-SET,BilibiliHMT,📺 哔哩哔哩
  - RULE-SET,Bilibili,📺 哔哩哔哩
  - RULE-SET,TikTok,📺 TikTok
  - RULE-SET,ChinaMedia,🌍 国内媒体
  - RULE-SET,ProxyMedia,🌍 国外媒体
  - RULE-SET,ProxyGFWlist,🚀 节点选择
  - RULE-SET,ChinaDomain,🎯 全球直连
  - RULE-SET,ChinaCompanyIp,🎯 全球直连
  - RULE-SET,Download,🎯 全球直连
  - GEOIP,CN,🎯 全球直连
  - MATCH,🐟 漏网之鱼
