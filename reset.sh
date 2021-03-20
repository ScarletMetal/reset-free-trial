#!/bin/sh

JETBRAINS_CONFIG_PATH="$HOME/.config/JetBrains"

# Resets evalution perioud for all versions of a given product
function reset_evaluation {
    for directory in $(find $JETBRAINS_CONFIG_PATH -name "$1*" -type d); do
        echo "removing $directory/options/other.xml"
        rm -rf "$directory/options/other.xml"

        echo "removing $directory/eval"
        rm -rf "$directory/eval"
    done
}


for product in IntelliJIdea PyCharm WebStorm CLion GoLand PhpStorm RubyMine Rider; do
    echo "Purgin evalution for $product"
    reset_evaluation $product
done

rm -rf "$HOME/.java/.userPrefs"
