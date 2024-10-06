set fish_greeting "" # No welcome message

# Shorter prompt
function fish_prompt -d "Write out the prompt"
    printf '%s%s%s%s ' $USER \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

set PATH $HOME/.cargo/bin $PATH

# zellij
if status is-interactive
    eval (zellij setup --generate-auto-start fish | string collect)
end

