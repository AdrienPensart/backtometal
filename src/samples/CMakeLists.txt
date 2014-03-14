set(CMAKE_ASM_NASM_FLAGS "-I${CMAKE_CURRENT_SOURCE_DIR}/common/")

add_subdirectory(Basic)
add_subdirectory(DetectLongMode)
add_subdirectory(A20Gate)
