set(CMAKE_ASM_NASM_OBJECT_FORMAT elf)

#set( GLOBAL_GDC_DEFS "-vtls -g -noboundscheck -w -m32 -c" )
#set( GLOBAL_DMD_DEFS "${GLOBAL_DMD_DEFS} -m32 -c" )
set( CMAKE_D_FLAGS "${CMAKE_D_FLAGS} -g -w -m32 -c -I${CMAKE_CURRENT_SOURCE_DIR}" )

file(GLOB_RECURSE source_files *.d)

# build step
add_library(${PROJECT_NAME} STATIC ${source_files})

# custom link step
set_target_properties(${PROJECT_NAME}
                      PROPERTIES RULE_LAUNCH_LINK
                      "ld -static -nostdlib -nodefaultlibs -T ${CMAKE_CURRENT_SOURCE_DIR}/linker.ld -o ${BINARY_OUTPUT}/iso/boot/kernel.bin <OBJECTS> --")

