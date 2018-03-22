def FlagsForFile( filename, **kwargs ):
    return {
            'flags': [ '-x', 'c++','-std=c++14', '-Wall', '-Wextra', '-I/home/amar/github/julia_ros_ws/install/include', '-I/home/amar/github/julia_code/install/include', '-I/home/amar/github/julia_code/src/julia_embedded/include/'],
            'flags': [ '-x', 'c','-std=c99', '-Wall', '-Wextra'],
            }
