package("libuiohook")
    set_homepage("https://github.com/kwhat/libuiohook")
    set_description("A multi-platform C library to provide global keyboard and mouse hooks from userland.")
    set_license("GPL v3")

    set_kind("library")

    if is_plat("linux") then
        on_load( function (package)
            package:add("deps", "libx11", { configs = { shared = package:config("shared") } })
        end)
    end

    add_versions("1.2.2", "1.2.2")
    add_versions("1.2.3", "2a2d40f96178481d98980da0a8c1db8a41937d7c") -- aka: latest since the current main branch has no new releases

    set_urls("https://github.com/kwhat/libuiohook.git")

    on_install( function (package)
        local configs = { "-DBUILD_SHARED_LIBS=" .. (package:config("shared") and "ON" or "OFF") }
        table.insert(configs, "-DCMAKE_BUILD_TYPE=" .. (package:debug() and "Debug" or "Release"))
        import("package.tools.cmake").install(package, config)
    end)
package_end()
