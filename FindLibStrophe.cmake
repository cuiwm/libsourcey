########################################################################
# Cmake module for finding LibStrophe
#
# The following variabled will be defined:
#
#  LibStrophe
#  LibStrophe_INCLUDE_DIRS
#  LibStrophe_LIBRARY
#


# ----------------------------------------------------------------------
# Find LibStrophe include path
# ----------------------------------------------------------------------
find_path(LibStrophe_INCLUDE_DIR strophe.h
  ${LibSourcey_3RDPARTY_SOURCE_DIR}/libstrophe
  /usr/local/include
  /usr/include
)

if (LibStrophe_INCLUDE_DIR)
  set(LibStrophe_INCLUDE_DIRS ${LibStrophe_INCLUDE_DIR} "${LibStrophe_INCLUDE_DIR}/src")
endif()


# ----------------------------------------------------------------------
# Find LibStrophe library
# ----------------------------------------------------------------------
FIND_LIBRARY(LibStrophe_LIBRARY 
  NAMES 
    libstrophe.lib libstrophed.lib
  PATHS 
    ${LibSourcey_3RDPARTY_INSTALL_DIR}/lib
    /usr/lib 
    /usr/local/lib
  )

if(LibStrophe_LIBRARY AND LibStrophe_INCLUDE_DIR)
  set(LibStrophe_FOUND 1)
else()
  set(LibStrophe_FOUND 0)
endif()

get_filename_component(LibStrophe_LIBRARY_DIR ${LibStrophe_LIBRARY} PATH)
get_filename_component(LibStrophe_LIBRARY ${LibStrophe_LIBRARY} NAME)
  
      
# ----------------------------------------------------------------------
# Display status
# ----------------------------------------------------------------------
if(LibStrophe_FOUND)
   if(NOT LibStrophe_FIND_QUIETLY)
      message(STATUS "Found LibStrophe: \n\tINC DIR: ${LibStrophe_INCLUDE_DIR} \n\tLIB DIR: ${LibStrophe_LIBRARY_DIR} \n\tLIBS: ${LibStrophe_LIBRARY}")
   endif (NOT LibStrophe_FIND_QUIETLY)
else()
   if(LibStrophe_FIND_REQUIRED)
      message(FATAL_ERROR "LibStrophe was not found.")
   endif()
endif()

#message(STATUS "LibSourcey_3RDPARTY_BUILD_DIR: ${LibSourcey_3RDPARTY_BUILD_DIR}")
#message(STATUS "LibSourcey_3RDPARTY_SOURCE_DIR: ${LibSourcey_3RDPARTY_SOURCE_DIR}")
#message(STATUS "LibStrophe_INCLUDE_DIRS: ${LibStrophe_INCLUDE_DIRS}")
#message(STATUS "LibStrophe_LIBRARY: ${LibStrophe_LIBRARY}")
 

# ----------------------------------------------------------------------
# Include and expose to LibSourcey
# ----------------------------------------------------------------------
if(LibStrophe_FOUND)
  include_directories(${LibStrophe_INCLUDE_DIRS})  
  link_directories(${LibStrophe_LIBRARY_DIR})
                        
  set(LibSourcey_INCLUDE_DIRS ${LibSourcey_INCLUDE_DIRS} ${LibStrophe_INCLUDE_DIRS})
  set(LibSourcey_LIBRARY_DIRS ${LibSourcey_LIBRARY_DIRS} ${LibStrophe_LIBRARY_DIR})
  set(LibSourcey_DEBUG_LIBS   ${LibSourcey_DEBUG_LIBS}   ${LibStrophe_LIBRARY})    
  set(LibSourcey_RELEASE_LIBS ${LibSourcey_RELEASE_LIBS} ${LibStrophe_LIBRARY})
endif()