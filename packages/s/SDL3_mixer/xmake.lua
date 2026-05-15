package("SDL3_mixer")
    set_homepage("https://github.com/libsdl-org/SDL_mixer")
    set_description("An audio mixer that supports various file formats for Simple Directmedia Layer.")
    set_license("Zlib license")

    set_kind("library")

    set_urls("https://github.com/libsdl-org/SDL_mixer.git")

    on_install(function (package)
        local configs = {"-DBUILD_SHARED_LIBS=" .. (package:config("shared") and "ON" or "OFF") }
        table.insert(configs, "-DCMAKE_BUILD_TYPE=" .. (package:debug() and "Debug" or "Release"))
        import("package.tools.cmake").install(package, config)
    end)
package_end()