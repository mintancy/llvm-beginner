//===- FuncBlockCount.cpp - Modified example code from "llvm-cookbook" ---------------===//

#include "llvm/IR/Function.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
//#include "llvm/Analysis/LoopInfo.h"
using namespace llvm;

#define DEBUG_TYPE "opcodeCounter"

namespace {
  // Test - The first implementation, without getAnalysisUsage.
  struct CountOpcode : public FunctionPass {
    std::map< std::string, int >opcodeCounter;
    static char ID; // Pass identification, replacement for typeid
    CountOpcode() : FunctionPass(ID) {}

    virtual bool runOnFunction(Function &F) override {
      llvm::outs() << "Function: " << F.getName() << '\n';
      // iterates over all the basic blockes present in the function
      for (Function::iterator bb = F.begin(), e = F.end(); bb != e; ++bb)
      {
        // iterates over all the instructions present in the basic block
        for (BasicBlock::iterator i = bb->begin(), e = bb->end(); i != e; ++i)
        {
          if (opcodeCounter.find(i->getOpcodeName()) == opcodeCounter.end())
          {
            opcodeCounter[i->getOpcodeName()] = 1;
          } else {
            opcodeCounter[i->getOpcodeName()] += 1;
          }
        }
      }

      std::map< std::string, int>::iterator i = opcodeCounter.begin();
      std::map< std::string, int>::iterator e = opcodeCounter.end();
      while (i != e)
      {
        llvm::outs() << i->first << ": " << i->second << "\n";
        i++;
      }
      llvm::outs() << "\n";
      opcodeCounter.clear();
      return false;
    }

    /*
    virtual void getAnalysisUsage(AnalysisUsage& AU) const override {
      AU.addRequired<LoopInfoWrapperPass>();
    }
    */
  };
}

// register the pass with the given name so that the opt tool can use this pass
char CountOpcode::ID = 0;
static RegisterPass<CountOpcode> X("opcodeCounter", "Count number of opcode in a function", false, false);