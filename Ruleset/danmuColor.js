!function(e,t){"object"==typeof exports&&"object"==typeof module?module.exports=t():"function"==typeof define&&define.amd?define([],t):"object"==typeof exports?exports["utils/keymap-toggle-danmaku-color"]=t():e["utils/keymap-toggle-danmaku-color"]=t()}(globalThis,(()=>(()=>{"use strict";var e={d:(t,a)=>{for(var o in a)e.o(a,o)&&!e.o(t,o)&&Object.defineProperty(t,o,{enumerable:!0,get:a[o]})},o:(e,t)=>Object.prototype.hasOwnProperty.call(e,t)},t={};e.d(t,{plugin:()=>a});const a={name:"keymap.actions.toggleDanmakuColor",displayName:"快捷键扩展 - 开关彩色弹幕",description:'在快捷键的动作列表里添加一个 "开关彩色弹幕".',setup:e=>{let{addData:t}=e;t("keymap.actions",(e=>{e.toggleDanmakuColor={displayName:"开关弹幕颜色",run:async()=>{const e=dq(".bpx-player-block-typeColor");return e?.click(),e}}})),t("keymap.presets",((e,t)=>{e.toggleDanmakuColor="a",t.HTML5Player.toggleDanmakuColor="",t.PotPlayer.toggleDanmakuColor=""}))},commitHash:"9e5159f7d2ef32b3b4c04e6d569e099090574367",coreVersion:"2.9.3"};return t=t.plugin})()));
