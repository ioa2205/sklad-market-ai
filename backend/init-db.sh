#!/bin/bash
  set -e
  
  POSTGRES_USER="${POSTGRES_USER:-sklad_user}"
  
  databases=(
  "skalad_market_auth"
  "skalad_market_user"
  "skalad_market_company"
  "skalad_market_category"
  "skalad_market_product"
  "skalad_market_lead"
  "skalad_market_chat"
  "skalad_market_notification"
  "skalad_market_report"
  "skalad_market_file"
  )
  
  for db in "${databases[@]}"; do
echo "Creating database: $db"
  psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
  SELECT 'CREATE DATABASE $db' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = '$db')\gexec
EOSQL
  done
  
  echo "All databases created successfully!"