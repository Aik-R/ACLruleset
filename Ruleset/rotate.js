!function(e,t){"object"==typeof exports&&"object"==typeof module?module.exports=t():"function"==typeof define&&define.amd?define([],t):"object"==typeof exports?exports["utils/keymap-toggle-video-rotation"]=t():e["utils/keymap-toggle-video-rotation"]=t()}(globalThis,(()=>(()=>{"use strict";var e={d:(t,a)=>{for(var o in a)e.o(a,o)&&!e.o(t,o)&&Object.defineProperty(t,o,{enumerable:!0,get:a[o]})},o:(e,t)=>Object.prototype.hasOwnProperty.call(e,t)},t={};e.d(t,{plugin:()=>a});const a={name:"keymap.actions.toggleVideoRotation",displayName:"快捷键扩展 - 视频旋转",description:'在快捷键的动作列表里添加 "视频旋转".',setup:e=>{let{addData:t}=e;
  
  // Rotate the video to the right
  t("keymap.actions",(e=>{e.rotateRight={displayName:"视频右旋转",run:async()=>{UI.h5PlayerRotate(1);}}}));
  
  // Rotate the video to the left
  t("keymap.actions",(e=>{e.rotateLeft={displayName:"视频左旋转",run:async()=>{UI.h5PlayerRotate(-1);}}}));
  
  // Define the key bindings for video rotation
  t("keymap.presets",((e,t)=>{ 
    e.rotateRight = "shift r", // Shortcut key for rotating the video to the right
    e.rotateLeft = "shift l",  // Shortcut key for rotating the video to the left
    
    t.HTML5Player.rotateRight = "",
    t.HTML5Player.rotateLeft = "",
    
    t.PotPlayer.rotateRight = "",
    t.PotPlayer.rotateLeft = ""
  }));

},commitHash:"9e5159f7d2ef32b3b4c04e6d569e099090574367",coreVersion:"2.9.3"};return t=t.plugin})()));

// Video rotation logic
const UI = {
    h5PlayerRotate(flag, rotationDeg = 90) {
        const h5Player = H5_PLAYER.h5Player[0];
        const deg = this.getRotationDeg(H5_PLAYER.h5Player) + rotationDeg * flag;
        let transform = `rotate(${deg}deg)`;
        
        if (deg === 0 || deg === 180 * flag) {
            transform += ` scale(1)`;
        } else {
            transform += ` scale(${h5Player.videoHeight / h5Player.videoWidth})`;
        }

        this.setH5PlayerRransform(transform);
    },
    
    getRotationDeg(h5Player) {
        const transform = h5Player.css('transform');
        if (!transform || transform === 'none') return 0;
        
        const values = transform.split('(')[1].split(')')[0].split(',');
        const a = values[0];
        const b = values[1];
        const rad = Math.atan2(b, a);
        const deg = Math.round(rad * (180 / Math.PI));
        return (deg < 0 ? deg + 360 : deg) % 360;
    },
    
    setH5PlayerRransform(transform) {
        H5_PLAYER.h5Player.css('-webkit-transform', transform)
            .css('-moz-transform', transform)
            .css('-ms-transform', transform)
            .css('-o-transform', transform)
            .css('transform', transform);
    }
};
