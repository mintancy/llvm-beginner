## Learn from llvm-cookbook

### Chap4

Other modifications to make examples work:

- Error:
    > Loop is not declared.
- Solution: add analysis pass header file: `#include "llvm/Analysis/LoopInfo.h"`
- Error: 
    > opt: .../PassAnalysisSupport.h:235: AnalysisType& llvm::Pass::getAnalysisID(llvm::AnalysisID) const [with AnalysisType = llvm::LoopInfoWrapperPass; llvm::AnalysisID = const void*]: Assertion `ResultPass && "getAnalysis*() called on an analysis that was not " "'required' by pass!"' failed.

- Solution: add `getAnalysisUsage` function after `runOnFunction`
    ```c
    virtual void getAnalysisUsage(AnalysisUsage& AU) const override {
      AU.addRequired<LoopInfoWrapperPass>();
    }
    ```


