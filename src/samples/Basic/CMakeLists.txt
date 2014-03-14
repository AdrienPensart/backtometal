set(CMAKE_ASM_NASM_OBJECT_FORMAT bin)

project(Basic NONE)

enable_language(ASM_NASM)

file (GLOB_RECURSE ${PROJECT_NAME}_sources "*.asm")

add_library (${PROJECT_NAME} STATIC ${${PROJECT_NAME}_sources})

set_target_properties(${PROJECT_NAME} PROPERTIES RULE_LAUNCH_LINK "${CMAKE_SOURCE_DIR}/tools/cpo ${PROJECT_NAME} ${BINARY_OUTPUT} <OBJECTS> --")
