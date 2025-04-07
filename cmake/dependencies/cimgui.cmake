include("Utils")

function(configure_external_cimgui target)
    set(CIMGUI_LIB_NAME "cimgui")

    force_string(IMGUI_STATIC "yes")
    force_bool(IMGUI_FREETYPE NO)

    add_external_subdirectory(${CIMGUI_LIB_NAME})
    # this is required to activate the C API in cimgui.h
    target_compile_definitions(${target} PRIVATE CIMGUI_DEFINE_ENUMS_AND_STRUCTS=1)
    # link to main target
    target_link_libraries(${target} PRIVATE cimgui)

    copy_thirdparty_includes(${CIMGUI_LIB_NAME} "cimgui.h")
endfunction()