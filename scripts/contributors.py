import requests
from datetime import date

today_date = date.today().strftime("%Y-%m-%d")

URL = f"https://api.github.com/repos/tomfran/typo/contributors"

response = requests.get(URL)
if response.status_code != 200:
    raise Exception(f"Failed to fetch contributors: {response.status_code} {response.reason}")

contributors = response.json()

content = f"""---
title: "Contributors"
date: "{today_date}"
summary: "List of Typo's contributors"
description: "List of Typo's contributors"
toc: false
readTime: false
autonumber: false
math: false
showTags: false
hidePagination: true
hideBackToTop: false
---

Here is a list of the {len(contributors)} contributors and their contribution count for the theme:
"""

content += """<ul style="list-style-type: none; padding: 0; margin-top: 2rem">\n"""
for contributor in contributors:
    username = contributor.get("login", "Unknown")
    profile_url = contributor.get("html_url", "#")
    contributions = contributor.get("contributions", 0)
    avatar_url = contributor.get("avatar_url", "")
    
    content += f"""<li style="margin-left: 0px; margin-bottom: .5rem;">
        <span style="display: flex; align-items: bottom;">
            <img src="{avatar_url}" alt="{username}" width="30" height="30" style="margin-right: 10px; border-radius: 50%;">
            <a href="{profile_url}">{username}</a>&nbsp;- {contributions}
        </span>
    </li>
    """

content += "</ul>\n"

with open("content/contributors.md", "w") as f:
    f.write(content)

print("Contributors list has been written to content/contributors.md")
