#!/usr/bin/env bashio

bashio::log.info "Event from spotifyd: ${PLAYER_EVENT} ${TRACK_ID} ${OLD_TRACK_ID-}"

case ${PLAYER_EVENT} in
  "play")
    data=$(bashio::var.json track_id "${TRACK_ID}")
    bashio::api.supervisor "POST" "/core/api/events/hassio_spotify_play" "${data}" ;;
  "change")
    data=$(bashio::var.json track_id "${TRACK_ID}" old_track_id "${OLD_TRACK_ID}")
    bashio::api.supervisor "POST" "/core/api/events/hassio_spotify_change" "${data}" ;;
  "stop")
    data=$(bashio::var.json track_id "${TRACK_ID}")
    bashio::api.supervisor "POST" "/core/api/events/hassio_spotify_stop" "${data}" ;;
esac
