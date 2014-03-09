import os

from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

setup(
    name        = "sdl",
    description = "Python bindings for sdl",
    author      = "Jack Wearden",
    cmdclass    = {'build_ext': build_ext},
    ext_modules = [Extension("sdl", ["src/sdl.pyx"], libraries=["SDL2"])]
)
