#!/bin/bash

f1=${1}
f2=${2}
fO=${3}
lMod=${4}
dOpt=${5}
dirPattern=${6}
dirPatternExclude=${7}
cp ~/tools/compareValHists.C compareValHists.C
echo "Running on f1 ${f1} f2 ${f2} fO ${fO} lMod ${lMod} dOpt ${dOpt} dirPattern ${dirPattern} dirPatternExclude ${dirPatternExclude}"
echo -e "gROOT->SetStyle(\"Plain\");\n 
 .L compareValHists.C+ \n\
 f1=new TFile(\"${f1}\");\n f2 = new TFile(\"${f2}\");\n compareAll(f1,f2,${lMod},${dOpt}, \"${dirPattern}\", \"${dirPatternExclude}\");\n\
.qqqqqq" | root -l -b
# add this to manually set the flags, not needed in most cases
# gSystem->SetMakeSharedLib(\"cd \$BuildDir ;g++  -c \$Opt -pipe -m64 -Wshadow -Wall -W -Woverloaded-virtual -fPIC -std=c++11 -Wno-deprecated-declarations -DG__MAXSTRUCT=36000 -DG__MAXTYPEDEF=36000 -DG__LONGLINE=4096 -pthread \$IncludePath \$SourceFiles ; g++ \$ObjectFiles -shared -Wl,-soname,\$LibName.so -m64 -Wl,--hash-style=gnu -O2  \$LinkedLibs -o \$SharedLib\");\n 
# cout<< gSystem->GetMakeSharedLib()<<endl ;\n
mv diff.ps ${fO}
gzip -f ${fO}
fOPDF=`echo ${fO} | sed -e 's/.ps$/.pdf/g' `
[ -f "diff.pdf" ] &&  mv diff.pdf ${fOPDF} && gzip ${fOPDF}
