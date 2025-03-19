TARGET_FILE="content/users.md"
SOURCE_FILE="themes/typo/USERS.md"

mkdir -p "$(dirname "$TARGET_FILE")"

cat > "$TARGET_FILE" <<EOF
---
title: "Users"
date: "2025-03-19"
summary: "A non-exhaustive list of Typo users"
description: "A non-exhaustive list of Typo users"
toc: false
readTime: false
autonumber: false
math: false
showTags: false
hidePagination: true
hideBackToTop: true
---

This is a non-exhaustive list of Typo users. If you use Typo and would like to be added to this 
list, please feel free to open a PR [here](https://github.com/tomfran/typo/blob/main/USERS.md).

EOF

tail -n +2 "$SOURCE_FILE" >> "$TARGET_FILE"
