#!/bin/bash

# Initialize git repository
git init
git config user.name "Shridhar Mishra"
git config user.email "shridmishra@example.com"

# Function to create commit with specific date
create_commit() {
    local message="$1"
    local date="$2"
    local hour=$((10 + RANDOM % 12))
    local min=$((RANDOM % 60))
    local datetime="$date ${hour}:${min}:00"
    
    git add .
    GIT_AUTHOR_DATE="$datetime" GIT_COMMITTER_DATE="$datetime" git commit -m "$message"
}

# Function to add days
add_days() {
    date -d "$1 + $2 days" +%Y-%m-%d
}

# Start date
current_date="2025-05-21"

echo "=== Creating realistic commit history ==="
echo ""

# Commit 1: Initial setup
echo "[1/20] Initial project setup..."
git add package.json package-lock.json vite.config.js eslint.config.js .gitignore
create_commit "Initial project setup with Vite and React" "$current_date"
current_date=$(add_days "$current_date" 2)

# Commit 2: HTML entry point
echo "[2/20] Add HTML entry point..."
git add index.html
create_commit "Add index.html entry point" "$current_date"
current_date=$(add_days "$current_date" 3)

# Commit 3: Main app structure
echo "[3/20] Setup main app..."
git add src/main.jsx src/App.jsx
create_commit "Setup main app structure and entry point" "$current_date"
current_date=$(add_days "$current_date" 2)

# Commit 4: Global styles
echo "[4/20] Add global styles..."
git add src/index.css
create_commit "Add global styles and Tailwind configuration" "$current_date"
current_date=$(add_days "$current_date" 3)

# Commit 5: Assets - fonts
echo "[5/20] Add fonts..."
git add public/fonts/ public/vite.svg
create_commit "Add custom fonts and basic assets" "$current_date"
current_date=$(add_days "$current_date" 2)

# Commit 6: Logo and basic images
echo "[6/20] Add logo and nav assets..."
git add public/images/logo.webp public/images/nav-logo.svg public/images/menu.svg public/images/fav.png
create_commit "Add logo and navigation assets" "$current_date"
current_date=$(add_days "$current_date" 2)

# Commit 7: NavBar component
echo "[7/20] Create NavBar..."
git add src/sections/NavBar.jsx
create_commit "Implement navigation bar component" "$current_date"
current_date=$(add_days "$current_date" 3)

# Commit 8: Hero assets
echo "[8/20] Add hero assets..."
git add public/images/hero-bg.webp public/images/hero-text.svg public/images/hero-text.webp public/images/big-hero-text.svg
create_commit "Add hero section assets" "$current_date"
current_date=$(add_days "$current_date" 2)

# Commit 9: Hero component
echo "[9/20] Create Hero section..."
git add src/sections/Hero.jsx
create_commit "Create hero section with animations" "$current_date"
current_date=$(add_days "$current_date" 3)

# Commit 10: First video
echo "[10/20] Add first video..."
git add public/videos/output1.mp4 public/images/play.svg public/images/play.png
create_commit "Add first video asset and play controls" "$current_date"
current_date=$(add_days "$current_date" 2)

# Commit 11: FirstVideo component
echo "[11/20] Create FirstVideo section..."
git add src/sections/FirstVideo.jsx
create_commit "Implement first video section with scroll trigger" "$current_date"
current_date=$(add_days "$current_date" 3)

# Commit 12: Jason assets
echo "[12/20] Add Jason character assets..."
git add public/images/jason-1.webp public/images/jason-2.webp public/images/jason-3.webp
create_commit "Add Jason character images" "$current_date"
current_date=$(add_days "$current_date" 2)

# Commit 13: Jason component
echo "[13/20] Create Jason section..."
git add src/sections/Jason.jsx
create_commit "Add Jason character section with animations" "$current_date"
current_date=$(add_days "$current_date" 2)

# Commit 14: Second video
echo "[14/20] Add second video..."
git add public/videos/output2.mp4
create_commit "Add second video asset" "$current_date"
current_date=$(add_days "$current_date" 3)

# Commit 15: SecondVideo component
echo "[15/20] Create SecondVideo section..."
git add src/sections/SecondVideo.jsx
create_commit "Implement second video section" "$current_date"
current_date=$(add_days "$current_date" 2)

# Commit 16: Lucia assets
echo "[16/20] Add Lucia character assets..."
git add public/images/lucia-1.webp public/images/lucia-2.webp public/images/lucia-3.webp
create_commit "Add Lucia character images" "$current_date"
current_date=$(add_days "$current_date" 3)

# Commit 17: Lucia component
echo "[17/20] Create Lucia section..."
git add src/sections/Lucia.jsx
create_commit "Add Lucia character section with animations" "$current_date"
current_date=$(add_days "$current_date" 2)

# Commit 18: Final section assets
echo "[18/20] Add final assets..."
git add public/videos/output3.mp4 public/images/overlay.webp public/images/mask.svg public/images/watch-trailer.png
create_commit "Add final section assets and overlays" "$current_date"
current_date=$(add_days "$current_date" 2)

# Commit 19: Final and Outro components
echo "[19/20] Create Final and Outro sections..."
git add src/sections/Final.jsx src/sections/Outro.jsx public/images/ps-logo.svg public/images/x-logo.svg
create_commit "Implement final reveal and outro sections" "$current_date"
current_date=$(add_days "$current_date" 3)

# Commit 20: Final polish
echo "[20/20] Add remaining features..."
git add constants/ src/sections/PostCard.jsx src/sections/ComingSoon.jsx public/images/photo1.webp public/videos/postcard-vd.mp4 README.md create_commits.sh setup_commits.sh
create_commit "Add constants, unused components, and documentation" "$current_date"

echo ""
echo "✅ All 20 commits created successfully!"
echo ""
echo "📅 Commit timeline:"
git log --pretty=format:"%h - %s (%ai)" --reverse
echo ""
echo ""
echo "📊 Commit graph:"
git log --oneline --graph --all
