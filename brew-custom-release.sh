#! /usr/bin/env bash
# Exit on error
set -e
set -x

if [[ $# != 4 ]]; then
    echo 'Error: Incorrect arguments!!!' >&2
    echo 'usage: brew-custom-release <formulae_path> <program_name> <version> <installation_file>' 
    exit 1
fi


formulae_path="$1"
program_name="$2"
version="$3"
installation_file="$4"

formulae_file=$(basename -- "$formulae_path")
formulae_name="${formulae_file%.*}"
installation_filename=$(basename -- "$installation_file")

github_release_download="https://github.com/letuanhai/homebrew-tap/releases/download"

# Replace download URL
tag_name="${program_name}-${version}"
download_url="${github_release_download}/${tag_name}/${installation_file}"
sed -i 's|^\s*sha256.*|  sha256 :no_check|' "${formulae_path}"
sed -i "s|^\s*url.*|  url \"${download_url}\", verified: \"github.com/letuanhai/homebrew-tap/\"|" "${formulae_path}"

# Audit formulae
brew audit --strict "letuanhai/tap/${formulae_name}"
brew style "letuanhai/tap/${formulae_name}"

# Commit formuale
[[ $(git diff --cached | wc -l) -ne 0 ]] && { echo "Git index is not clean!!!" >&2; exit 1; }
git add "${formulae_path}"
[[ $(git diff --cached | wc -l) -eq 0 ]] || git commit -m "Add $tag_name"

# Create tag and push
git tag --force "$tag_name"
git push origin && git push --tags origin

# Create release
github-release release --user letuanhai --repo homebrew-tap --tag "$tag_name" --name "$tag_name"
github-release upload --user letuanhai --repo homebrew-tap --tag "$tag_name" --file "$installation_file" --name "$installation_filename"

