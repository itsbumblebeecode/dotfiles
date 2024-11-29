wallpapers_dir="$HOME/.config/wallpapers"

shopt -s nullglob

files=("$HOME/.config/wallpapers"/*.{jpg,jpeg,png})

shopt -s nullglob

if [ ${#files[@]} -gt 0 ]; then
    random_image=$(printf "%s\n" "${files[@]}" | awk 'BEGIN{srand()} {print rand(), $0}' | sort -n | head -n 1 | cut -d' ' -f2-)

    osascript -e "tell application \"System Events\" to set picture of every desktop to \"${random_image}\""
fi;
