#!/bin/bash
set -euo pipefail
cd -- "$(dirname -- "$0")"
command -v gh >/dev/null || { echo 'Instala GitHub CLI desde https://cli.github.com/ y vuelve a ejecutar este archivo.'; exit 1; }
if ! gh auth status >/dev/null 2>&1; then gh auth login --hostname github.com --web --git-protocol https; fi
LOGIN="$(gh api user --jq .login)"
if [ "$LOGIN" != 'LordJeferies' ]; then echo 'Inicia sesión en GitHub CLI como LordJeferies y vuelve a ejecutar este archivo.'; exit 1; fi
if ! gh repo view LordJeferies/abraxasxferreksa0 >/dev/null 2>&1; then
 gh repo create LordJeferies/abraxasxferreksa0 --public --description 'FerreKsa: herramientas, materiales y cotizaciones'
fi
if [ ! -d .git ]; then git init -b main; fi
git add index.html styles.css motion.js assets .nojekyll README.md publicar.command
if ! git diff --cached --quiet; then git -c user.name='LordJeferies' -c user.email='285246965+LordJeferies@users.noreply.github.com' commit -m 'Publicar landing FerreKsa'; fi
if git remote get-url origin >/dev/null 2>&1; then
 REMOTE="$(git remote get-url origin)"
 case "$REMOTE" in 'https://github.com/LordJeferies/abraxasxferreksa0.git'|'git@github.com:LordJeferies/abraxasxferreksa0.git') ;; *) echo 'El repositorio local apunta a otro destino. Revisa origin antes de publicar.'; exit 1;; esac
else
 git remote add origin https://github.com/LordJeferies/abraxasxferreksa0.git
fi
gh auth setup-git
git push -u origin HEAD:main
if ! gh api repos/LordJeferies/abraxasxferreksa0/pages >/dev/null 2>&1; then
 printf '%s\n' '{"build_type":"legacy","source":{"branch":"main","path":"/"}}' | gh api --method POST repos/LordJeferies/abraxasxferreksa0/pages --input -
else
 printf '%s\n' '{"build_type":"legacy","source":{"branch":"main","path":"/"}}' | gh api --method PUT repos/LordJeferies/abraxasxferreksa0/pages --input -
fi
echo 'GitHub Pages configurado. La publicación puede tardar unos minutos.'
echo 'Comprueba el despliegue en GitHub > Settings > Pages.'
echo 'URL prevista: https://lordjeferies.github.io/abraxasxferreksa0/'
