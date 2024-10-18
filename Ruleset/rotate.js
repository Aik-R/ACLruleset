!function(e,t){"object"==typeof exports&&"object"==typeof module?module.exports=t():"function"==typeof define&&define.amd?define([],t):"object"==typeof exports?exports["utils/keymap-rotate-left"]=t():e["utils/keymap-rotate-left"]=t()}(globalThis,(()=>(()=>{"use strict";var e={d:(t,a)=>{for(var o in a)e.o(a,o)&&!e.o(t,o)&&Object.defineProperty(t,o,{enumerable:!0,get:a[o]})},o:(e,t)=>Object.prototype.hasOwnProperty.call(e,t)},t={};e.d(t,{plugin:()=>a});const a={name:"keymap.actions.rotateLeft",displayName:"快捷键扩展 - 向左旋转",description:'在快捷键的动作列表里添加一个 "向左旋转".',setup:e=>{let{addData:t}=e;t("keymap.actions",(e=>{e.rotateLeft={displayName:"向左旋转",run:async()=>{const video = dq("#bilibili-player video"); if (video) { 
    h5PlayerRotate(-1, 90); 
}}})),

t("keymap.presets",((e,t)=>{e.rotateLeft="i",t.HTML5Player.rotateLeft="",t.PotPlayer.rotateLeft=""}))}};return t=t.plugin})()));

/**
 * h5PlayerRotate function
 * @param {number} flag - The direction of rotation, either -1 for left or 1 for right
 * @param {number} rotationDeg - The degree of rotation, default is 90
 */
function h5PlayerRotate(flag, rotationDeg=90) {
    const h5Player = H5_PLAYER.h5Player[0];
    const deg = this.getRotationDeg(H5_PLAYER.h5Player) + rotationDeg * flag;
    let transform = `rotate(${deg}deg)`;
    if (deg == 0 || deg == 180 * flag) {
        transform += ` scale(1)`;
    } else {
        transform += ` scale(${h5Player.videoHeight / h5Player.videoWidth})`;
    }
    h5Player.style.transform = transform;
    h5Player.setAttribute('data-rotate', deg);
}
