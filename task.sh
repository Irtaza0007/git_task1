
#!/bin/bash

echo "Script Name: $0"

# Take commit message
echo "Enter commit message:"
read commit_var

# Count words in commit message
word_count=$(echo "$commit_var" | wc -w)

# First if condition: validate message
if [ "$word_count" -lt 2 ]; then
    echo "Please add meaningful message"
    result="FAILED"

else
    # Nested if: run git add
    git add .
    if [ $? -ne 0 ]; then
        result="FAILED"

    else
        # Nested if: run git commit
        git commit -m "$commit_var"
        if [ $? -ne 0 ]; then
            result="FAILED"

        else
            # Nested if: run git push
            git push
            if [ $? -ne 0 ]; then
                result="FAILED"
            else
                result="SUCCESS"
            fi
        fi
    fi
fi

echo "-------------------------"
echo "Script Result: $result"
echo "Executed by user: $(whoami)"
