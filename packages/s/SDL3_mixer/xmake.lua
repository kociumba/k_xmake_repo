package("SDL3_mixer")
    set_homepage("https://github.com/libsdl-org/SDL_mixer")
    set_description("An audio mixer that supports various file formats for Simple Directmedia Layer.")
    set_license("Zlib license")

    set_kind("library")

    set_urls("https://github.com/libsdl-org/SDL_mixer.git")

    add_versions("3.2.2", "release-3.2.2")

    on_load( function (package)
        package:add("deps", "libsdl3", { configs = { shared = package:config("shared") } })
    end)

    on_install( function (package)
        local configs = { "-DSDL3MIXER_VENDORED=OFF", "-DSDL3MIXER_SAMPLES=OFF" }
        table.insert(configs, "-DCMAKE_BUILD_TYPE=" .. (package:is_debug() and "Debug" or "Release"))
        table.insert(configs, "-DBUILD_SHARED_LIBS=" .. (package:config("shared") and "ON" or "OFF"))

        import("package.tools.cmake").install(package, configs)
    end)
package_end()
