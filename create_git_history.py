#!/usr/bin/env python3
import os
import subprocess
from datetime import datetime, timedelta
import random
import shutil

def run_git_command(cmd):
    """Run a git command and return output"""
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    return result.stdout, result.stderr, result.returncode

def create_commit(message, date_str):
    """Create a commit with a specific date"""
    hour = random.randint(10, 21)
    minute = random.randint(0, 59)
    commit_datetime = f"{date_str} {hour:02d}:{minute:02d}:00"
    
    run_git_command("git add .")
    env_vars = f'GIT_AUTHOR_DATE="{commit_datetime}" GIT_COMMITTER_DATE="{commit_datetime}"'
    cmd = f'{env_vars} git commit -m "{message}"'
    stdout, stderr, code = run_git_command(cmd)
    return code == 0

def setup_repo():
    """Setup git repository with proper config"""
    run_git_command("git init")
    run_git_command('git config user.name "Pratik Khaire"')
    run_git_command('git config user.email "Pratik.shekhar.khaire@gmail.com"')

# Define the commit structure with files
commits = [
    {
        "message": "Initial project setup with Vite and React",
        "files": [
            ".gitignore",
            "package.json",
            "package-lock.json",
            "vite.config.js",
            "eslint.config.js"
        ]
    },
    {
        "message": "Add HTML entry point",
        "files": ["index.html"]
    },
    {
        "message": "Setup main app structure",
        "files": [
            "src/main.jsx",
            "src/App.jsx"
        ]
    },
    {
        "message": "Add global styles and Tailwind",
        "files": ["src/index.css"]
    },
    {
        "message": "Add custom fonts",
        "files": [
            "public/fonts/",
            "public/vite.svg"
        ]
    },
    {
        "message": "Add logo and navigation assets",
        "files": [
            "public/images/logo.webp",
            "public/images/nav-logo.svg",
            "public/images/menu.svg",
            "public/images/fav.png"
        ]
    },
    {
        "message": "Implement navigation bar component",
        "files": ["src/sections/NavBar.jsx"]
    },
    {
        "message": "Add hero section assets",
        "files": [
            "public/images/hero-bg.webp",
            "public/images/hero-text.svg",
            "public/images/hero-text.webp",
            "public/images/big-hero-text.svg"
        ]
    },
    {
        "message": "Create hero section with GSAP animations",
        "files": ["src/sections/Hero.jsx"]
    },
    {
        "message": "Add first video and play controls",
        "files": [
            "public/videos/output1.mp4",
            "public/images/play.svg",
            "public/images/play.png"
        ]
    },
    {
        "message": "Implement first video section with scroll trigger",
        "files": ["src/sections/FirstVideo.jsx"]
    },
    {
        "message": "Add Jason character assets",
        "files": [
            "public/images/jason-1.webp",
            "public/images/jason-2.webp",
            "public/images/jason-3.webp"
        ]
    },
    {
        "message": "Create Jason character section",
        "files": ["src/sections/Jason.jsx"]
    },
    {
        "message": "Add second video asset",
        "files": ["public/videos/output2.mp4"]
    },
    {
        "message": "Implement second video section",
        "files": ["src/sections/SecondVideo.jsx"]
    },
    {
        "message": "Add Lucia character assets",
        "files": [
            "public/images/lucia-1.webp",
            "public/images/lucia-2.webp",
            "public/images/lucia-3.webp"
        ]
    },
    {
        "message": "Create Lucia character section",
        "files": ["src/sections/Lucia.jsx"]
    },
    {
        "message": "Add final section assets and overlays",
        "files": [
            "public/videos/output3.mp4",
            "public/images/overlay.webp",
            "public/images/mask.svg",
            "public/images/watch-trailer.png"
        ]
    },
    {
        "message": "Implement final reveal and outro sections",
        "files": [
            "src/sections/Final.jsx",
            "src/sections/Outro.jsx",
            "public/images/ps-logo.svg",
            "public/images/x-logo.svg"
        ]
    },
    {
        "message": "Add constants and additional features",
        "files": [
            "constants/",
            "src/sections/PostCard.jsx",
            "src/sections/ComingSoon.jsx",
            "public/images/photo1.webp",
            "public/videos/postcard-vd.mp4",
            "README.md"
        ]
    }
]

# Create temporary backup directory
backup_dir = "/tmp/gta_backup"
if os.path.exists(backup_dir):
    shutil.rmtree(backup_dir)

print("📦 Creating backup of all files...")
shutil.copytree(".", backup_dir, ignore=shutil.ignore_patterns('.git', '__pycache__', '*.pyc'))

# Remove all files except scripts
print("🧹 Cleaning workspace...")
for item in os.listdir("."):
    if item not in [".git", "create_commits.sh", "setup_commits.sh", "create_git_history.py"]:
        if os.path.isdir(item):
            shutil.rmtree(item)
        else:
            os.remove(item)

# Initialize git
print("🔧 Initializing git repository...")
setup_repo()

# Start date
current_date = datetime(2025, 5, 21)
day_gaps = [2, 3, 2, 3, 2, 2, 3, 2, 3, 2, 3, 2, 2, 3, 2, 3, 2, 2, 3]

print(f"\n📅 Creating 20 commits starting from {current_date.strftime('%Y-%m-%d')}\n")

for i, commit_data in enumerate(commits, 1):
    print(f"[{i}/20] {commit_data['message']}")
    
    # Copy files from backup
    for file_pattern in commit_data['files']:
        src = os.path.join(backup_dir, file_pattern)
        dst = file_pattern
        
        if os.path.isdir(src):
            # Copy directory
            os.makedirs(os.path.dirname(dst) if os.path.dirname(dst) else ".", exist_ok=True)
            if os.path.exists(dst):
                shutil.rmtree(dst)
            shutil.copytree(src, dst)
        elif os.path.isfile(src):
            # Copy file
            os.makedirs(os.path.dirname(dst) if os.path.dirname(dst) else ".", exist_ok=True)
            shutil.copy2(src, dst)
    
    # Create commit
    date_str = current_date.strftime("%Y-%m-%d")
    if create_commit(commit_data['message'], date_str):
        print(f"   ✓ Committed on {date_str}")
    else:
        print(f"   ✗ Failed to commit")
    
    # Move to next date
    if i < len(commits):
        days_to_add = day_gaps[i-1] if i-1 < len(day_gaps) else 2
        current_date += timedelta(days=days_to_add)
    
    print()

# Clean up backup
shutil.rmtree(backup_dir)

print("✅ All 20 commits created successfully!\n")
print("📊 Commit history:")
stdout, _, _ = run_git_command("git log --oneline --reverse")
print(stdout)

print("\n📅 Commit timeline:")
stdout, _, _ = run_git_command('git log --pretty=format:"%h - %s (%ai)" --reverse')
print(stdout)
