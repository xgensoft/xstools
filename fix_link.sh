#!/bin/bash

ONELINES=()
while IFS=  read -r -d $'\0'; do
    ONELINES+=("$REPLY")
done < <(find . -name "*" -not -name "*.o" -not -name "*.css" -type f -path *bin* -exec awk 'END { if (NR == 1) printf("%s%c", FILENAME, 0) }' {} \;)

while IFS=  read -r -d $'\0'; do
    ONELINES+=("$REPLY")
done < <(find . -name "*" -not -name "*.o" -not -name "*.gif" -not -name "*.css" -type f -path *lib* -exec awk 'END { if (NR == 1) printf("%s%c", FILENAME, 0) }' {} \;)

for FILENAME in "${ONELINES[@]}"
do
    echo -e "check '$FILENAME'"
    VALUE=$(cat $FILENAME)
    if [[ $VALUE = *[[:ascii:]]* ]]; then
	if [[ $VALUE != "INPUT("* ]]; then
	    if [[ $VALUE != /* ]]; then
		DIRNAME="$(dirname "${FILENAME}")"
		if [ -f "$DIRNAME/$VALUE" ]; then
		    echo "$FILENAME -> $VALUE is valid"
		    ln -rfs $DIRNAME/$VALUE $FILENAME
		    echo -e "replaced\n"
		fi
	    fi
	fi
    fi
done

