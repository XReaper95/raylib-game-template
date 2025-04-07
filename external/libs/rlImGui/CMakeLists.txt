# Created by XReaper

project("rlImGui" LANGUAGES C)

# create static library
add_library(${PROJECT_NAME} STATIC "rlImGui.cpp")
target_include_directories(${PROJECT_NAME} PUBLIC .)
set_target_properties(${PROJECT_NAME} PROPERTIES CXX_STANDARD 17)
target_link_libraries(${PROJECT_NAME} PRIVATE raylib cimgui) # Link cimgui, as it links to ImGui