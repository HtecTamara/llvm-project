; RUN: opt -passes='number-debug-record' -disable-output < %s 2>&1 | FileCheck %s
; CHECK-LABEL: Function: foo
; CHECK: #dbg_values : 2
; CHECK: #dbg_declare: 0
; CHECK: #dbg_assign: 0

; ModuleID = 'llvm/file.c'
source_filename = "llvm/file.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local range(i32 -2147483638, -2147483648) i32 @foo(i32 noundef %a) local_unnamed_addr #0 !dbg !13 {
entry:
    #dbg_value(i32 %a, !18, !DIExpression(), !20)
  %add = add nsw i32 %a, 10, !dbg !21
    #dbg_value(i32 %add, !19, !DIExpression(), !20)
  ret i32 %add, !dbg !22
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}
!llvm.errno.tbaa = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 23.0.0git (https://github.com/llvm/llvm-project.git 89431a368e022d50c42d7eb38327cafe0ae880a0)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "llvm/file.c", directory: "/home/tamara/projekat/llvm-project", checksumkind: CSK_MD5, checksum: "f59664273c2557e1c32da6dd25056d4f")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 8, !"PIC Level", i32 2}
!5 = !{i32 7, !"PIE Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 2}
!7 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!8 = !{!"clang version 23.0.0git (https://github.com/llvm/llvm-project.git 89431a368e022d50c42d7eb38327cafe0ae880a0)"}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C/C++ TBAA"}
!13 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 1, type: !14, scopeLine: 1, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !17, keyInstructions: true)
!14 = !DISubroutineType(types: !15)
!15 = !{!16, !16}
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !{!18, !19}
!18 = !DILocalVariable(name: "a", arg: 1, scope: !13, file: !1, line: 1, type: !16)
!19 = !DILocalVariable(name: "b", scope: !13, file: !1, line: 2, type: !16)
!20 = !DILocation(line: 0, scope: !13)
!21 = !DILocation(line: 2, column: 15, scope: !13, atomGroup: 1, atomRank: 2)
!22 = !DILocation(line: 3, column: 5, scope: !13, atomGroup: 3, atomRank: 1)
