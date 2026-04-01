
#include "llvm/Transforms/Utils/NumberDebugRecord.h"
#include "llvm/IR/DebugProgramInstruction.h" 
#include "llvm/IR/Function.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Config/llvm-config.h"

using namespace llvm;

PreservedAnalyses NumberDebugRecord::run(Function &F, FunctionAnalysisManager &FAM) {
    int CountValues = 0;
    int CountDeclares = 0;
    int CountAssigns = 0;

    for (BasicBlock &BB : F){
        for (Instruction &I : BB) {
            for (DbgRecord &DR : I.getDbgRecordRange()) {
                if (auto *DVR = dyn_cast<DbgVariableRecord>(&DR)) {
                    if (DVR->isDbgValue())
                        CountValues++;
                    else if (DVR->isDbgDeclare())
                        CountDeclares++;
                    else if (DVR->isDbgAssign())
                        CountAssigns++;
                }
            }
    }
    }
    
    
    errs() << "Function: " << F.getName() << "\n";
    errs() << "      #dbg_values : " << CountValues << "\n";
    errs() << "      #dbg_declare: " << CountDeclares << "\n";
    errs() << "      #dbg_assign: " << CountAssigns << "\n"; 
    return PreservedAnalyses::all();
}
