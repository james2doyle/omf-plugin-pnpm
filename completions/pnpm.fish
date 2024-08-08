function __pnpm_entries
    set cmd (commandline -opc)

    if [ (count $cmd) -gt 1 ]
        # when using the run command
        if test $cmd[2] = "run"; or test $cmd[2] = "run-script"
            pnpm run --no-color | sed "1,/Commands available via \"pnpm run\":/d" | string match -vr '^\s{4}' | string trim | awk '{print $1}'
            return
        end
    end

    pnpm list --no-ansi | sed "1,/Available commands/d" | string match -i -r '\s+.+?\s+' | string trim
end

complete -f -c pnpm -a '(__pnpm_entries)'

complete -c pnpm -n "__fish_use_subcommand" -a "add" -d "Installs a package and any packages that it depends on. By default, any new package is installed as a prod dependency"
complete -c pnpm -n "__fish_use_subcommand" -a "import" -d "Generates a pnpm-lock.yaml from an npm package-lock.json (or npm-shrinkwrap.json) file"
complete -c pnpm -n "__fish_use_subcommand" -a "install" -d "Install all dependencies for a project"
complete -c pnpm -n "__fish_use_subcommand" -a "install-test" -d "Runs a pnpm install followed immediately by a pnpm test"
complete -c pnpm -n "__fish_use_subcommand" -a "link" -d "Connect the local project to another one"
complete -c pnpm -n "__fish_use_subcommand" -a "prune" -d "Removes extraneous packages"
complete -c pnpm -n "__fish_use_subcommand" -a "rebuild" -d "Rebuild a package"
complete -c pnpm -n "__fish_use_subcommand" -a "remove" -d "Removes packages from node_modules and from the project's package.json"
complete -c pnpm -n "__fish_use_subcommand" -a "unlink" -d "Unlinks a package. Like yarn unlink but pnpm re-installs the dependency after removing the external link"
complete -c pnpm -n "__fish_use_subcommand" -a "update" -d "Updates packages to their latest version based on the specified range"
complete -c pnpm -n "__fish_use_subcommand" -a "audit" -d "Checks for known security issues with the installed packages"
complete -c pnpm -n "__fish_use_subcommand" -a "licenses" -d "Check licenses in consumed packages"
complete -c pnpm -n "__fish_use_subcommand" -a "list" -d "Print all the versions of packages that are installed, as well as their dependencies, in a tree-structure"
complete -c pnpm -n "__fish_use_subcommand" -a "outdated" -d "Check for outdated packages"
complete -c pnpm -n "__fish_use_subcommand" -a "exec" -d "Executes a shell command in scope of a project"
complete -c pnpm -n "__fish_use_subcommand" -a "run" -d "Runs a defined package script"
complete -c pnpm -n "__fish_use_subcommand" -a "start" -d "Runs an arbitrary command specified in the package's \"start\" property of its \"scripts\" object"
complete -c pnpm -n "__fish_use_subcommand" -a "test" -d "Runs a package's \"test\" script, if one was provided"
complete -c pnpm -n "__fish_use_subcommand" -a "cat-file" -d "Prints the contents of a file based on the hash value stored in the index file"
complete -c pnpm -n "__fish_use_subcommand" -a "cat-index" -d "Prints the index file of a specific package from the store"
complete -c pnpm -n "__fish_use_subcommand" -a "find-hash" -d "Experimental! Lists the packages that include the file with the specified hash."
complete -c pnpm -n "__fish_use_subcommand" -a "pack"
complete -c pnpm -n "__fish_use_subcommand" -a "publish" -d "Publishes a package to the registry"
complete -c pnpm -n "__fish_use_subcommand" -a "root"
complete -c pnpm -n "__fish_use_subcommand" -a "store add" -d "Adds new packages to the pnpm store directly. Does not modify any projects or files outside the store"
complete -c pnpm -n "__fish_use_subcommand" -a "store path" -d "Prints the path to the active store directory"
complete -c pnpm -n "__fish_use_subcommand" -a "store prune" -d "Removes unreferenced (extraneous, orphan) packages from the store"
complete -c pnpm -n "__fish_use_subcommand" -a "store status" -d "Checks for modified packages in the store"