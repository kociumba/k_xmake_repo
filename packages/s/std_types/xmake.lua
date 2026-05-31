package("std_types")
    set_homepage("https://github.com/kociumba/kompound/tree/main/std_types")
    set_description("A very simple C/C++ header providing std type definitions")

    set_kind("library", { headeronly = true })

    add_urls("https://github.com/kociumba/kompound.git")

    on_install( function (package)
        os.cp("std_types/std_types.h", package:installdir("include"))
    end)

    on_load( function (package)
        package:add("includedirs", "include")
    end)
package_end()
