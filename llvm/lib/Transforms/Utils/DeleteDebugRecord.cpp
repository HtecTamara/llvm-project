#include "llvm/Transforms/Utils/DeleteDebugRecord.h"
#include "llvm/IR/DebugProgramInstruction.h" 
#include "llvm/IR/Function.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Config/llvm-config.h"
#include "llvm/Plugins/PassPlugin.h"

using namespace llvm;

PreservedAnalyses DeleteDebugRecord::run(Function &F, FunctionAnalysisManager &FAM) {
    bool Changed = false;

    for (BasicBlock &BB : F) {
        for (Instruction &I : BB) {
            for (DbgRecord &DR : make_early_inc_range(I.getDbgRecordRange())) {
                DR.eraseFromParent();
                Changed = true;
            }
        }
    }
    

    return Changed ? PreservedAnalyses::none() : PreservedAnalyses::all();
}
