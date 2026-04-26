## Installation 
To install the setup first clone the repository and open it:

```Bash
git clone https://github.com/Ayaanfaisaall/Hyprland-dotfiles-artix.git
cd Hyprland-dotfiles-artix
```

### 1. Install Dependencies
Run the dependency installation script:

```bash
chmod +x dependencies.sh
./dependencies.sh
```

This will install all required packages for Hyprland, Waybar, and related components.

---

### 2. Backup Existing Configurations
Before proceeding, backup your current configurations to avoid data loss (if already existing):

```bash
mkdir -p ~/.config/configbak
mv ~/.config/hypr ~/.config/waybar ~/.config/foot ~/.config/alacritty ~/.config/kitty ~/.config/rofi ~/.config/eww ~/.config/nwg-dock-hyprland ~/.config/dunst ~/.config/configbak/ 2>/dev/null
```

This moves your existing configs to `~/.config/configbak/` for safekeeping.

---

### 3. Update Username Paths
The dotfiles contain hardcoded paths that need to be updated to your home directory. Replace `/home/ayaan` with your `$HOME`:

```bash
sed -i "s|/home/ayaan|$HOME|" .config/hypr/hyprpaper.conf
sed -i "s|/home/ayaan|$HOME|" .config/waybar/config.jsonc
sed -i "s|/home/ayaan|$HOME|" .config/waybar/style.css
sed -i "s|/home/ayaan|$HOME|" .config/hypr/hyprlock.conf
```

**Note:** Review these files manually if you encounter issues.

---

### 4. Deploy Configurations with Stow
Navigate to the `.config` directory and use GNU Stow to symlink the configurations:

```bash
cd .config
stow -t ~/.config .
cd ..
```

This creates symbolic links from the repository to your `~/.config/` directory, making updates easier.

---

### 5. Make Scripts Executable
Set executable permissions for Hyprland and EWW scripts:

```bash
chmod +x ~/.config/hypr/scripts/*.sh
chmod +x ~/.config/eww/scripts/*.sh
```

---

### 6. Install System Scripts
Copy utility scripts to `/usr/local/bin/` for system-wide access:

```bash
chmod +x scripts/*
sudo cp -p scripts/* /usr/local/bin/
```

These scripts can now be called from anywhere in your system.

---

### 7. Reload or Login
After installation:

1. **If already in Hyprland:** Reload the configuration or restart Hyprland
2. **If at login screen:** Select Hyprland session and login
---

### Note
For sddm, fonts, cursor installation refer to [setup.md](setup.md)

---
