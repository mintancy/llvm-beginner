; ModuleID = 'target-program.cpp'
source_filename = "target-program.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@Fptr = dso_local global i32 (i32)* @_Z3inci, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_Z3addii(i32 %A, i32 %B) #0 {
entry:
  %A.addr = alloca i32, align 4
  %B.addr = alloca i32, align 4
  store i32 %A, i32* %A.addr, align 4
  store i32 %B, i32* %B.addr, align 4
  %0 = load i32, i32* %A.addr, align 4
  %1 = load i32, i32* %B.addr, align 4
  %add = add nsw i32 %0, %1
  ret i32 %add
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_Z3inci(i32 %A) #0 {
entry:
  %A.addr = alloca i32, align 4
  store i32 %A, i32* %A.addr, align 4
  %0 = load i32, i32* %A.addr, align 4
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* %A.addr, align 4
  ret i32 %inc
}

; Function Attrs: noinline optnone uwtable
define dso_local i32 @_Z8testcalli(i32 %A) #1 {
entry:
  %A.addr = alloca i32, align 4
  store i32 %A, i32* %A.addr, align 4
  %0 = load i32 (i32)*, i32 (i32)** @Fptr, align 8
  %1 = load i32, i32* %A.addr, align 4
  %call = call i32 %0(i32 %1)
  store i32 %call, i32* %A.addr, align 4
  %2 = load i32, i32* %A.addr, align 4
  ret i32 %2
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_Z8testloopi(i32 %count) #0 {
entry:
  %count.addr = alloca i32, align 4
  %sum = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc5, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %count.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end7

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4
  %3 = load i32, i32* %count.addr, align 4
  %cmp2 = icmp slt i32 %2, %3
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %4 = load i32, i32* %sum, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %sum, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %5 = load i32, i32* %j, align 4
  %inc4 = add nsw i32 %5, 1
  store i32 %inc4, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc5

for.inc5:                                         ; preds = %for.end
  %6 = load i32, i32* %i, align 4
  %inc6 = add nsw i32 %6, 1
  store i32 %inc6, i32* %i, align 4
  br label %for.cond

for.end7:                                         ; preds = %for.cond
  %7 = load i32, i32* %sum, align 4
  ret i32 %7
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @_Z15testconditionbrv() #0 {
entry:
  %sum = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %sum, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4
  %rem = srem i32 %1, 2
  switch i32 %rem, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb1
  ]

sw.bb:                                            ; preds = %for.body
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* %sum, align 4
  %add = add nsw i32 %3, %2
  store i32 %add, i32* %sum, align 4
  br label %sw.epilog

sw.bb1:                                           ; preds = %for.body
  %4 = load i32, i32* %sum, align 4
  %add2 = add nsw i32 %4, 1
  store i32 %add2, i32* %sum, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %for.body
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb1, %sw.bb
  br label %for.inc

for.inc:                                          ; preds = %sw.epilog
  %5 = load i32, i32* %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %sum, align 4
  ret i32 %6
}

; Function Attrs: noinline norecurse optnone uwtable
define dso_local i32 @main() #2 {
entry:
  %retval = alloca i32, align 4
  %I = alloca i32, align 4
  %J = alloca i32, align 4
  %K = alloca i32, align 4
  %TMP = alloca i32, align 4
  %TMP2 = alloca i32, align 4
  %Idx = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 42, i32* %I, align 4
  store i32 13, i32* %J, align 4
  %0 = load i32, i32* %I, align 4
  %1 = load i32, i32* %J, align 4
  %call = call i32 @_Z3addii(i32 %0, i32 %1)
  store i32 %call, i32* %K, align 4
  %2 = load i32, i32* %K, align 4
  store i32 %2, i32* %TMP, align 4
  %3 = load i32, i32* %K, align 4
  %call1 = call i32 @_Z3inci(i32 %3)
  store i32 %call1, i32* %K, align 4
  store i32 0, i32* %Idx, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %Idx, align 4
  %cmp = icmp slt i32 %4, 100
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %K, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %K, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %Idx, align 4
  %inc2 = add nsw i32 %6, 1
  store i32 %inc2, i32* %Idx, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %7 = load i32 (i32)*, i32 (i32)** @Fptr, align 8
  %8 = load i32, i32* %K, align 4
  %call3 = call i32 %7(i32 %8)
  store i32 %call3, i32* %K, align 4
  %9 = load i32, i32* %TMP, align 4
  %call4 = call i32 @_Z8testcalli(i32 %9)
  store i32 %call4, i32* %TMP, align 4
  %10 = load i32, i32* %K, align 4
  %call5 = call i32 @_Z8testloopi(i32 %10)
  store i32 %call5, i32* %TMP2, align 4
  %call6 = call i32 @_Z15testconditionbrv()
  %11 = load i32, i32* %K, align 4
  ret i32 %11
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (tags/RELEASE_900/final 375507)"}
