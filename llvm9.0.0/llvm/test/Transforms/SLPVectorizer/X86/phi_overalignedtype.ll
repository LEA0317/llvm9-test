; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -basicaa -slp-vectorizer -slp-threshold=-100 -dce -S -mtriple=i386-apple-macosx10.8.0 -mcpu=corei7-avx | FileCheck %s

; We purposely over-align f64 to 128bit here.
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:128:128-v64:64:64-v128:128:128-a0:0:64-f80:128:128-n8:16:32-S128"
target triple = "i386-apple-macosx10.9.0"


define void @test(double* %i1, double* %i2, double* %o) {
; CHECK-LABEL: @test(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[I1_0:%.*]] = load double, double* [[I1:%.*]], align 16
; CHECK-NEXT:    [[I1_GEP1:%.*]] = getelementptr double, double* [[I1]], i64 1
; CHECK-NEXT:    [[I1_1:%.*]] = load double, double* [[I1_GEP1]], align 16
; CHECK-NEXT:    [[TMP0:%.*]] = insertelement <2 x double> undef, double [[I1_0]], i32 0
; CHECK-NEXT:    [[TMP1:%.*]] = insertelement <2 x double> [[TMP0]], double [[I1_1]], i32 1
; CHECK-NEXT:    br i1 undef, label [[THEN:%.*]], label [[END:%.*]]
; CHECK:       then:
; CHECK-NEXT:    [[I2_GEP0:%.*]] = getelementptr inbounds double, double* [[I2:%.*]], i64 0
; CHECK-NEXT:    [[I2_0:%.*]] = load double, double* [[I2_GEP0]], align 16
; CHECK-NEXT:    [[I2_GEP1:%.*]] = getelementptr inbounds double, double* [[I2]], i64 1
; CHECK-NEXT:    [[I2_1:%.*]] = load double, double* [[I2_GEP1]], align 16
; CHECK-NEXT:    [[TMP2:%.*]] = insertelement <2 x double> undef, double [[I2_0]], i32 0
; CHECK-NEXT:    [[TMP3:%.*]] = insertelement <2 x double> [[TMP2]], double [[I2_1]], i32 1
; CHECK-NEXT:    br label [[END]]
; CHECK:       end:
; CHECK-NEXT:    [[TMP4:%.*]] = phi <2 x double> [ [[TMP1]], [[ENTRY:%.*]] ], [ [[TMP3]], [[THEN]] ]
; CHECK-NEXT:    [[TMP5:%.*]] = extractelement <2 x double> [[TMP4]], i32 0
; CHECK-NEXT:    store double [[TMP5]], double* [[O:%.*]], align 16
; CHECK-NEXT:    [[O_GEP1:%.*]] = getelementptr inbounds double, double* [[O]], i64 1
; CHECK-NEXT:    [[TMP6:%.*]] = extractelement <2 x double> [[TMP4]], i32 1
; CHECK-NEXT:    store double [[TMP6]], double* [[O_GEP1]], align 16
; CHECK-NEXT:    ret void
;
; Test that we correctly recognize the discontiguous memory in arrays where the
; size is less than the alignment, and through various different GEP formations.

entry:
  %i1.0 = load double, double* %i1, align 16
  %i1.gep1 = getelementptr double, double* %i1, i64 1
  %i1.1 = load double, double* %i1.gep1, align 16
  br i1 undef, label %then, label %end

then:
  %i2.gep0 = getelementptr inbounds double, double* %i2, i64 0
  %i2.0 = load double, double* %i2.gep0, align 16
  %i2.gep1 = getelementptr inbounds double, double* %i2, i64 1
  %i2.1 = load double, double* %i2.gep1, align 16
  br label %end

end:
  %phi0 = phi double [ %i1.0, %entry ], [ %i2.0, %then ]
  %phi1 = phi double [ %i1.1, %entry ], [ %i2.1, %then ]
  store double %phi0, double* %o, align 16
  %o.gep1 = getelementptr inbounds double, double* %o, i64 1
  store double %phi1, double* %o.gep1, align 16
  ret void
}
