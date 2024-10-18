!function(e,t){"object"==typeof exports&&"object"==typeof module?module.exports=t():"function"==typeof define&&define.amd?define([],t):"object"==typeof exports?exports["utils/keymap-toggle-danmaku-fixed"]=t():e["utils/keymap-toggle-danmaku-fixed"]=t()}(globalThis,(()=>(()=>{"use strict";var e={d:(t,a)=>{for(var o in a)e.o(a,o)&&!e.o(t,o)&&Object.defineProperty(t,o,{enumerable:!0,get:a[o]})},o:(e,t)=>Object.prototype.hasOwnProperty.call(e,t)},t={};e.d(t,{plugin:()=>a});const a={name:"keymap.actions.toggleDanmakuFixed",displayName:"快捷键扩展 - 开关固定弹幕",description:'在快捷键的动作列表里添加一个 "开关固定弹幕".',setup:e=>{let{addData:t}=e;
  t("keymap.actions",(e=>{e.toggleDanmakuFixed={displayName:"开关固定弹幕",run:async()=>{const e=dq(".bpx-player-block-typeTopBottom");return e?.click(),e}}}));
  t("keymap.presets",((e,t)=>{ 
    e.toggleDanmakuFixed = "q", 
    t.HTML5Player.toggleDanmakuFixed = "",
    t.PotPlayer.toggleDanmakuFixed = ""
  }));

},commitHash:"9e5159f7d2ef32b3b4c04e6d569e099090574367",coreVersion:"2.9.3"};return t=t.plugin})()));
