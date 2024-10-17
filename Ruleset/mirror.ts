import { KeyBindingAction } from 'registry/lib/components/utils/keymap/bindings'
import { PluginMetadata } from '@/plugins/plugin'

export const plugin: PluginMetadata = {
  name: 'keymap.actions.toggleMirror',
  displayName: '快捷键扩展 - 开关镜像模式',
  description: '在快捷键的动作列表里添加一个 "开关镜像模式".',
  setup: ({ addData }) => {
    addData('keymap.actions', (actions: Record<string, KeyBindingAction>) => {
      actions.toggleMirror = {
        displayName: '开关镜像模式',
        run: async () => {
          const mirrorInput = dq('.bpx-player-ctrl-setting-mirror input') as HTMLInputElement
          if (mirrorInput) {
            mirrorInput.click() // Toggles the mirror setting
          }
          return mirrorInput
        },
      }
    })
    addData(
      'keymap.presets',
      (
        presetBase: Record<string, string>,
        builtInPresets: Record<string, Record<string, string>>,
      ) => {
        presetBase.toggleMirror = 'j' // Define the shortcut key
        builtInPresets.HTML5Player.toggleMirror = ''
        builtInPresets.PotPlayer.toggleMirror = ''
      },
    )
  },
}
