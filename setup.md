### Apply plymouth theme
If you want to apply plymouth theme put it in the right directory:

```bash
sudo cp -r others/plymouth/themes/zaailtheme
sudo plymouthd-set-default-theme -R zaailtheme
sudo vim /etc/mkinitcpio.conf			# add plymouth to hooks
sudo mkinitcpio -P				# rebuild initramfs
sudo vim /etc/default/grub			# add 'quiet splash' in 'GRUB_CMDLINE_LINUX_DEFAULT'
sudo grub-mkconfig -o /boot/grub/grub.cfg	# update grub.cfg
```

Now plymouth theme has been applied, reboot the pc to see the changes.

---

### Load keyd configuration
If you want to load the keyd configuration:

```bash
cd others/keyd/
sudo stow -t /etc/keyd/ .
cd ..
sudo keyd reload
```

The keyd config is now applied and can be tested.

---

### Apply sddm theme
To apply sddm theme first copy the theme in the right directory:

```bash
sudo cp -r ~/Hyprland-dotfiles-artix/others/sddm/themes/silent /usr/share/sddm/themes
```

Now create a new file (if not existing):

```bash
sudo touch /etc/sddm.conf.d/theme.conf
```
Now add this into the file:

```
[Theme]
Current=silent
```

Reboot to see the changes.

---

### Change hyprland launch
The hyprland lauches by start-hyprland by default, in order for whole environment to work on artix we need dbus to start it. This change can be made in:

```bash
sudo vim /usr/share/wayland-session/hyprland.desktop
```

Replace **start-hyprland** with **dbus-run-session /usr/bin/start-hyprland.

---

### Install fonts and cursor
First copy the fonts in right directory:

```bash
cp ~/Hyprland-dotfiles-artix/others/fonts/* ~/.local/share/fonts/
cp ~/Hyprland-dotfiles-artix/others/icons/* ~/.local/share/icons/
```

To install the font do:

```bash
fc-cache-fv
```

For the cursor the hyprland.conf is already configured.

---
