#!/bin/bash
set -euo pipefail

BACKUP_DIR="$HOME/.clu-backup"
CONTENT_DIR="$BACKUP_DIR/content"
CONFIG_DIR="$CONTENT_DIR/.config"
SCRIPTS_DIR="$CONTENT_DIR/.scripts"
OBSIDIAN_DIR="$CONTENT_DIR/documents/obsidian/dev-notes"

echo "Saving backup to: " $BACKUP_DIR

####################################################################
# clean previous backup but keep .git, readme and other needed files
####################################################################
find "$BACKUP_DIR" -mindepth 1 -maxdepth 1 \
	! -name '.git' \
	! -name 'README.md' \
	! -name 'todo.txt' \
	! -name 'content' \
	-exec rm -rf -- {} +

####################################################################
# backup shell configuration
####################################################################
mkdir -p "$CONTENT_DIR"

cp "$HOME/.bash_profile" "$CONTENT_DIR"
cp "$HOME/.bashrc" "$CONTENT_DIR"

####################################################################
# backup installed packages
####################################################################
pacman -Qqe > "$CONTENT_DIR/packages_list.txt"
pacman -Qqm > "$CONTENT_DIR/packages_aur_list.txt"

####################################################################
# backup application configuration
####################################################################
mkdir -p "$CONFIG_DIR"

config_dirs=(
	hypr
	neofetch
	waybar
	yazi
	nvim
)

for dir in "${config_dirs[@]}"; do
	mkdir -p "$CONFIG_DIR/$dir"
	cp -r "$HOME/.config/$dir/." "$CONFIG_DIR/$dir/"
done

config_files=(
	user-dirs.dirs
	user-dirs.locale
)

for file in "${config_files[@]}"; do
	cp "$HOME/.config/$file" "$CONFIG_DIR/"
done


####################################################################
# backup scripts
####################################################################
mkdir -p "$SCRIPTS_DIR"

cp -r "$HOME/.scripts/." "$SCRIPTS_DIR"

####################################################################
# backup dev-notes obsidian vault
####################################################################
mkdir -p "$OBSIDIAN_DIR"

cp -r "$HOME/documents/obsidian/dev-notes/." "$OBSIDIAN_DIR/"
rm -rf "$OBSIDIAN_DIR/.git"

####################################################################
# push everything to github
####################################################################
cd $BACKUP_DIR
git add .
git commit -m "performing backup to github"
git push
