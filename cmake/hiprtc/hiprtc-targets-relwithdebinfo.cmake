#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "hiprtc::hiprtc" for configuration "RelWithDebInfo"
set_property(TARGET hiprtc::hiprtc APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(hiprtc::hiprtc PROPERTIES
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/libhiprtc.so.5.4.50401"
  IMPORTED_SONAME_RELWITHDEBINFO "libhiprtc.so.5"
  )

list(APPEND _cmake_import_check_targets hiprtc::hiprtc )
list(APPEND _cmake_import_check_files_for_hiprtc::hiprtc "${_IMPORT_PREFIX}/lib/libhiprtc.so.5.4.50401" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
