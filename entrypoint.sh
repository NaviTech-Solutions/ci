#!/bin/sh                                  # 指定使用 `/bin/sh` 作為 Shell 解釋器。

MESSAGE=$1                                 # 將 Docker 容器傳入的第一個參數賦值給 `MESSAGE` 變數。
NAME=$2                                    # 將 Docker 容器傳入的第二個參數賦值給 `NAME` 變數。

echo "Message: $MESSAGE"                   # 輸出 `MESSAGE` 的內容。
echo "Hello, $NAME!"                       # 使用 `NAME` 變數輸出問候語。
