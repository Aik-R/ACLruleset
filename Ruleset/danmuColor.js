!function(e,t){"object"==typeof exports&&"object"==typeof module?module.exports=t():"function"==typeof define&&define.amd?define([],t):"object"==typeof exports?exports["utils/keymap-danmu-color"]=t():e["utils/keymap-danmu-color"]=t()}(globalThis,(()=>(()=>{"use strict";var e={d:(t,a)=>{for(var o in a)e.o(a,o)&&!e.o(t,o)&&Object.defineProperty(t,o,{enumerable:!0,get:a[o]})},o:(e,t)=>Object.prototype.hasOwnProperty.call(e,t)},t={};e.d(t,{plugin:()=>a});const a={name:"keymap.actions.danmuColor",displayName:"快捷键扩展 - 彩色弹幕",description:'在快捷键的动作列表里添加一个 "彩色弹幕".',setup:e=>{let{addData:t}=e;

    const SELECTOR = {
        typeColor: "#bilibili-player > div > div > div.bpx-player-primary-area > div.bpx-player-sending-area > div > div.bpx-player-dm-root > div.bpx-player-dm-setting > div > div > div > div > div > div.bui-panel-item.bui-panel-item-active > div > div.bpx-player-dm-setting-left-block > div.bpx-player-dm-setting-left-block-content > div.bpx-player-block-filter-type.bpx-player-block-typeScroll"
    };

    t("keymap.actions",(e=>{

        e.danmuColor = {
            displayName: "彩色弹幕",
            run: async () => {
                danmuType(SELECTOR.typeColor);
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
        e.danmuColor = 'z';
        t.HTML5Player.danmuColor = '';
    }));

}};return t=t.plugin})()));
