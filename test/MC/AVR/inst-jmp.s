; RUN: llvm-mc -triple avr-none -mattr=jmpcall -show-encoding < %s | FileCheck %s


foo:

  jmp   200 
  jmp  -12
  jmp   80
  jmp   0

; CHECK: jmp  200                  ; encoding: [0x64,0x00,0x0c,0x94]
; CHECK: jmp -12                   ; encoding: [0xfa,0xff,0xfd,0x95]
; CHECK: jmp  80                   ; encoding: [0x28,0x00,0x0c,0x94]
; CHECK: jmp  0                    ; encoding: [0x00,0x00,0x0c,0x94]
