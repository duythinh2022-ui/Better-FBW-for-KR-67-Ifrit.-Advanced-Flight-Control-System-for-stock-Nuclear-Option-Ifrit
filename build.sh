#!/bin/bash
# usage: build.sh <srcdir> <out.dll> [DEFINES]
M="${NO_MANAGED:-C:/Program Files (x86)/Steam/steamapps/common/Nuclear Option/NuclearOption_Data/Managed}"; B="${NO_BEPINEX:-C:/Program Files (x86)/Steam/steamapps/common/Nuclear Option/BepInEx/core}"
SRC="$1"; OUT="$2"; DEF="$3"
CSC=$(ls /usr/lib/dotnet/sdk/*/Roslyn/bincore/csc.dll | head -1)
dotnet "$CSC" -nologo -noconfig -nostdlib+ -target:library -langversion:9.0 -unsafe+ -optimize+ -deterministic -nowarn:CS0436,CS1701,CS1702 $DEF \
 -out:"$OUT" \
 -r:"$M/mscorlib.dll" -r:"$M/System.dll" -r:"$M/System.Core.dll" -r:"$M/netstandard.dll" \
 -r:"$M/Assembly-CSharp.dll" -r:"$M/UnityEngine.CoreModule.dll" -r:"$M/UnityEngine.PhysicsModule.dll" -r:"$M/UnityEngine.dll" -r:"$M/UnityEngine.SharedInternalsModule.dll" \
 -r:"$M/Mirage.dll" -r:"$M/Unity.Mathematics.dll" -r:"$M/UniTask.dll" -r:"$M/JamesFrowen.ScriptableVariables.dll" -r:"$B/BepInEx.dll" -r:"$B/0Harmony.dll" \
 $(find "$SRC" -name "*.cs" -not -path "*/DevUnlock/*" | tr "\n" " ")
