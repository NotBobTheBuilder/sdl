from libc.stdint cimport uint32_t

cdef extern from "SDL2/SDL.h":
    int SDL_INIT_AUDIO
    int SDL_INIT_VIDEO

    int SDL_Init(uint32_t flags)
    void SDL_Quit()

    int SDL_WINDOWPOS_UNDEFINED

    int SDL_WINDOW_FULLSCREEN
    int SDL_WINDOW_FULLSCREEN_DESKTOP
    int SDL_WINDOW_OPENGL
    int SDL_WINDOW_HIDDEN
    int SDL_WINDOW_BORDERLESS
    int SDL_WINDOW_RESIZABLE
    int SDL_WINDOW_MINIMIZED
    int SDL_WINDOW_MAXIMIZED
    int SDL_WINDOW_INPUT_GRABBED
    int SDL_WINDOW_ALLOW_HIGHDPI

    ctypedef struct SDL_Window:
        pass

    SDL_Window* SDL_CreateWindow(
        const char* title,
        int x,
        int y,
        int w,
        int h,
        uint32_t flags
    )

    void SDL_DestroyWindow(SDL_Window* window)
