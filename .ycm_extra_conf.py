#  def FlagsForFile(filename, **kwargs):
#  if ".cpp" or ".hpp" in filename:
#  return {
#  'flags': ['-x', 'c++', '-std=c++14', '-Wall', '-Wextra', '-I/home/amar/github/julia_ros_ws/install/include', '-I/home/amar/github/julia_code/install/include', '-I/home/amar/github/julia_code/src/julia_embedded/include/'],
#  }
#  if ".rs" in filename:
#  return {
#  'flags': ['-x', 'rust'],
#  }
#  else:
#  return {
#  'flags': ['-x', 'c', '-std=c99', '-Wall', '-Wextra'],
#  }
#


def FlagsForFile(filename, **kwargs):
    if ".cpp" or ".hpp" in filename:
        return {
            'flags': ['-x', 'c++', '-std=c++14', '-Wall', '-Wextra', '-I/home/amar/github/julia_ros_ws/install/include', '-I/home/amar/github/julia_code/install/include', '-I/home/amar/github/julia_code/src/julia_embedded/include/'],
        }
    else:
        return {
            'flags': [
                '-x', 'c', '-std=c99', '-Wall', '-Wextra'
            ],
        }
