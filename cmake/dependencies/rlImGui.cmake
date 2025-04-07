include("ExternalsUtils")
include("Utils")

function(configure_external_rlImGui target)
    # add the library
    add_external_subdirectory(rlImGui)

    # link to main target
    target_link_libraries(${target} PRIVATE rlImGui)

    # copy thirdparty headers
    copy_thirdparty_includes(rlImGui "rlImGui.h")
endfunction()