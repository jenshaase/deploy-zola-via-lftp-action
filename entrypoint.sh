#!/bin/sh -l
zola build || exit 1

lftp -f "
open -u $INPUT_FTP_USERNAME,$INPUT_FTP_PASSWORD -p $INPUT_FTP_PORT -e ls $INPUT_FTP_HOST || exit 1
mirror --reverse --delete --depth-first --overwrite --verbose $INPUT_ZOLA_BUILD_DIR $INPUT_REMOTE_TARGET_DIR || exit 1
bye
" || exit 1
