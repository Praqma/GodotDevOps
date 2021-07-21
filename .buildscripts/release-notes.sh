# This script generates release notes from the current HEAD to the latest tag.
# It is rather primitive, relying on formatting conventions in the commit history.

# Example commit message:
#   Tweak squid positions
#
#   I moved the squids a little higher so the
#   player can dash underneath them if they're
#   quick enough. That should do it for now.
#
#   Fix #32> New enemy: Killer squids now patrol level 2!

# Example usage:
#   ./release-notes

# Example output:
#   - New enemy: Killer squids now patrol level 2! (#32)

# ----------

# Used to match commit message lines relevant to release note generation
# e.g. "Fixes #24> Add a shiny new weapon" or "Fix #12> Fixed a crash that occurred when eating"
MATCH_ENTRY_LINE="*Fix(es)? #[[:digit:]]+>"
# Used to capture the release note message and issue number to format later
# e.g. #Fixes #30> Increase character speed by 25%
# Group 1: "#30"
# Group 2: "Increase character speed by 25%"
CAPTURE_ENTRY_INFO="^ *Fixe\?s\? \(#[[:digit:]]\+\) \?> \?\(.*\)"
# Used to format the previously captured data
# e.g. "- Increase character speed by 25% (#30)"
FORMAT_ENTRY_INFO="- \2 (\1)"

# 1) Print the log from the last tag until now
# 2) Find all relevant lines,
# 3) sed wizardry
# 4) Sort the entries alphabetically
git log $(git describe --abbrev=0)..HEAD | \
    grep -E "$MATCH_ENTRY_LINE" | \
    sed -e "s/$CAPTURE_ENTRY_INFO/$FORMAT_ENTRY_INFO/g" | \
    sort