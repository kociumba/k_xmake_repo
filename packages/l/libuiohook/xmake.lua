package("libuiohook")
    set_homepage("https://github.com/kwhat/libuiohook")
    set_description("A multi-platform C library to provide global keyboard and mouse hooks from userland.")
    set_license("GPL v3")

    set_kind("library")

    set_urls("https://github.com/kwhat/libuiohook.git")

    on_install(function (package)
        local configs = {"-DBUILD_SHARED_LIBS=" .. (package:config("shared") and "ON" or "OFF") }
        table.insert(configs, "-DCMAKE_BUILD_TYPE=" .. (package:debug() and "Debug" or "Release"))
        import("package.tools.cmake").install(package, config)
    end)
package_end()