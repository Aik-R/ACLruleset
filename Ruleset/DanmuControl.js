!function(e,t){"object"==typeof exports&&"object"==typeof module?module.exports=t():"function"==typeof define&&define.amd?define([],t):"object"==typeof exports?exports["utils/keymap-danmu-toggle"]=t():e["utils/keymap-danmu-toggle"]=t()}(globalThis,(()=>(()=>{"use strict";var e={d:(t,a)=>{for(var o in a)e.o(a,o)&&!e.o(t,o)&&Object.defineProperty(t,o,{enumerable:!0,get:a[o]})},o:(e,t)=>Object.prototype.hasOwnProperty.call(e,t)},t={};e.d(t,{plugin:()=>a});const a={name:"keymap.actions.toggleDanmu",displayName:"快捷键扩展 - 弹幕控制",description:'在快捷键的动作列表里添加弹幕控制功能.',setup:e=>{let{addData:t}=e;

    const SELECTOR = {
        dmTypeScroll: ".bpx-player-block-filter-type bpx-player-block-typeScroll",
        dmTypeTopBottom: ".bpx-player-block-filter-type bpx-player-block-typeTopBottom",
        dmTypeColor: ".bpx-player-block-filter-type bpx-player-block-typeColor",
        dmTypeSpecial: ".bpx-player-block-filter-type bpx-player-block-typeSpecial",
    };
    
        e.danmuBottom = {
            displayName: "固定弹幕",
            run: async () => {
                danmuType(SELECTOR.dmTypeTopBottom);
            }
        };
        
        e.danmuScroll = {
            displayName: "滚动弹幕",
            run: async () => {
                danmuType(SELECTOR.dmTypeScroll);
            }
        };
        
        e.danmuColor = {
            displayName: "彩色弹幕",
            run: async () => {
                danmuType(SELECTOR.dmTypeColor);
            }
        };
        
        e.danmuSpecial = {
            displayName: "高级弹幕",
            run: async () => {
                danmuType(SELECTOR.dmTypeSpecial);
            }
        };

        function danmuType(selector) {
            q(selector).click();
            const text = q(`${selector} .bpx-player-block-filter-label`).text();
            if (q(`${selector}.bpx-player-active`).length) {
                UI.showHint(`开启${text}`);
            } else {
                UI.showHint(`关闭${text}`);
            }
        }

    }));

    t("keymap.presets",((e,t)=>{
        e.dmTypeTopBottom = 'q';
        e.danmuScroll = 'a';
        e.danmuColor = 'z';
        e.danmuSpecial = ''; // No shortcut assigned
        t.HTML5Player.dmTypeTopBottom = '';
        t.HTML5Player.danmuScroll = '';
        t.HTML5Player.danmuColor = '';
        t.HTML5Player.danmuSpecial = '';
    }));

},commitHash:"9e5159f7d2ef32b3b4c04e6d569e099090574367",coreVersion:"2.9.3"}};return t=t.plugin})()));
