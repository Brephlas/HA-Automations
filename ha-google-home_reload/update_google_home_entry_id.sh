#!/bin/bash
#
entry_id=`jq -r '.data.entries[] | select(.domain=="google_home") | .entry_id' /homeassistant/.storage/core.config_entries`
/usr/bin/curl -s -X POST -H "Authorization: Bearer <LONG-LIVING-TOKEN>" \
        -H "Content-Type: application/json" -d "$(jq -n --arg var "$entry_id" '.state = $var')" \
  http://homeassistant.local:8123/api/states/input_text.google_home_entry_id >/dev/null
