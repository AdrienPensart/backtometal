set(CMAKE_ASM_NASM_OBJECT_FORMAT bin)
set(CMAKE_ASM_NASM_FLAGS "${CMAKE_ASM_NASM_FLAGS} -I${CMAKE_CURRENT_SOURCE_DIR}/")

project(A20Gate NONE)
enable_language(ASM_NASM)

add_library (DetectA20Gate      STATIC "DetectA20Gate.asm" )
add_library (FastEnableA20Gate  STATIC "FastEnableA20Gate.asm")
add_library (FastDisableA20Gate STATIC "FastDisableA20Gate.asm")
add_library (BiosEnableA20Gate  STATIC "BiosEnableA20Gate.asm")
add_library (BiosDisableA20Gate STATIC "BiosDisableA20Gate.asm")

set_target_properties(DetectA20Gate      PROPERTIES RULE_LAUNCH_LINK "${CMAKE_SOURCE_DIR}/tools/cpo DetectA20Gate      ${BINARY_OUTPUT} <OBJECTS> --")
set_target_properties(FastEnableA20Gate  PROPERTIES RULE_LAUNCH_LINK "${CMAKE_SOURCE_DIR}/tools/cpo FastEnableA20Gate  ${BINARY_OUTPUT} <OBJECTS> --")
set_target_properties(FastDisableA20Gate PROPERTIES RULE_LAUNCH_LINK "${CMAKE_SOURCE_DIR}/tools/cpo FastDisableA20Gate ${BINARY_OUTPUT} <OBJECTS> --")
set_target_properties(BiosEnableA20Gate  PROPERTIES RULE_LAUNCH_LINK "${CMAKE_SOURCE_DIR}/tools/cpo BiosEnableA20Gate  ${BINARY_OUTPUT} <OBJECTS> --")
set_target_properties(BiosDisableA20Gate PROPERTIES RULE_LAUNCH_LINK "${CMAKE_SOURCE_DIR}/tools/cpo BiosDisableA20Gate ${BINARY_OUTPUT} <OBJECTS> --")
