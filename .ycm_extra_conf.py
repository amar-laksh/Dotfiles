def FlagsForFile( filename, **kwargs ):
    if ".cpp" in filename:
        return {
                'flags': [ '-x', 'c++','-std=c++14', '-Wall', '-Wextra', '-I/home/amar/github/julia_ros_ws/install/include', '-I/home/amar/github/julia_code/install/include', '-I/home/amar/github/julia_code/src/julia_embedded/include/'],
                }
    else:
        return {
                'flags': [ '-x', 'c','-std=c99', '-Wall', '-Wextra'],
                }
