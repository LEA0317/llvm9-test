; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc  -O0 -mtriple=mipsel-linux-gnu -global-isel  -verify-machineinstrs %s -o -| FileCheck %s -check-prefixes=MIPS32

define i32 @load1_s8_to_zextLoad1_s32(i8* %px) {
; MIPS32-LABEL: load1_s8_to_zextLoad1_s32:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    lbu $2, 0($4)
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    nop
entry:
  %0 = load i8, i8* %px
  %conv = zext i8 %0 to i32
  ret i32 %conv
}

define i32 @load2_s16_to_zextLoad2_s32(i16* %px) {
; MIPS32-LABEL: load2_s16_to_zextLoad2_s32:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    lhu $2, 0($4)
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    nop
entry:
  %0 = load i16, i16* %px
  %conv = zext i16 %0 to i32
  ret i32 %conv
}

define i16 @load1_s8_to_zextLoad1_s16(i8* %px) {
; MIPS32-LABEL: load1_s8_to_zextLoad1_s16:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    lbu $2, 0($4)
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    nop
entry:
  %0 = load i8, i8* %px
  %conv = zext i8 %0 to i16
  ret i16 %conv
}

define zeroext i16 @load1_s8_to_zextLoad1_s16_to_zextLoad1_s32(i8* %px) {
; MIPS32-LABEL: load1_s8_to_zextLoad1_s16_to_zextLoad1_s32:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    lbu $2, 0($4)
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    nop
entry:
  %0 = load i8, i8* %px
  %conv = zext i8 %0 to i16
  ret i16 %conv
}

define i32 @load1_s8_to_sextLoad1_s32(i8* %px) {
; MIPS32-LABEL: load1_s8_to_sextLoad1_s32:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    lb $2, 0($4)
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    nop
entry:
  %0 = load i8, i8* %px
  %conv = sext i8 %0 to i32
  ret i32 %conv
}

define i32 @load2_s16_to_sextLoad2_s32(i16* %px) {
; MIPS32-LABEL: load2_s16_to_sextLoad2_s32:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    lh $2, 0($4)
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    nop
entry:
  %0 = load i16, i16* %px
  %conv = sext i16 %0 to i32
  ret i32 %conv
}

define i16 @load1_s8_to_sextLoad1_s16(i8* %px) {
; MIPS32-LABEL: load1_s8_to_sextLoad1_s16:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    lb $2, 0($4)
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    nop
entry:
  %0 = load i8, i8* %px
  %conv = sext i8 %0 to i16
  ret i16 %conv
}

define signext i16 @load1_s8_to_sextLoad1_s16_to_sextLoad1_s32(i8* %px) {
; MIPS32-LABEL: load1_s8_to_sextLoad1_s16_to_sextLoad1_s32:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    lb $2, 0($4)
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    nop
entry:
  %0 = load i8, i8* %px
  %conv = sext i8 %0 to i16
  ret i16 %conv
}
