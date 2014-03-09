cimport native
from libc.stdint cimport uint32_t

cdef class SDL:
    cdef uint32_t _flags

    def __cinit__(self, video=False, audio=False):
        flags = 0
        if video: flags |= native.SDL_INIT_VIDEO
        if audio: flags |= native.SDL_INIT_AUDIO
 
        self._flags = flags

    def __enter__(self):
        native.SDL_Init(self._flags)

    def __exit__(self, exc_type, exc_value, traceback):
        native.SDL_Quit()

cdef class Window:
    cdef native.SDL_Window* _window

    def __cinit__(self, title=None,
                        x=None,
                        y=None,
                        w=None,
                        h=None,
                        fullscreen=False,
                        fullscreen_desktop=False,
                        opengl=False,
                        hidden=False,
                        borderless=False,
                        resizable=False,
                        minimized=False,
                        maximized=False,
                        input_grabbed=False,
                        allow_highdpi=False):

        if title == None: title = "SPGL"

        if x == None: x = native.SDL_WINDOWPOS_UNDEFINED
        if y == None: y = native.SDL_WINDOWPOS_UNDEFINED
        if w == None: w = 640
        if h == None: h = 480

        cdef uint32_t flags = 0

        if fullscreen:          flags |= native.SDL_WINDOW_FULLSCREEN
        if fullscreen_desktop:  flags |= native.SDL_WINDOW_FULLSCREEN_DESKTOP
        if opengl:              flags |= native.SDL_WINDOW_OPENGL
        if hidden:              flags |= native.SDL_WINDOW_HIDDEN
        if borderless:          flags |= native.SDL_WINDOW_BORDERLESS
        if resizable:           flags |= native.SDL_WINDOW_RESIZABLE
        if minimized:           flags |= native.SDL_WINDOW_MINIMIZED
        if maximized:           flags |= native.SDL_WINDOW_MAXIMIZED
        if input_grabbed:       flags |= native.SDL_WINDOW_INPUT_GRABBED
        if allow_highdpi:       flags |= native.SDL_WINDOW_ALLOW_HIGHDPI
 
        self._window = native.SDL_CreateWindow(title, x, y, w, h, flags)

    def close(self):
        native.SDL_DestroyWindow(self._window)
