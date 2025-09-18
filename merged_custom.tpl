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
    proxies: [🇭🇰 香港节点, 🇨🇳 台湾节点, 🇸🇬 狮城节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, SP 特殊节点, 🚀 手动切换, DIRECT]
  - name: 🚀 手动切换
    type: select
    # selector: .*
    proxies: []
  - name: 📢 谷歌
    type: select
    proxies: [🚀 节点选择, DIRECT, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, SP 特殊节点, 🚀 手动切换]
  - name: 📲 电报消息
    type: select
    proxies: [🚀 节点选择, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, SP 特殊节点, 🚀 手动切换, DIRECT]
  - name: 📢 Gemini
    type: select
    proxies: [🚀 节点选择, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, 🚀 手动切换, DIRECT]
  - name: 💬 OpenAi
    type: select
    proxies: [🚀 节点选择, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, 🚀 手动切换, DIRECT]
  - name: 🎮 学马仕
    type: select
    # selector: (日本|川日|东京|大阪|泉日|埼玉|沪日|深日|[^-]日|JP|Japan)
    proxies: [🚀 节点选择, 🚀 手动切换, DIRECT]
  - name: 📲 Twitter
    type: select
    proxies: [🚀 节点选择, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, SP 特殊节点, 🚀 手动切换, DIRECT]
  - name: 📲 Facebook
    type: select
    proxies: [🚀 节点选择, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, SP 特殊节点, 🚀 手动切换, DIRECT]
  - name: 📲 Instagram
    type: select
    proxies: [🚀 节点选择, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, SP 特殊节点, 🚀 手动切换, DIRECT]
  - name: 📲 Pixiv
    type: select
    proxies: [🚀 节点选择, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, SP 特殊节点, 🚀 手动切换, DIRECT]
  - name: 📲 EH
    type: select
    proxies: [🚀 节点选择, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, SP 特殊节点, 🚀 手动切换, DIRECT]
  - name: 📲 DMM
    type: select
    # selector: (日本|川日|东京|大阪|泉日|埼玉|沪日|深日|[^-]日|JP|Japan)
    proxies: [🚀 节点选择, 🚀 手动切换, DIRECT]
  - name: 📹 油管video
    type: select
    proxies: [🚀 节点选择, 🇭🇰 香港节点, 🇸🇬 狮城节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, SP 特殊节点, 🚀 手动切换, DIRECT]
  - name: 📹 油管music
    type: select
    proxies: [🚀 节点选择, 🇭🇰 香港节点, 🇸🇬 狮城节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, SP 特殊节点, 🚀 手动切换, DIRECT]
  - name: 📺 TikTok
    type: select
    proxies: [🚀 节点选择, 🇭🇰 香港节点, 🇸🇬 狮城节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, SP 特殊节点, 🚀 手动切换, DIRECT]
  - name: 🎥 奈飞视频
    type: select
    proxies: [🚀 节点选择, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, SP 特殊节点, 🚀 手动切换, DIRECT]
  - name: 🎥 Amazon
    type: select
    proxies: [🚀 节点选择, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, SP 特殊节点, 🚀 手动切换, DIRECT]
  - name: 🎥 Disney+
    type: select
    # selector: (日本|川日|东京|大阪|泉日|埼玉|沪日|深日|[^-]日|JP|Japan)
    proxies: [🚀 节点选择, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, SP 特殊节点, 🚀 手动切换, DIRECT]
  - name: 🎥 HBO_GO_HKG
    type: select
    proxies: [🚀 节点选择, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, SP 特殊节点, 🚀 手动切换, DIRECT]
  - name: 📺 Spotify
    type: select
    proxies: [🚀 节点选择, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, SP 特殊节点, 🚀 手动切换, DIRECT]
  - name: 📺 巴哈姆特
    type: select
    proxies: [🇨🇳 台湾节点, 🚀 节点选择, 🚀 手动切换, DIRECT]
  - name: 📺 AbemaTV
    type: select
    # selector: (日本|川日|东京|大阪|泉日|埼玉|沪日|深日|[^-]日|JP|Japan)
    proxies: [🚀 节点选择, 🚀 手动切换, DIRECT]
  - name: 📺 Niconico
    type: select
    # selector: (日本|川日|东京|大阪|泉日|埼玉|沪日|深日|[^-]日|JP|Japan)
    proxies: [🚀 节点选择, 🚀 手动切换, DIRECT]
  - name: 📺 Emby
    type: select
    proxies: [🚀 节点选择, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, SP 特殊节点, 🚀 手动切换, DIRECT]
  - name: 📺 哔哩哔哩
    type: select
    proxies: [🎯 全球直连, 🇨🇳 台湾节点, 🇭🇰 香港节点]
  - name: 🌍 国外媒体
    type: select
    proxies: [🚀 节点选择, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇸🇬 狮城节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, SP 特殊节点, 🚀 手动切换, DIRECT]
  - name: 🌏 国内媒体
    type: select
    proxies: [DIRECT, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇸🇬 狮城节点, 🇯🇵 日本节点, SP 特殊节点, 🚀 手动切换]
  - name: 📢 谷歌FCM
    type: select
    proxies: [DIRECT, 🚀 节点选择, 🇺🇲 美国节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇸🇬 狮城节点, 🇯🇵 日本节点, 🇰🇷 韩国节点, SP 特殊节点, 🚀 手动切换]
  - name: 📢 谷歌🇨🇳Play下载
    type: select
    proxies: [🚀 节点选择, DIRECT, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, SP 特殊节点, 🚀 手动切换]
  - name: 📢 谷歌🇨🇳Play服务
    type: select
    proxies: [🚀 节点选择, DIRECT, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, SP 特殊节点, 🚀 手动切换]
  - name: 📢 谷歌🇨🇳
    type: select
    proxies: [DIRECT, 🚀 节点选择, 🇺🇲 美国节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇸🇬 狮城节点, 🇯🇵 日本节点, 🇰🇷 韩国节点, SP 特殊节点, 🚀 手动切换]
  - name: Ⓜ️ 微软云盘
    type: select
    proxies: [DIRECT, 🚀 节点选择, 🇺🇲 美国节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇸🇬 狮城节点, 🇯🇵 日本节点, 🇰🇷 韩国节点, SP 特殊节点, 🚀 手动切换]
  - name: Ⓜ️ 微软服务
    type: select
    proxies: [DIRECT, 🚀 节点选择, 🇺🇲 美国节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇸🇬 狮城节点, 🇯🇵 日本节点, 🇰🇷 韩国节点, SP 特殊节点, 🚀 手动切换]
  - name: 🍎 苹果服务
    type: select
    proxies: [DIRECT, 🚀 节点选择, 🇺🇲 美国节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇸🇬 狮城节点, 🇯🇵 日本节点, 🇰🇷 韩国节点, SP 特殊节点, 🚀 手动切换]
  - name: 🎮 游戏平台
    type: select
    proxies: [DIRECT, 🚀 节点选择, 🇺🇲 美国节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇸🇬 狮城节点, 🇯🇵 日本节点, 🇰🇷 韩国节点, SP 特殊节点, 🚀 手动切换]
  - name: 🎶 网易音乐
    type: select
    # selector: (网易|音乐|解锁|Music|NetEase)
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
    proxies: [🚀 节点选择, DIRECT, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇸🇬 狮城节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, SP 特殊节点, 🚀 手动切换]
  - name: 🇭🇰 香港节点
    type: select
    # selector: (港|HK|Hong Kong)
    proxies: []
  - name: 🇯🇵 日本节点
    type: select
    # selector: (日本|川日|东京|大阪|泉日|埼玉|沪日|深日|[^-]日|JP|Japan)
    proxies: []
  - name: 🇺🇲 美国节点
    type: select
    # selector: (美|波特兰|达拉斯|俄勒冈|凤凰城|费利蒙|硅谷|拉斯维加斯|洛杉矶|圣何塞|圣克拉拉|西雅图|芝加哥|US|United States)
    proxies: []
  - name: 🇸🇬 狮城节点
    type: select
    # selector: (新加坡|坡|狮城|SG|Singapore)
    proxies: []
  - name: 🇨🇳 台湾节点
    type: select
    # selector: (台|新北|彰化|TW|Taiwan)
    proxies: []
  - name: 🇰🇷 韩国节点
    type: select
    # selector: (KR|Korea|KOR|首尔|韩|韓)
    proxies: []
  - name: SP 特殊节点
    type: select
    # selector: (🇮🇱|🇮🇸|🇮🇩|🇹🇷|🇵🇰|🇧🇷|🇩🇪|🇮🇹|🇳🇴|🇫🇷|🇵🇱|🇹🇭|🇦🇺|🇨🇭|🇬🇧|🇳🇱|🇵🇭|🇦🇷|🇦🇪|🇲🇾|🇻🇳|🇱🇺|🇺🇦|🇷🇺|🇨🇦|🇿🇦|🇮🇳|🇪🇬|🇲🇽|🇲🇩|🇨🇱|🇰🇵|🇮🇪|🇸🇪|🇪🇸|🇳🇬|🇻🇦|南极|🇰🇵|🇰🇭|🇲🇲|🇫🇮)
    proxies: []

rule-providers:
  ______:
    type: http
    behavior: classical
    path: ./ruleset/______.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/LocalAreaNetwork.list
    interval: 86400
  _______1:
    type: http
    behavior: classical
    path: ./ruleset/_______1.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/UnBan.list
    interval: 86400
  ___miBlock:
    type: http
    behavior: classical
    path: ./ruleset/___miBlock.list
    url: https://raw.githubusercontent.com/Aik-R/ACLruleset/main/Ruleset/mi
    interval: 86400
  _____:
    type: http
    behavior: classical
    path: ./ruleset/_____.list
    url: https://raw.githubusercontent.com/Aik-R/ACLruleset/main/Ruleset/xuemashi.list
    interval: 86400
  __DMM:
    type: http
    behavior: classical
    path: ./ruleset/__DMM.list
    url: https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/DMM/DMM.list
    interval: 86400
  _______2:
    type: http
    behavior: classical
    path: ./ruleset/_______2.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Bahamut.list
    interval: 86400
  _______3:
    type: http
    behavior: classical
    path: ./ruleset/_______3.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanAD.list
    interval: 86400
  _______4:
    type: http
    behavior: classical
    path: ./ruleset/_______4.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanProgramAD.list
    interval: 86400
  __AdBlock:
    type: http
    behavior: classical
    path: ./ruleset/__AdBlock.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanEasyList.list
    interval: 86400
  __AdBlock_1:
    type: http
    behavior: classical
    path: ./ruleset/__AdBlock_1.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanEasyListChina.list
    interval: 86400
  _______:
    type: http
    behavior: classical
    path: ./ruleset/_______.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanEasyPrivacy.list
    interval: 86400
  _______5:
    type: http
    behavior: classical
    path: ./ruleset/_______5.list
    url: https://anti-ad.net/surge.txt
    interval: 86400
  __Gemini:
    type: http
    behavior: classical
    path: ./ruleset/__Gemini.list
    url: https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Gemini/Gemini.list
    interval: 86400
  ____FCM:
    type: http
    behavior: classical
    path: ./ruleset/____FCM.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/GoogleFCM.list
    interval: 86400
  ______Play__:
    type: http
    behavior: classical
    path: ./ruleset/______Play__.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/GoogleCNProxyIP.list
    interval: 86400
  _______6:
    type: http
    behavior: classical
    path: ./ruleset/_______6.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/GoogleCN.list
    interval: 86400
  ____music:
    type: http
    behavior: classical
    path: ./ruleset/____music.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/YouTubeMusic.list
    interval: 86400
  ____video:
    type: http
    behavior: classical
    path: ./ruleset/____video.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/YouTube.list
    interval: 86400
  ____:
    type: http
    behavior: classical
    path: ./ruleset/____.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Google.list
    interval: 86400
  _______7:
    type: http
    behavior: classical
    path: ./ruleset/_______7.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/GoogleCN.list
    interval: 86400
  _______8:
    type: http
    behavior: classical
    path: ./ruleset/_______8.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/SteamCN.list
    interval: 86400
  ________1:
    type: http
    behavior: classical
    path: ./ruleset/________1.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/OneDrive.list
    interval: 86400
  ________2:
    type: http
    behavior: classical
    path: ./ruleset/________2.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Microsoft.list
    interval: 86400
  _______9:
    type: http
    behavior: classical
    path: ./ruleset/_______9.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Apple.list
    interval: 86400
  _______10:
    type: http
    behavior: classical
    path: ./ruleset/_______10.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Telegram.list
    interval: 86400
  __OpenAi:
    type: http
    behavior: classical
    path: ./ruleset/__OpenAi.list
    url: https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/OpenAI/OpenAI.list
    interval: 86400
  __Twitter:
    type: http
    behavior: classical
    path: ./ruleset/__Twitter.list
    url: https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Twitter/Twitter.list
    interval: 86400
  __Facebook:
    type: http
    behavior: classical
    path: ./ruleset/__Facebook.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Facebook.list
    interval: 86400
  __Instagram:
    type: http
    behavior: classical
    path: ./ruleset/__Instagram.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Instagram.list
    interval: 86400
  __Pixiv:
    type: http
    behavior: classical
    path: ./ruleset/__Pixiv.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Pixiv.list
    interval: 86400
  __EH:
    type: http
    behavior: classical
    path: ./ruleset/__EH.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/EHGallery.list
    interval: 86400
  _______11:
    type: http
    behavior: classical
    path: ./ruleset/_______11.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/NetEaseMusic.list
    interval: 86400
  _______12:
    type: http
    behavior: classical
    path: ./ruleset/_______12.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Epic.list
    interval: 86400
  _______13:
    type: http
    behavior: classical
    path: ./ruleset/_______13.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Sony.list
    interval: 86400
  _______14:
    type: http
    behavior: classical
    path: ./ruleset/_______14.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Steam.list
    interval: 86400
  __Amazon:
    type: http
    behavior: classical
    path: ./ruleset/__Amazon.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Amazon.list
    interval: 86400
  __Disney_:
    type: http
    behavior: classical
    path: ./ruleset/__Disney_.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/DisneyPlus.list
    interval: 86400
  __HBO_GO_HKG:
    type: http
    behavior: classical
    path: ./ruleset/__HBO_GO_HKG.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/HBO_GO_HKG.list
    interval: 86400
  _______15:
    type: http
    behavior: classical
    path: ./ruleset/_______15.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Netflix.list
    interval: 86400
  _______16:
    type: http
    behavior: classical
    path: ./ruleset/_______16.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/NetflixIP.list
    interval: 86400
  __AbemaTV:
    type: http
    behavior: classical
    path: ./ruleset/__AbemaTV.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/AbemaTV.list
    interval: 86400
  __Niconico:
    type: http
    behavior: classical
    path: ./ruleset/__Niconico.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Niconico.list
    interval: 86400
  __Emby:
    type: http
    behavior: classical
    path: ./ruleset/__Emby.list
    url: https://raw.githubusercontent.com/Aik-R/ACLruleset/main/Ruleset/Emby.list
    interval: 86400
  __Spotify:
    type: http
    behavior: classical
    path: ./ruleset/__Spotify.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Spotify.list
    interval: 86400
  _______17:
    type: http
    behavior: classical
    path: ./ruleset/_______17.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/BilibiliHMT.list
    interval: 86400
  _______18:
    type: http
    behavior: classical
    path: ./ruleset/_______18.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/Bilibili.list
    interval: 86400
  __TikTok:
    type: http
    behavior: classical
    path: ./ruleset/__TikTok.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Ruleset/TikTok.list
    interval: 86400
  _______19:
    type: http
    behavior: classical
    path: ./ruleset/_______19.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ChinaMedia.list
    interval: 86400
  _______20:
    type: http
    behavior: classical
    path: ./ruleset/_______20.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ProxyMedia.list
    interval: 86400
  _______21:
    type: http
    behavior: classical
    path: ./ruleset/_______21.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ProxyGFWlist.list
    interval: 86400
  _______22:
    type: http
    behavior: classical
    path: ./ruleset/_______22.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ChinaDomain.list
    interval: 86400
  _______23:
    type: http
    behavior: classical
    path: ./ruleset/_______23.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ChinaCompanyIp.list
    interval: 86400
  _______24:
    type: http
    behavior: classical
    path: ./ruleset/_______24.list
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Download.list
    interval: 86400

rules:
  - RULE-SET,______,🎯 全球直连
  - RULE-SET,_______1,🎯 全球直连
  - RULE-SET,___miBlock,🛡️ miBlock
  - RULE-SET,_____,🎮 学马仕
  - RULE-SET,__DMM,📲 DMM
  - RULE-SET,_______2,📺 巴哈姆特
  - RULE-SET,_______3,🛑 广告拦截
  - RULE-SET,_______4,🍃 应用净化
  - RULE-SET,__AdBlock,🆎 AdBlock
  - RULE-SET,__AdBlock_1,🆎 AdBlock
  - RULE-SET,_______,🛡️ 隐私防护
  - RULE-SET,_______5,🛑 强力拦截
  - RULE-SET,__Gemini,📢 Gemini
  - RULE-SET,____FCM,📢 谷歌FCM
  - DOMAIN-SUFFIX,xn--ngstr-lra8j.com,📢 谷歌🇨🇳Play下载
  - DOMAIN-SUFFIX,services.googleapis.cn,📢 谷歌🇨🇳Play服务
  - RULE-SET,______Play__,📢 谷歌🇨🇳Play服务
  - RULE-SET,_______6,📢 谷歌🇨🇳
  - RULE-SET,____music,📹 油管music
  - RULE-SET,____video,📹 油管video
  - RULE-SET,____,📢 谷歌
  - RULE-SET,_______7,🎯 全球直连
  - RULE-SET,_______8,🎯 全球直连
  - RULE-SET,________1,Ⓜ️ 微软云盘
  - RULE-SET,________2,Ⓜ️ 微软服务
  - RULE-SET,_______9,🍎 苹果服务
  - RULE-SET,_______10,📲 电报消息
  - RULE-SET,__OpenAi,💬 OpenAi
  - RULE-SET,__Twitter,📲 Twitter
  - RULE-SET,__Facebook,📲 Facebook
  - RULE-SET,__Instagram,📲 Instagram
  - RULE-SET,__Pixiv,📲 Pixiv
  - RULE-SET,__EH,📲 EH
  - RULE-SET,_______11,🎶 网易音乐
  - RULE-SET,_______12,🎮 游戏平台
  - RULE-SET,_______13,🎮 游戏平台
  - RULE-SET,_______14,🎮 游戏平台
  - RULE-SET,__Amazon,🎥 Amazon
  - RULE-SET,__Disney_,🎥 Disney+
  - RULE-SET,__HBO_GO_HKG,🎥 HBO_GO_HKG
  - RULE-SET,_______15,🎥 奈飞视频
  - RULE-SET,_______16,🎥 奈飞视频
  - RULE-SET,__AbemaTV,📺 AbemaTV
  - RULE-SET,__Niconico,📺 Niconico
  - RULE-SET,__Emby,📺 Emby
  - RULE-SET,__Spotify,📺 Spotify
  - RULE-SET,_______17,📺 哔哩哔哩
  - RULE-SET,_______18,📺 哔哩哔哩
  - RULE-SET,__TikTok,📺 TikTok
  - RULE-SET,_______19,🌏 国内媒体
  - RULE-SET,_______20,🌍 国外媒体
  - RULE-SET,_______21,🚀 节点选择
  - RULE-SET,_______22,🎯 全球直连
  - RULE-SET,_______23,🎯 全球直连
  - RULE-SET,_______24,🎯 全球直连
  - GEOIP,CN,🎯 全球直连
  - MATCH,🐟 漏网之鱼
