#!/bin/bash

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# List of programs
programs=("Applite" "DeepL" "Discord" "Firefox" "OBS" "QBittorrent" "Signal" "Spotify" "SpotX" "VLC" "VSCodium" "VSCode" "Waterfox")

# Create selection dialog
selected=$(osascript -e 'set programList to {"Applite", "DeepL", "Discord", "Firefox", "OBS", "QBittorrent", "Signal", "Spotify", "SpotX", "VLC", "VSCodium", "VSCode", "Waterfox"}
set chosenPrograms to choose from list programList with prompt "Select the programs you want to install:" with multiple selections allowed and empty selection allowed
if chosenPrograms is false then
    return ""
else
    return chosenPrograms
end if')

# Installation
IFS=', ' read -r -a selectedPrograms <<< "$selected"

for program in "${selectedPrograms[@]}"; do
    case $program in
        "Applite")
            echo "Installing Applite..."
            brew install --cask applite
            ;;
        "DeepL")
            echo "Installing DeepL..."
            brew install --cask deepl
            ;;
        "Discord")
            echo "Installing Discord..."
            brew install --cask discord
            ;;
        "Firefox")
            echo "Installing Firefox..."
            brew install --cask firefox
            ;;
        "OBS")
            echo "Installing OBS..."
            brew install --cask obs
            ;;
        "QBittorrent")
            echo "Installing qBittorrent..."
            brew install --cask qbittorrent
            ;;
        "Signal")
            echo "Installing Signal..."
            brew install --cask signal
            ;;
        "Spotify")
            echo "Installing Spotify..."
            brew install --cask spotify
            ;;
        "SpotX")
            echo "Installing SpotX..."
            bash <(curl -sSL https://spotx-official.github.io/run.sh)
            ;;
        "VLC")
            echo "Installing VLC..."
            brew install --cask vlc
            ;;
        "VSCodium")
            echo "Installing VSCodium..."
            brew install --cask vscodium
            ;;
        "VSCode")
            echo "Installing VSCode..."
            brew install --cask visual-studio-code
            ;;
        "Waterfox")
            echo "Installing Waterfox..."
            brew install --cask waterfox
            ;;
    esac
done

echo "Installation completed!"
