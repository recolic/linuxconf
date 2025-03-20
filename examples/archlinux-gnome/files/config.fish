if test -d /usr/mybin
    set -gx PATH /usr/mybin $PATH
end
set -gx EDITOR vim

# AMD GPU
set -gx PYTORCH_ROCM_ARCH gfx1032
set -gx HSA_OVERRIDE_GFX_VERSION 10.3.0

set -x DOTNET_SYSTEM_GLOBALIZATION_INVARIANT 1

# Bug fix: valgrind debuginfod error
set -x DEBUGINFOD_URLS "https://debuginfod.archlinux.org"
set -x G_SLICE always-malloc

function fish_command_not_found
    # do nothing
    echo Command not found 1>&2
end

if fish --version | grep ' 4' > /dev/null
    bind ctrl-c cancel-commandline
end

