
; -------------------------------------
; 半角/全角の切り替え設定
; -------------------------------------

; 無変換を押したときは、半角(IME off)
vk1C::
imeoff:
  Gosub, IMEGetstate
  If (vimestate=0) {
    Send, {vkf3}
  }
  return

; 変換を押したときは、全角(IME on)
vk1D::
imeon:
  Gosub, IMEGetstate
  If (vimestate=1) {
    Send, {vkf3}
  }
  return

IMEGetstate:
  WinGet, vcurrentwindow, ID, A
  vimestate := DllCall("user32.dll\SendMessageA", "UInt", DllCall("imm32.dll\ImmGetDefaultIMEWnd", "Uint", vcurrentwindow), "UInt", 0x0283, "Int", 0x0005, "Int", 0)
  return


; -------------------------------------
; ホームボタンから移動しない入力用ショートカット
; -------------------------------------

; カーソル移動設定
F13 & f::Right     ; forward char
F13 & p::Up        ; previous line
F13 & n::Down      ; next line
F13 & b::Left      ; backward char
F13 & a::HOME      ; move beginning of line
F13 & e::END       ; move end of line
F13 & d::Del       ; delete char
F13 & h::BS        ; delete backward char
F13 & m::Enter     ; newline
F13 & o::send {Enter}{Left}     ; newline
F13 & k::send +{End}^x ; cut of line
F13 & .::Esc       ; Esc

; -------------------------------------
; Alt+~ でcommandショートカットに寄せる
; -------------------------------------

; 閉じる設定
Alt & q::Send,!{F4}
Alt & w::Send,^w

; コピペ設定
Alt & c::Send,^c
Alt & v::Send,^v

; 保存コマンド
Alt & s::Send,^s

; タブ操作設定　（3つボタン押し判定の処理をIF文を使って実現してる）
Alt & t::
  if GetKeyState("Shift") {
    Send ^+t
    return
  }
  Send ^t
  return

; -------------------------------------
; Spotlight検索
; -------------------------------------
F13 & Space::#s  ; Control-SpaceでWindowsの検索ボックスを開く