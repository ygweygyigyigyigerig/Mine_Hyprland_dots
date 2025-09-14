#!/bin/bash

# Your wallpaper URL
URL="https://images.wallpapersden.com/image/download/starry-landscape-4k-cool-blue-moon_bW5tbG6UmZqaraWkpJRobWllrWdma2U.jpg"

curl -A "Mozilla/5.0" -L -o ~/.wallpaper/Starry_wallpaper.jpg "$URL"
