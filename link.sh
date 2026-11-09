#!/bin/bash
set -euo pipefail

# このスクリプトは dotfiles のルートに置かれている前提
REPO_ROOT="$(cd "$(dirname "$0")" && pwd)"

# リンク対象から除外するもの
# （link.sh 等ドット始まりでないファイルは下の .??* グロブで元々対象外）
EXCLUDES=(.git .github .gitignore .DS_Store)

for dotfile in "${REPO_ROOT}"/.??* ; do
    name="$(basename "$dotfile")"

    # 除外リストに含まれていればスキップ
    if [[ " ${EXCLUDES[*]} " == *" ${name} "* ]]; then
        continue
    fi

    target="${HOME}/${name}"

    # 既存の「実体」ファイル/ディレクトリ（シンボリックリンクでない）はバックアップ
    if [[ -e "$target" && ! -L "$target" ]]; then
        backup="${target}.backup.$(date +%Y%m%d%H%M%S)"
        mv "$target" "$backup"
        echo "backup: ${target} -> ${backup}"
    fi

    ln -fnsv "$dotfile" "$HOME"
done
