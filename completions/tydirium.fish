# Fish completion for tydirium
# Installation: copy to ~/.config/fish/completions/

# Disable file completions
complete -c tydirium -f

# Options
complete -c tydirium -s q -d "Quick mode - check fewer DNS servers"
complete -c tydirium -s v -d "Verbose mode - show more details"
complete -c tydirium -s h -d "Show help"
complete -c tydirium -s V -d "Show version"

# Common domains as suggestions
complete -c tydirium -a "example.com" -d "Example domain"
complete -c tydirium -a "gmail.com" -d "Gmail"
complete -c tydirium -a "yahoo.com" -d "Yahoo Mail"
complete -c tydirium -a "outlook.com" -d "Outlook"

# Email address pattern suggestions
complete -c tydirium -a "user@example.com" -d "Example email"
complete -c tydirium -a "test@gmail.com" -d "Gmail address"