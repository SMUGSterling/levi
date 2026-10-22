#!/bin/sh
# Wraps the page source in a full HTML document for GitHub Pages.
set -e
cd "$(dirname "$0")/.."
{
  printf '<!doctype html>\n<html lang="en">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n'
  sed -n '1,/^<\/style>$/p' site/body.html | grep -v 'name="claude:'
  printf '</head>\n<body>\n'
  sed '1,/^<\/style>$/d' site/body.html
  printf '</body>\n</html>\n'
} > index.html
