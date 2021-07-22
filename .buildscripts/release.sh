echo Input version number using semantic versioning, e.g. '0.1.2'
read tag

echo Generating release notes...
echo Creating tag...
./.buildscripts/release-notes.sh | git tag -a $tag --file -

echo "Push release tag? [y/n]"
read push
if [[ $push == y* ]]; then
    echo "Pushing tag..."
    git push origin $tag
else
    echo "Skipped pushing tag."
fi
echo "All done!"
