mixed-port: 7890
allow-lan: false
mode: rule
log-level: warning
external-controller: '127.0.0.1:9090'
clash-for-android:
  append-system-dns: false
unified-delay: true
global-client-fingerprint: chrome
keep-alive-interval: 360
cfw-bypass:
  - localhost
  - '127.*'
  - '10.*'
  - '192.168.*'
  - '<local>'
ntp:
  enable: true
  write-to-system: false
  server: ntp.tencent.com
  port: 123
  interval: 480
hosts:
  mtalk.google.com: 108.177.125.188
  appv2.nloli.xyz: 104.26.2.212
dns:
  enable: true
  listen: '127.0.0.1:5334'
  default-nameserver: [180.184.1.1, 119.29.29.29, 223.5.5.5]
  enhanced-mode: fake-ip
  fake-ip-range: 198.18.0.1/16
  use-hosts: true
  use-system-hosts: true
  nameserver-policy: {'geosite:cn,apple,category-games@cn,private': [119.29.29.29, 223.5.5.5, system]}
  nameserver: ['https://223.6.6.6/dns-query', 'https://doh.pub/dns-query']
  proxy-server-nameserver: ['https://223.5.5.5/dns-query', 'https://doh.pub/dns-query']  

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
    type: select
    include-all: true
    exclude-type: direct
    filter: "(?i)港|🇭🇰|hong kong|香港|HK"
    proxies:
      - [cite_start]DIRECT
    
  - name: 🇯🇵 日本节点
    type: select
    include-all: true
    exclude-type: direct
    filter: "(?i)日本|川日|东京|大阪|泉日|埼玉|沪日|深日|[^-]日|JP|Japan"
    proxies:
      - DIRECT
    
  - name: 🇺🇲 美国节点
    type: select
    include-all: true
    exclude-type: direct
    filter: "(?i)美|波特兰|达拉斯|俄勒冈|凤凰城|费利蒙|硅谷|拉斯维加斯|洛杉矶|圣何塞|圣克拉拉|西雅图|芝加哥|US|United States"
    proxies:
      - DIRECT
    
  - name: 🇸🇬 狮城节点
    type: select
    include-all: true
    exclude-type: direct
    filter: "(?i)新加坡|坡|狮城|SG|Singapore"
    proxies:
      - DIRECT
    
  - name: 🇨🇳 台湾节点
    type: select
    include-all: true
    exclude-type: direct
    filter: "(?i)台|新北|彰化|TW|Taiwan"
    proxies:
      - DIRECT
    
  - name: 🇰🇷 韩国节点
    type: select
    include-all: true
    exclude-type: direct
    filter: "(?i)KR|Korea|KOR|首尔|韩|韩国|韓"
    proxies:
      - DIRECT
    
  - name: 🌍 其他地区
    type: select
    include-all: true
    exclude-type: direct
    filter: "^(?!.*(港|HK|Hong|香港|日本|川日|东京|大阪|泉日|埼玉|沪日|深日|JP|Japan|美|波特兰|达拉斯|俄勒冈|凤凰城|费利蒙|硅谷|拉斯维加斯|洛杉矶|圣何塞|圣克拉拉|西雅图|芝加哥|US|United States|新加坡|坡|狮城|SG|Singapore|台|新北|彰化|TW|Taiwan|KR|Korea|KOR|首尔|韩|韓)).*"
    proxies:
      - DIRECT
    
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
    include-all: true
    exclude-type: direct
    filter: "(?i)日本|川日|东京|大阪|泉日|埼玉|沪日|深日|[^-]日|JP|Japan"
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
    include-all: true
    exclude-type: direct
    filter: "(?i)日本|川日|东京|大阪|泉日|埼玉|沪日|深日|[^-]日|JP|Japan"
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
    
  - name: 🎥 HBOs
    type: select
    proxies: [🚀 节点选择, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, 🌍 其他地区, 🚀 手动切换, DIRECT]
    
  - name: 📺 Spotify
    type: select
    proxies: [🚀 节点选择, 🇸🇬 狮城节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, 🌍 其他地区, 🚀 手动切换, DIRECT]
  
  - name: 📺 lowdonw
    type: select
    include-all: true
    exclude-type: direct
    filter: "(?i)(\\[0\\.| 0\\.|x0\\.|倍率:0\\.)"
    proxies: [🚀 节点选择, 🚀 手动切换, DIRECT]
       
  - name: 📺 巴哈姆特
    type: select
    proxies: [🇨🇳 台湾节点, 🚀 节点选择, 🚀 手动切换, DIRECT]
    
  - name: 📺 AbemaTV
    type: select
    include-all: true
    exclude-type: direct
    filter: "(?i)日本|川日|东京|大阪|泉日|埼玉|沪日|深日|[^-]日|JP|Japan"
    proxies: [🚀 节点选择, 🚀 手动切换, DIRECT]
    
  - name: 📺 Niconico
    type: select
    include-all: true
    exclude-type: direct
    filter: "(?i)日本|川日|东京|大阪|泉日|埼玉|沪日|深日|[^-]日|JP|Japan"
    proxies: [🚀 节点选择, 🚀 手动切换, DIRECT]
    
  - name: 📺 哔哩哔哩
    type: select
    proxies: [🎯 全球直连, 🇨🇳 台湾节点, 🇭🇰 香港节点]
    
  - name: 🌍 国外代理
    type: select
    proxies: [🚀 节点选择, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇸🇬 狮城节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, 🌍 其他地区, 🚀 手动切换, DIRECT]
    
  - name: 🌍 国内媒体
    type: select
    proxies: [DIRECT, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇸🇬 狮城节点, 🇯🇵 日本节点, 🌍 其他地区, 🚀 手动切换]
    
  - name: 📢 谷歌FCM
    type: select
    proxies: [DIRECT, 🚀 节点选择, 🇺🇲 美国节点, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇸🇬 狮城节点, 🇯🇵 日本节点, 🇰🇷 韩国节点, 🌍 其他地区, 🚀 手动切换]
    
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
    
  - name: 🛑 广告拦截
    type: select
    proxies: [REJECT, DIRECT]
    
  - name: 🛡️ miBlock
    type: select
    proxies: [REJECT, DIRECT]
    
  - name: 🐟 漏网之鱼
    type: select
    proxies: [🚀 节点选择, DIRECT, 🇭🇰 香港节点, 🇨🇳 台湾节点, 🇸🇬 狮城节点, 🇯🇵 日本节点, 🇺🇲 美国节点, 🇰🇷 韩国节点, 🌍 其他地区, 🚀 手动切换]

rule-providers:
  Lan:
    type: http
    behavior: classical
    path: ./ruleset/Lan.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Lan/Lan.yaml"
    interval: 86400
  LocalAreaNetwork:
    type: http
    behavior: classical
    path: ./ruleset/LocalAreaNetwork.yaml
    url: "https://raw.githubusercontent.com/Aik-R/ACLruleset/refs/heads/main/Ruleset/LocalAreaNetwork.txt"
    interval: 86400
  NTPService:
    type: http
    behavior: classical
    path: ./rule_provider/NTPService.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/NTPService/NTPService.yaml"
    interval: 86400
  Direct:
    type: http
    behavior: classical
    path: ./ruleset/Direct.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Direct/Direct.yaml"
    interval: 86400
  mi:
    type: http
    behavior: classical
    path: ./ruleset/mi.yaml
    url: "https://raw.githubusercontent.com/Aik-R/ACLruleset/refs/heads/main/Ruleset/mi.txt"
    interval: 86400
  xuemashi:
    type: http
    behavior: classical
    path: ./ruleset/xuemashi.yaml
    url: "https://raw.githubusercontent.com/Aik-R/ACLruleset/refs/heads/main/Ruleset/xuemashi.txt"
    interval: 86400
  DMM:
    type: http
    behavior: classical
    path: ./ruleset/DMM.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/DMM/DMM.yaml"
    interval: 86400
  Bahamut:
    type: http
    behavior: classical
    path: ./ruleset/Bahamut.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Bahamut/Bahamut.yaml"
    interval: 86400
  Download:
    type: http
    behavior: classical
    path: ./ruleset/Download.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Download/Download.yaml"
    interval: 86400
  Advertising:
    type: http
    behavior: classical
    path: ./ruleset/Advertising_Classical.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Advertising/Advertising_Classical.yaml"
    interval: 86400
  anti-ad:
    type: http
    behavior: domain
    path: ./ruleset/anti-ad.yaml
    url: "https://anti-ad.net/clash.yaml"
    interval: 86400
  Hijacking:
    type: http
    behavior: domain
    path: ./ruleset/Hijacking.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Hijacking/Hijacking.yaml"
    interval: 86400
  BlockHttpDNS:
    type: http
    behavior: domain
    path: ./ruleset/BlockHttpDNS.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/BlockHttpDNS/BlockHttpDNS.yaml"
    interval: 86400
  Privacy_Classical:
    type: http
    behavior: domain
    path: ./ruleset/Privacy_Classical.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Privacy/Privacy_Classical.yaml"
    interval: 86400
  Gemini:
    type: http
    behavior: classical
    path: ./ruleset/Gemini.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Gemini/Gemini.yaml"
    interval: 86400
  GoogleFCM:
    type: http
    behavior: classical
    path: ./ruleset/GoogleFCM.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/GoogleFCM/GoogleFCM.yaml"
    interval: 86400
  YouTubeMusic:
    type: http
    behavior: classical
    path: ./ruleset/YouTubeMusic.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/YouTubeMusic/YouTubeMusic.yaml"
    interval: 86400
  YouTube:
    type: http
    behavior: classical
    path: ./ruleset/YouTube.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/YouTube/YouTube.yaml"
    interval: 86400
  Google:
    type: http
    behavior: classical
    path: ./ruleset/Google.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Google/Google.yaml"
    interval: 86400
  SteamCN:
    type: http
    behavior: classical
    path: ./ruleset/SteamCN.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/SteamCN/SteamCN.yaml"
    interval: 86400
  OneDrive:
    type: http
    behavior: classical
    path: ./ruleset/OneDrive.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/OneDrive/OneDrive.yaml"
    interval: 86400
  Microsoft:
    type: http
    behavior: classical
    path: ./ruleset/Microsoft.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Microsoft/Microsoft.yaml"
    interval: 86400
  Apple:
    type: http
    behavior: classical
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Apple/Apple_Classical.yaml"
    path: ./ruleset/apple.yaml
    interval: 86400
  Telegram:
    type: http
    behavior: classical
    path: ./ruleset/Telegram.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Telegram/Telegram.yaml"
    interval: 86400
  PikPak:
    type: http
    behavior: classical
    path: ./ruleset/PikPak.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/PikPak/PikPak.yaml"
    interval: 86400
  MEGA:
    type: http
    behavior: classical
    path: ./ruleset/MEGA.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/MEGA/MEGA.yaml"
    interval: 86400
  Misc:
    type: http
    behavior: classical
    path: ./ruleset/Misc.yaml  
    url: "https://raw.githubusercontent.com/Aik-R/ACLruleset/refs/heads/main/Ruleset/Misc.txt"
    interval: 86400
  OpenAI:
    type: http
    behavior: classical
    path: ./ruleset/OpenAI.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/OpenAI/OpenAI.yaml"
    interval: 86400
  TikTok:
    type: http
    behavior: classical
    path: ./ruleset/TikTok.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/TikTok/TikTok.yaml"
    interval: 86400
  Twitter:
    type: http
    behavior: classical
    path: ./ruleset/Twitter.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Twitter/Twitter.yaml"
    interval: 86400
  Instagram:
    type: http
    behavior: classical
    path: ./ruleset/Instagram.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Instagram/Instagram.yaml"
    interval: 86400
  Facebook:
    type: http
    behavior: classical
    path: ./ruleset/Facebook.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Facebook/Facebook.yaml"
    interval: 86400
  Pixiv:
    type: http
    behavior: classical
    path: ./ruleset/Pixiv.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Pixiv/Pixiv.yaml"
    interval: 86400
  EHGallery:
    type: http
    behavior: classical
    path: ./ruleset/EHGallery.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/EHGallery/EHGallery.yaml"
    interval: 86400
  NetEaseMusic:
    type: http
    behavior: classical
    path: ./ruleset/NetEaseMusic.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/NetEaseMusic/NetEaseMusic.yaml"
    interval: 86400
  Epic:
    type: http
    behavior: classical
    path: ./ruleset/Epic.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Epic/Epic.yaml"
    interval: 86400
  Sony:
    type: http
    behavior: classical
    path: ./ruleset/Sony.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Sony/Sony.yaml"
    interval: 86400
  Steam:
    type: http
    behavior: classical
    path: ./ruleset/Steam.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Steam/Steam.yaml"
    interval: 86400
  Amazon:
    type: http
    behavior: classical
    path: ./ruleset/Amazon.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Amazon/Amazon.yaml"
    interval: 86400
  Disney:
    type: http
    behavior: classical
    path: ./ruleset/Disney.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Disney/Disney.yaml"
    interval: 86400
  HBOs:
    type: http
    behavior: classical
    path: ./ruleset/HBO.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/HBO/HBO.yaml"
    interval: 86400
  Netflix:
    type: http
    behavior: classical
    path: ./ruleset/Netflix_Classical.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Netflix/Netflix_Classical.yaml"
    interval: 86400
  AbemaTV:
    type: http
    behavior: classical
    path: ./ruleset/AbemaTV.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/AbemaTV/AbemaTV.yaml"
    interval: 86400
  Niconico:
    type: http
    behavior: classical
    path: ./ruleset/Niconico.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Niconico/Niconico.yaml"
    interval: 86400
  Spotify:
    type: http
    behavior: classical
    path: ./ruleset/Spotify.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Spotify/Spotify.yaml"
    interval: 86400
  Bilibili:
    type: http
    behavior: classical
    path: ./ruleset/Bilibili.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/BiliBili/BiliBili.yaml"
    interval: 86400
  ChinaMax:
    type: http
    behavior: classical
    path: ./ruleset/ChinaMax_Classical.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/ChinaMax/ChinaMax_Classical.yaml"
    interval: 86400
  Abroad:
    type: http
    behavior: classical
    path: ./ruleset/Global_Classical.yaml
    url: "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Global/Global_Classical.yaml"
    interval: 86400


rules:
  - RULE-SET,Lan,🎯 全球直连
  - RULE-SET,LocalAreaNetwork,🎯 全球直连
  - RULE-SET,NTPService,🎯 全球直连
  - RULE-SET,Direct,🎯 全球直连
  - RULE-SET,mi,🛡️ miBlock
  - RULE-SET,Download,🎯 全球直连
  - RULE-SET,xuemashi,🎮 学马仕
  - RULE-SET,DMM,📲 DMM
  - RULE-SET,Bahamut,📺 巴哈姆特
  - RULE-SET,Advertising,🛑 广告拦截
  - RULE-SET,anti-ad,🛑 广告拦截
  - RULE-SET,Hijacking,🛑 广告拦截
  - RULE-SET,BlockHttpDNS,🛑 广告拦截
  - RULE-SET,Privacy_Classical,🛑 广告拦截
  - RULE-SET,Gemini,📢 Gemini
  - RULE-SET,GoogleFCM,📢 谷歌FCM
  - DOMAIN-SUFFIX,xn--ngstr-lra8j.com,📢 谷歌🇨🇳
  - DOMAIN-SUFFIX,services.googleapis.cn,📢 谷歌🇨🇳
  - RULE-SET,YouTubeMusic,📹 油管music
  - RULE-SET,YouTube,📹 油管video
  - RULE-SET,Google,📢 谷歌
  - RULE-SET,SteamCN,🎯 全球直连
  - RULE-SET,OneDrive,☁️ 微软云盘
  - RULE-SET,Microsoft,☁️ 微软服务
  - RULE-SET,Apple,🍎 苹果服务
  - RULE-SET,Telegram,📲 电报消息
  - RULE-SET,PikPak,📺 lowdonw
  - RULE-SET,MEGA,📺 lowdonw
  - RULE-SET,Misc,📺 lowdonw
  - RULE-SET,OpenAI,💬 OpenAi
  - RULE-SET,TikTok,📺 TikTok
  - RULE-SET,Twitter,📲 Twitter
  - RULE-SET,Instagram,📲 Instagram
  - RULE-SET,Facebook,📲 Facebook
  - RULE-SET,Pixiv,📲 Pixiv
  - RULE-SET,Spotify,📺 Spotify
  - RULE-SET,EHGallery,📲 EH
  - RULE-SET,NetEaseMusic,🎶 网易音乐
  - RULE-SET,Epic,🎮 游戏平台
  - RULE-SET,Sony,🎮 游戏平台
  - RULE-SET,Steam,🎮 游戏平台
  - RULE-SET,AbemaTV,📺 AbemaTV
  - RULE-SET,Niconico,📺 Niconico
  - RULE-SET,Bilibili,📺 哔哩哔哩
  - RULE-SET,Amazon,🎥 Amazon
  - RULE-SET,Disney,🎥 Disney+
  - RULE-SET,HBOs,🎥 HBOs
  - RULE-SET,Netflix,🎥 奈飞视频
  - RULE-SET,Abroad,🌍 国外代理
  - RULE-SET,ChinaMax,🎯 全球直连
  - GEOIP,CN,🎯 全球直连
  - GEOSITE,CN,🎯 全球直连
  - MATCH,🐟 漏网之鱼
