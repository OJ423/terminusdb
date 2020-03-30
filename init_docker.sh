#!/bin/sh
SERVER_MODE=${SERVER_MODE:-serve}
SERVER_NAME=${SERVER_NAME:-localhost}
ADMIN_PASS=${ADMIN_PASS:-root}
SERVER_PORT=${SERVER_PORT:-6363}
WORKERS=${WORKERS:-8}
PUBLIC_URL=${PUBLIC_URL:-false}
AUTOATTACH=${AUTOATTACH:-true}
AUTOLOGIN=${AUTOLOGIN:-false}
ENABLE_WELCOME=${ENABLE_WELCOME:-false}

echo "SERVER_MODE $SERVER_MODE"
echo "SERVER_NAME $SERVER_NAME"
echo "SERVER_PORT $SERVER_PORT"
echo "PUBLIC_URL $PUBLIC_URL"
echo "AUTO_ATTACH $AUTOATTACH"
echo "AUTO_LOGIN $AUTOLOGIN"
echo "ENABLE_WELCOME $ENABLE_WELCOME"

if [ ! -f /app/terminusdb/storage/prefix.db ] && [ "$ENABLE_WELCOME" = false ]; then
    /app/terminusdb/utils/db_util -s "$SERVER_NAME" -k "$ADMIN_PASS" --port "$SERVER_PORT" --workers "$WORKERS" --public_url "$PUBLIC_URL" --autologin="$AUTOLOGIN" --autoattach="$AUTOATTACH"
elif [ "$ENABLE_WELCOME" = false ]; then
    /app/terminusdb/utils/db_util -s "$SERVER_NAME" -k "$ADMIN_PASS" --port "$SERVER_PORT" --workers "$WORKERS" --public_url "$PUBLIC_URL" --autologin="$AUTOLOGIN" --autoattach="$AUTOATTACH" --only-config
fi

if [ "$ENABLE_WELCOME" = true ]; then
  echo "WELCOME SCREEN"  
  cd /app/terminusdb/utils && swipl welcome_screen.pl $SERVER_PORT
fi

/app/terminusdb/start.pl "$SERVER_MODE"

