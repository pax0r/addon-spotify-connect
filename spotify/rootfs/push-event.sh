#!/usr/bin/with-contenv bashio

bashio::log.info "Event from spotifyd: ${PLAYER_EVENT} ${TRACK_ID} ${OLD_TRACK_ID}"

case ${PLAYER_EVENT} in
  "play")
    bashio::api.supervisor "POST" "/api/events/hassio_spotify_play" "{\"track_id\": \"${TRACK_ID}\"}" ;;
  "change")
    bashio::api.supervisor "POST" "/api/events/hassio_spotify_change" "{\"track_id\": \"${TRACK_ID}\", \"old_track_id\": \"${OLD_TRACK_ID}\"}" ;;
  "stop")
    bashio::api.supervisor "POST" "/api/events/hassio_spotify_stop" "{\"track_id\": \"${TRACK_ID}\"}" ;;
esac
