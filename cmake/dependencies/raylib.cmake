include("Utils")

function(configure_external_raylib target raylib_platform)
    set(LIB_NAME "raylib")

    # main configs
    force_bool(CUSTOMIZE_BUILD ON) # should always be on
    force_string(USE_EXTERNAL_GLFW OFF) # use the one included with Raylib
    force_string(PLATFORM ${raylib_platform})
    force_string(OPENGL_VERSION OFF)  # do not force it

    # binary options
    force_bool(BUILD_EXAMPLES OFF) # Build the bundled examples
    force_bool(GLFW_BUILD_WAYLAND OFF) # Build the bundled GLFW with Wayland support
    force_bool(GLFW_BUILD_X11 ON) # Build the bundled GLFW with X11 support
    force_bool(WITH_PIC OFF) # Compile static library as position-independent code
    force_bool(BUILD_SHARED_LIBS OFF) # Build raylib as a dynamic or static library
    force_bool(USE_AUDIO ON) # Build raylib with audio module
    force_bool(SUPPORT_BUSY_WAIT_LOOP ON) # Use busy wait loop for timing sync instead of a high-resolution timer
    force_bool(SUPPORT_CAMERA_SYSTEM ON) # Provide camera module (camera.h) with multiple predefined cameras
    force_bool(SUPPORT_DEFAULT_FONT ON) # Default font is loaded on window initialization
    force_bool(SUPPORT_SCREEN_CAPTURE OFF) # Allow automatic screen capture of current screen pressing F12
    force_bool(SUPPORT_GIF_RECORDING OFF) # Allow automatic gif recording of current screen pressing CTRL+F12
    force_bool(SUPPORT_GESTURES_SYSTEM ON) # Gestures module is included to support gestures detection
    force_bool(SUPPORT_MOUSE_GESTURES ON) # Mouse gestures are directly mapped like touches
    force_bool(SUPPORT_VR_SIMULATOR ON) # Support VR simulation functionality (stereo rendering)
    force_bool(SUPPORT_DISTORTION_SHADER ON) # Include stereo rendering distortion shader
    force_bool(SUPPORT_FONT_TEXTURE ON) # Draw rectangle shapes using font texture white character
    force_bool(SUPPORT_QUADS_DRAW_MODE ON) # Use QUADS instead of TRIANGLES for drawing when possible
    force_bool(SUPPORT_IMAGE_GENERATION ON) # Support procedural image generation functionality
    force_bool(INCLUDE_EVERYTHING OFF) # Include all optional off-by-default formats in build
    force_bool(SUPPORT_FILEFORMAT_PNG ON) # Support loading PNG as textures
    force_bool(SUPPORT_FILEFORMAT_GIF ON) # Support loading GIF as textures
    force_bool(SUPPORT_FILEFORMAT_QOI ON) # Support loading QOI as textures
    force_bool(SUPPORT_FILEFORMAT_DDS ON) # Support loading DDS as textures
    force_bool(SUPPORT_FILEFORMAT_BMP OFF) # Support loading BMP as textures
    force_bool(SUPPORT_FILEFORMAT_TGA OFF) # Support loading TGA as textures
    force_bool(SUPPORT_FILEFORMAT_JPG OFF) # Support loading JPG as textures
    force_bool(SUPPORT_FILEFORMAT_PSD OFF) # Support loading PSD as textures
    force_bool(SUPPORT_FILEFORMAT_HDR OFF) # Support loading HDR as textures
    force_bool(SUPPORT_FILEFORMAT_PIC OFF) # Support loading PIC as textures
    force_bool(SUPPORT_FILEFORMAT_KTX OFF) # Support loading KTX as textures
    force_bool(SUPPORT_FILEFORMAT_ASTC OFF) # Support loading ASTC as textures
    force_bool(SUPPORT_FILEFORMAT_PKM OFF) # Support loading PKM as textures
    force_bool(SUPPORT_FILEFORMAT_PVR OFF) # Support loading PVR as textures
    force_bool(SUPPORT_FILEFORMAT_OBJ ON) # Support loading OBJ file format
    force_bool(SUPPORT_FILEFORMAT_MTL ON) # Support loading MTL file format
    force_bool(SUPPORT_FILEFORMAT_IQM ON) # Support loading IQM file format
    force_bool(SUPPORT_FILEFORMAT_GLTF ON) # Support loading GLTF file format
    force_bool(SUPPORT_FILEFORMAT_VOX ON) # Support loading VOX file format
    force_bool(SUPPORT_FILEFORMAT_M3D ON) # Support loading M3D file format
    force_bool(SUPPORT_MESH_GENERATION ON) # Support procedural mesh generation functions
    force_bool(SUPPORT_FILEFORMAT_WAV ON) # Support loading WAV for sound
    force_bool(SUPPORT_FILEFORMAT_OGG ON) # Support loading OGG for sound
    force_bool(SUPPORT_FILEFORMAT_XM ON) # Support loading XM for sound
    force_bool(SUPPORT_FILEFORMAT_MOD ON) # Support loading MOD for sound
    force_bool(SUPPORT_FILEFORMAT_FLAC OFF) # Support loading FLAC for sound
    force_bool(SUPPORT_SAVE_PNG ON) # Support saving image data in PNG file format
    force_bool(SUPPORT_SAVE_BMP OFF) # Support saving image data in BMP file format
    force_bool(SUPPORT_TRACELOG ON) # Show TraceLog() output messages
    force_bool(SUPPORT_FILEFORMAT_FNT ON) # Support loading fonts in FNT format
    force_bool(SUPPORT_FILEFORMAT_TTF ON) # Support loading fonts in TTF format
    force_bool(SUPPORT_FILEFORMAT_BDF OFF) # Support loading fonts in BDF format
    force_bool(SUPPORT_IMAGE_MANIPULATION ON) # Support multiple image editing functions
    force_bool(SUPPORT_CLIPBOARD_IMAGE OFF) # undocumented?

    # configure
    add_external_subdirectory(${LIB_NAME})
    target_link_libraries(${target} PUBLIC raylib)

    # Checks if OSX and links appropriate frameworks (only required on MacOS)
    if (APPLE)
        target_link_libraries(${target} "-framework IOKit")
        target_link_libraries(${target} "-framework Cocoa")
        target_link_libraries(${target} "-framework OpenGL")
    endif ()

    copy_thirdparty_includes(${LIB_NAME} "src/raylib.h")
    copy_thirdparty_includes(${LIB_NAME} "src/rlgl.h")
    copy_thirdparty_includes(${LIB_NAME} "src/raymath.h")
endfunction()