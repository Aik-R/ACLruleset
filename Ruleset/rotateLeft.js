!function(e,t){"object"==typeof exports&&"object"==typeof module?module.exports=t():"function"==typeof define&&define.amd?define([],t):"object"==typeof exports?exports["utils/keymap-rotate-left"]=t():e["utils/keymap-rotate-left"]=t()}(globalThis,(()=>(()=>{"use strict";var e={d:(t,a)=>{for(var o in a)e.o(a,o)&&!e.o(t,o)&&Object.defineProperty(t,o,{enumerable:!0,get:a[o]})},o:(e,t)=>Object.prototype.hasOwnProperty.call(e,t)},t={};e.d(t,{plugin:()=>a});const a={name:"keymap.actions.rotateLeft",displayName:"快捷键扩展 - 向左旋转",description:'在快捷键的动作列表里添加一个 "向左旋转".',setup:e=>{let{addData:t}=e;t("keymap.actions",(e=>{e.rotateLeft={displayName:"向左旋转",run:async()=>{const video = dq("#bilibili-player video"); if (video) { video.style.transform = `rotate(${(parseInt(video.getAttribute('data-rotate') || '0') - 90) % 360}deg)`; video.setAttribute('data-rotate', (parseInt(video.getAttribute('data-rotate') || '0') - 90) % 360); }}}})),t("keymap.presets",((e,t)=>{e.rotateLeft="shift i",t.HTML5Player.rotateLeft="",t.PotPlayer.rotateLeft=""}))},commitHash:"9e5159f7d2ef32b3b4c04e6d569e099090574367",coreVersion:"2.9.3"};return t=t.plugin})()));
