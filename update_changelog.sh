#!/usr/bin/env bash

version=$(date +'v%Y%m%d-stable')

#token to request pr informations
token=$1
if [[ -z "$token" ]];then
    echo "Could not detect token parameter version :("
    exit 1
fi


generate_changelog () {
    local path=$1
    local title="$2"
    local fromCommit="$3"
    local toCommit="$4"

    echo "### $title"
    echo ""
    git -C $path log  --pretty="%s" --grep="Merge pull request #" $fromCommit.. | while read -r line ; do
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

(

echo "# What's Changed"
echo ""
echo "## [$version](https://github.com/slub/ocrd_kitodo/releases/tag/$version)"
echo ""

generate_changelog "./" "Integration of OCR-D and Kitodo" 79bda3b2f33181d7f4fcd13f02b482f912078eef 7cad5d37963a288697ec172350885c55dd7b1d21 slub/ocrd_kitodo

generate_changelog "./_modules/ocrd_controller" "OCR-D Controller" d3c0192d96bd4e75eadf27d19d9ba9b08297cf41 fc1a599506aeb165aacefd82238ff2fa75a2a8c6 slub/ocrd_controller

generate_changelog "./_modules/ocrd_manager" "OCR-D Manager" daed8299411dfb4f3476c5d8ea602ab9ac20c3a4 a42880baa54e6cbcc2b0b3bb877e4ae9b182a72c slub/ocrd_manager

generate_changelog "./_modules/ocrd_monitor" "OCR-D Monitor" e9b41de42658f57361a0fe0ff56d673f225e4b4d 48bdc8212eabec84ee5b1d387a35ce616bfdd945 slub/ocrd_monitor

generate_changelog "./_modules/kitodo-production-docker" "Kitodo.Production Docker" 5ad3a5d0b47c558e64fb5523c1a16a30b0028901 97fca72a4a37dfb21eacd331e1febc986113939a slub/kitodo-production-docker

) > CHANGELOG.md.tmp
mv CHANGELOG.md.tmp CHANGELOG.md
