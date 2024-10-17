!function(e,t){
    "object"==typeof exports&&"object"==typeof module?module.exports=t():
    "function"==typeof define&&define.amd?define([],t):
    "object"==typeof exports?exports["utils/keymap-toggle-danmuColor"]=t():
    e["utils/keymap-toggle-danmuColor"]=t()
}(globalThis,(()=>(()=>{"use strict";

    var e = {
        d: (t,a) => {
            for (var o in a) e.o(a,o) && !e.o(t,o) && Object.defineProperty(t,o,{enumerable: !0, get: a[o]})
        },
        o: (e,t) => Object.prototype.hasOwnProperty.call(e,t)
    },
    
    t = {};
    
    e.d(t, {plugin: () => a});
    
    const SELECTOR = {
        dmTypeColor: ".bpx-player-block-filter-type bpx-player-block-typeColor"  // Your selector for controlling the color
    };
    
    const a = {
        name: "keymap.actions.toggleDanmuColor",
        displayName: "快捷键扩展 - 开关色彩弹幕模式",
        description: '在快捷键的动作列表里添加一个 "开关色彩弹幕模式".',
        setup: e => {
            let {addData: t} = e;
            
            // Add custom keymap action for toggling danmu color
            t("keymap.actions", (e => {
                e.toggleDanmuColor = {
                    displayName: "开关色彩弹幕模式",
                    run: async () => {
                        danmuColor();  // Call the function to change color
                    }
                }
            }));
            
            // Set the key to trigger the action
            t("keymap.presets", ((e,t) => {
                e.toggleDanmuColor = "k";  // Set "k" as the shortcut key
                t.HTML5Player.toggleDanmuColor = "";
                t.PotPlayer.toggleDanmuColor = "";
            }));
        }
    };
    
    // Function to change danmu color
    function danmuColor() {
        danmuType(SELECTOR.dmTypeColor);
    }
    
    // Function to simulate a click on the selector element
    function danmuType(selector) {
        let element = document.querySelector(selector);
        if (element) {
            element.click();
        }
    }

    return t = t.plugin
})()));
