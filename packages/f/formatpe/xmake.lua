package("formatpe")
    set_homepage("https://github.com/HoShiMin/formatPE")
    set_description("A bunch of parsers for PE and PDB formats in C++")
    set_license("MIT")

    set_kind("library", {headeronly = true})

    set_urls("https://github.com/HoShiMin/formatPE.git")

    on_install(function (package)
        os.cp("formatPE/Pe/**.hpp", package:installdir("include/Pe"))
        os.cp("formatPE/Pdb/**.hpp", package:installdir("include/Pdb"))
    end)

    on_load(function (package)
        package:add("includedirs", "include")
    end)
package_end()