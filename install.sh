#!/bin/sh

# 스크립트의 절대 경로를 얻는다.
EXEC_FILE="$0"
BASE_NAME=`basename "$EXEC_FILE"`
if [ "$EXEC_FILE" = "./$BASE_NAME" ] || [ "$EXEC_FILE" = "$BASE_NAME" ]; then
        FULL_PATH=`pwd`
else
        FULL_PATH=`echo "$EXEC_FILE" | sed 's/'"${BASE_NAME}"'$//'`
        cd "$FULL_PATH"                 > /dev/null 2>&1
        FULL_PATH=`pwd`
fi

# 각종 폴더를 심볼릭 링크한다.
ln -s $FULL_PATH/.lein ~/
ln -s $FULL_PATH/.mplayer ~/

mkdir ~/.config/ 2>/dev/null
ln -s $FULL_PATH/fcitx ~/.config/
ln -s $FULL_PATH/xfce4 ~/.config/
