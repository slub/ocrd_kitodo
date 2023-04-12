#!/usr/bin/env bash

#token to request pr informations
token=$1
if [[ -z "$token" ]]; then
    echo "Could not detect token parameter :("
    exit 1
fi

version=$2
if [[ -z "$version" ]]; then
    echo "Could not detect version parameter :("
    exit 2
fi

previousVersionRef=$(git rev-list --tags --max-count=1)
versionFromRef=$(git rev-list --children --reverse $previousVersionRef^.. | sed -n 1p | awk '{print $2}')
versionToRef=$(git rev-list --max-count=1 HEAD)

generate_changelog () {
    local path=$1
    local title="$2"
    local fromCommit="$3"
    local toCommit="$4"

    echo "### $title"
    echo ""
    git -C $path log  --pretty="%s" --grep="Merge pull request #" $fromCommit..$toCommit | while read -r line ; do
        #echo $line
        arr=($line)
        pull_request_id="${arr[3]:1}"
        repo="$5"

        # deprecated - support old prs of OCR-D Monitor because of moving to separate repository
        if [[ $repo == "slub/ocrd_monitor" && ( $pull_request_id == "45" || $pull_request_id == "44" || $pull_request_id == "37" || $pull_request_id == "36" ) ]]; then
            repo="slub/ocrd_manager"
        elif [[ $repo == "slub/ocrd_manager" && $pull_request_id == "1" ]]; then
            repo="slub/ocrd_monitor"
        fi

        url="https://github.com/$repo"

        #echo "curl -L -H Accept: application/vnd.github+json -H Authorization: Bearer $token  https://api.github.com/repos/$repo/pulls/$pull_request_id"
        curl -L -H "Accept: application/vnd.github+json" -H "Authorization: Bearer $token"  https://api.github.com/repos/$repo/pulls/$pull_request_id | \
        jq -r '[.title, .user.login] | @sh' | xargs printf "* %s by @%s in $url/pull/$pull_request_id\n"
    done
    echo ""
    echo "**Full Changelog**: [$fromCommit...$toCommit](https://github.com/$5/compare/$fromCommit...$toCommit)"
    echo ""
}


generate_submodule_changelog () {
    local module=$1
    local title=$2
    local fromCommit=$(git ls-tree $versionFromRef ./_modules/$module | awk '{print $3}')
    local toCommit=$(git ls-tree $versionToRef ./_modules/$module | awk '{print $3}')

    # deprecated because of moving OCR-D Monitor to separate repository
    if [[ $module == "ocrd_monitor" && -z "$fromCommit" ]]; then
        fromCommit=e9b41de42658f57361a0fe0ff56d673f225e4b4d
    fi

    generate_changelog "./_modules/$module" "$title" $fromCommit $toCommit slub/$module
}

(

echo "# Changelog"
echo ""
echo "## [$version](https://github.com/slub/ocrd_kitodo/releases/tag/$version)"
echo ""

generate_changelog "./" "Integration of OCR-D and Kitodo" $versionFromRef $versionToRef slub/ocrd_kitodo

generate_submodule_changelog ocrd_controller "OCR-D Controller"

generate_submodule_changelog ocrd_manager "OCR-D Manager"

generate_submodule_changelog ocrd_monitor "OCR-D Monitor"

generate_submodule_changelog kitodo-production-docker "Kitodo.Production Docker"

sed "/^[#] Changelog/d" CHANGELOG.md

) > CHANGELOG.md.tmp

mv CHANGELOG.md.tmp CHANGELOG.md
