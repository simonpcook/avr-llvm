; RUN: llc < %s -march=avr | FileCheck %s

define avr_intrcc void @interrupt_handler() {
; CHECK-LABEL: interrupt_handler:
; CHECK: bset 7
; CHECK-NEXT: push r0
; CHECK-NEXT: push r1
; CHECK-NEXT: in r0, 63
; CHECK-NEXT: push r0
; :TODO: clr __zero_reg__
; CHECK: pop r0
; CHECK-NEXT: out 63, r0
; CHECK-NEXT: pop r1
; CHECK-NEXT: pop r0
; CHECK-NEXT: reti
  ret void
}

define avr_signalcc void @signal_handler() {
; CHECK-LABEL: signal_handler:
; CHECK-NOT: sei
; CHECK: push r0
; CHECK-NEXT: push r1
; CHECK-NEXT: in r0, 63
; CHECK-NEXT: push r0
; :TODO: clr __zero_reg__
; CHECK: pop r0
; CHECK-NEXT: out 63, r0
; CHECK-NEXT: pop r1
; CHECK-NEXT: pop r0
; CHECK-NEXT: reti
  ret void
}
