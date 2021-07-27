echo Input version number using semantic versioning, e.g. '0.1.2'
read tag

# Gets the working directory of the file to use when calling release-notes.sh
wd="$( cd "$( dirname "$0" )" && pwd )"
echo Generating release notes...
echo Creating tag...
$wd/release-notes.sh | git tag -a $tag --file -

echo "Push release tag? [y/n]"
read push
if [[ $push == y* ]]; then
    echo "Pushing tag..."
    git push origin $tag
else
    echo "Skipped pushing tag."
fi
echo "All done!"
