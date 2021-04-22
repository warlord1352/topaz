# from here:
#
# https://github.com/lefticus/cppbestpractices/blob/master/02-Use_the_Tools_Available.md

function(set_project_warnings project_name)
  set(MSVC_WARNINGS
      /W4 # Baseline reasonable warnings

      # /wd Disable
      /wd4100 # unreferenced formal parameter
      /wd4127 # conditional expression is constant
      /wd4201 # nonstandard extension used: nameless struct/union
      /wd4242 # 'identifier': conversion from 'type1' to 'type1', possible loss of data
      /wd4244 # 'argument': conversion from 'const type1' to 'type2', possible loss of data

      # /w1 Promote to level 1
      /w14254 # 'operator': conversion from 'type1:field_bits' to 'type2:field_bits', possible loss of data
      /w14263 # 'function': member function does not override any base class virtual member function
      /w14265 # 'classname': class has virtual functions, but destructor is not virtual instances of this class may not
              # be destructed correctly
      /w14287 # 'operator': unsigned/negative constant mismatch
      /we4289 # nonstandard extension used: 'variable': loop control variable declared in the for-loop is used outside
              # the for-loop scope
      /w14296 # 'operator': expression is always 'boolean_value'
      /w14311 # 'variable': pointer truncation from 'type1' to 'type2'
      /w14545 # expression before comma evaluates to a function which is missing an argument list
      /w14546 # function call before comma missing argument list
      /w14547 # 'operator': operator before comma has no effect; expected operator with side-effect
      /w14549 # 'operator': operator before comma has no effect; did you intend 'operator'?
      /w14555 # expression has no effect; expected expression with side- effect
      /w14619 # pragma warning: there is no warning number 'number'
      /w14640 # Enable warning on thread un-safe static member initialization
      /w14826 # Conversion from 'type1' to 'type_2' is sign-extended. This may cause unexpected runtime behavior.
      /w14905 # wide string literal cast to 'LPSTR'
      /w14906 # string literal cast to 'LPWSTR'
      /w14928 # illegal copy-initialization; more than one user-defined conversion has been implicitly applied
      /permissive- # standards conformance mode for MSVC compiler.
  )

  set(CLANG_WARNINGS
      -Wall
      -Wextra # reasonable and standard
      # TODO: -Wshadow # warn the user if a variable declaration shadows one from a parent context
      -Wnon-virtual-dtor # warn the user if a class with virtual functions has a non-virtual destructor. This helps
                         # catch hard to track down memory errors
      # TODO: -Wold-style-cast # warn for c-style casts
      # TODO: -Wcast-align # warn for potential performance problem casts
      # TODO: -Wunused # warn on anything being unused
      -Woverloaded-virtual # warn if you overload (not override) a virtual function
      # TODO: -Wpedantic # warn if non-standard C++ is used
      # TODO: -Wconversion # warn on type conversions that may lose data
      # TODO: -Wsign-conversion # warn on sign conversions
      -Wnull-dereference # warn if a null dereference is detected
      # TODO: -Wdouble-promotion # warn if float is implicit promoted to double
      -Wformat=2 # warn on security issues around functions that format output (ie printf)

      # TODO: Remove this
      -Wno-format-nonliteral
      # TODO: Remove this
      -Wno-unused-parameter
      # TODO: Remove this
      -Wno-error=sizeof-pointer-memaccess
      -Wno-sizeof-pointer-memaccess
  )

  set(GCC_WARNINGS
      ${CLANG_WARNINGS}
      -Wmisleading-indentation # warn if indentation implies blocks where blocks do not exist
      -Wduplicated-cond # warn if if / else chain has duplicated conditions
      -Wduplicated-branches # warn if if / else branches have duplicated code
      -Wlogical-op # warn about logical operations being used where bitwise were probably wanted
      # TODO: -Wuseless-cast # warn if you perform a cast to the same type
      
      # TODO: Remove this
      -Wno-implicit-fallthrough
      -Wno-non-virtual-dtor
      -Wno-overloaded-virtual
      -Wno-type-limits
      -Wno-extra
      -Wno-class-memaccess
      -Wno-restrict
  )

  if(MSVC)
    set(PROJECT_WARNINGS ${MSVC_WARNINGS})
  elseif(CMAKE_CXX_COMPILER_ID MATCHES ".*Clang")
    set(PROJECT_WARNINGS ${CLANG_WARNINGS})
  elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    set(PROJECT_WARNINGS ${GCC_WARNINGS})
  else()
    message(AUTHOR_WARNING "No compiler warnings set for '${CMAKE_CXX_COMPILER_ID}' compiler.")
  endif()

  option(WARNINGS_AS_ERRORS "Treat compiler warnings as errors" TRUE)
  if(WARNINGS_AS_ERRORS)
    if(UNIX)
      set(ERRORS "-Werror")
    elseif(WIN32)
      set(ERRORS "/WX")
    endif()
  endif()

  target_compile_options(${project_name} INTERFACE ${ERRORS} ${PROJECT_WARNINGS})
endfunction() #set_project_warnings

function(set_no_warnings project_name)
  if(WARNINGS_AS_ERRORS)
    if(UNIX)
      target_compile_options(${project_name} INTERFACE "-Wno-everything")
    elseif(WIN32)
      target_compile_options(${project_name} INTERFACE "/w")
    endif()
  endif()
endfunction() # set_no_warnings
