#!/bin/sh
. /usr/share/libubox/jshn.sh

boardcfg=$(ubus call system board)
yggcfg=$(yggdrasil -genconf -json | grep NodeInfo -v)

# ---

json_load "$boardcfg"
json_get_var kernel     kernel
json_get_var hostname   hostname
json_get_var system     system
json_get_var model      model
json_get_var board_name board_name

# ---


json_load "$yggcfg"
json_add_string "IfName" "ygg0"
json_add_object "NodeInfo"
json_add_string "kernel"      "$kernel"
json_add_string "hostname"    "$hostname"
json_add_string "system"      "$system"
json_add_string "model"       "$model"
json_add_string "board_name"  "$board_name"
json_close_object

# ---

json_dump

