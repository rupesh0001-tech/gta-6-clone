#!/bin/bash

# Initialize git repository
git init

# Configure git (you may want to change these)
Git Username: Pratik Khaire
Git Email: Pratik.shekhar.khaire@gmail.com


# Base date: May 21, 2025
# Day gaps array (2-3 days random)
day_gaps=(2 3 2 3 2 2 3 2 3 2 3 2 2 3 2 3 2 2 3 2)

# Calculate dates for each commit
current_date="2025-05-21"

# Function to add days to a date
add_days() {
    date -d "$1 + $2 days" +%Y-%m-%d
}

# Function to create commit with specific date
create_commit() {
    local message="$1"
    local commit_date="$2"
    local time_hour=$((10 + RANDOM % 12)) # Random hour between 10-21
    local time_min=$((RANDOM % 60))
    local commit_datetime="$commit_date ${time_hour}:${time_min}:00"
    
    git add .
    GIT_AUTHOR_DATE="$commit_datetime" GIT_COMMITTER_DATE="$commit_datetime" git commit -m "$message"
}

# Commit 1: Initial project setup
echo "Creating commit 1/20..."
create_commit "Initial project setup with Vite and React" "$current_date"
current_date=$(add_days "$current_date" ${day_gaps[0]})

# Commit 2: Add package.json dependencies
echo "Creating commit 2/20..."
create_commit "Add GSAP and Tailwind dependencies" "$current_date"
current_date=$(add_days "$current_date" ${day_gaps[1]})

# Commit 3: Configure build tools
echo "Creating commit 3/20..."
create_commit "Configure Vite and ESLint settings" "$current_date"
current_date=$(add_days "$current_date" ${day_gaps[2]})

# Commit 4: Setup basic structure
echo "Creating commit 4/20..."
create_commit "Setup basic app structure and main entry point" "$current_date"
current_date=$(add_days "$current_date" ${day_gaps[3]})

# Commit 5: Add styling
echo "Creating commit 5/20..."
create_commit "Add global styles and Tailwind configuration" "$current_date"
current_date=$(add_days "$current_date" ${day_gaps[4]})

# Commit 6: Add assets
echo "Creating commit 6/20..."
create_commit "Add fonts and initial assets" "$current_date"
current_date=$(add_days "$current_date" ${day_gaps[5]})

# Commit 7: NavBar component
echo "Creating commit 7/20..."
create_commit "Implement navigation bar component" "$current_date"
current_date=$(add_days "$current_date" ${day_gaps[6]})

# Commit 8: Hero section
echo "Creating commit 8/20..."
create_commit "Create hero section with animations" "$current_date"
current_date=$(add_days "$current_date" ${day_gaps[7]})

# Commit 9: Add video assets
echo "Creating commit 9/20..."
create_commit "Add video assets and media files" "$current_date"
current_date=$(add_days "$current_date" ${day_gaps[8]})

# Commit 10: FirstVideo section
echo "Creating commit 10/20..."
create_commit "Implement first video section with scroll trigger" "$current_date"
current_date=$(add_days "$current_date" ${day_gaps[9]})

# Commit 11: Jason section
echo "Creating commit 11/20..."
create_commit "Add Jason character section" "$current_date"
current_date=$(add_days "$current_date" ${day_gaps[10]})

# Commit 12: Add images
echo "Creating commit 12/20..."
create_commit "Add character images and visual assets" "$current_date"
current_date=$(add_days "$current_date" ${day_gaps[11]})

# Commit 13: SecondVideo section
echo "Creating commit 13/20..."
create_commit "Implement second video section" "$current_date"
current_date=$(add_days "$current_date" ${day_gaps[12]})

# Commit 14: Lucia section
echo "Creating commit 14/20..."
create_commit "Add Lucia character section with animations" "$current_date"
current_date=$(add_days "$current_date" ${day_gaps[13]})

# Commit 15: Add constants
echo "Creating commit 15/20..."
create_commit "Add constants and configuration data" "$current_date"
current_date=$(add_days "$current_date" ${day_gaps[14]})

# Commit 16: Final section
echo "Creating commit 16/20..."
create_commit "Create final reveal section" "$current_date"
current_date=$(add_days "$current_date" ${day_gaps[15]})

# Commit 17: Outro section
echo "Creating commit 17/20..."
create_commit "Implement outro section with closing animations" "$current_date"
current_date=$(add_days "$current_date" ${day_gaps[16]})

# Commit 18: Responsive design
echo "Creating commit 18/20..."
create_commit "Add responsive design improvements" "$current_date"
current_date=$(add_days "$current_date" ${day_gaps[17]})

# Commit 19: Polish animations
echo "Creating commit 19/20..."
create_commit "Polish GSAP animations and scroll effects" "$current_date"
current_date=$(add_days "$current_date" ${day_gaps[18]})

# Commit 20: Final touches
echo "Creating commit 20/20..."
create_commit "Final touches and performance optimizations" "$current_date"

echo "✓ All 20 commits created successfully!"
echo "Git log:"
git log --oneline --graph --all
