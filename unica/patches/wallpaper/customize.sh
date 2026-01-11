# [
COMPRESS_WEBP()
{
    local FILE="$1"
    local FILE_PATH
    local FILE_NAME
    local RES="2400"
    local CMD

    FILE_PATH="$(dirname "$FILE")"
    FILE_NAME="$(basename "$FILE")"
    RES="3088"

    LOG "- Compressing $FILE_NAME"

    CMD="cwebp"
    CMD+=" -q 100"
    CMD+=" -resize $RES $RES"
    CMD+=" \"$FILE_PATH/$FILE_NAME\""
    CMD+=" -o \"$FILE_PATH/temp.webp\""

    EVAL "$CMD" || return 1
    EVAL "mv -f \"$FILE_PATH/temp.webp\" \"$FILE_PATH/$FILE_NAME\"" || return 1
}

ENCODE_MP4()
{
    local FILE="$1"
    local FILE_PATH
    local FILE_NAME
    local RES="-1:2400"
    local CMD

    FILE_PATH="$(dirname "$FILE")"
    FILE_NAME="$(basename "$FILE")"

    if $TARGET_COMMON_SUPPORT_DYN_RESOLUTION_CONTROL; then
        RES="1440:-1"
    fi

    LOG "- Encoding $FILE_NAME"

    CMD="ffmpeg"
    CMD+=" -i \"$FILE_PATH/$FILE_NAME\""
    CMD+=" -c:v libx264 -c:a copy"
    CMD+=" -pix_fmt yuv420p -crf 18 -g 1"
    CMD+=" -preset veryslow -tune zerolatency"
    CMD+=" -movflags use_metadata_tags -map_metadata 0"
    CMD+=" -vf \"fps=60,scale=$RES,setsar=1:1\""
    CMD+=" -video_track_timescale 360000 -movie_timescale 90000"
    CMD+=" \"$FILE_PATH/temp-$FILE_NAME.mp4\""

    EVAL "$CMD" || return 1
    EVAL "mv -f \"$FILE_PATH/temp-$FILE_NAME.mp4\" \"$FILE_PATH/$FILE_NAME\"" || return 1
}
# ]

WALLPAPER_APK="https://github.com/youknowmenig69/Equinox-ROM-ui8/releases/download/v3.0/wallpaper-res.apk"
WALLPAPER_PATH="system/priv-app/wallpaper-res/wallpaper-res.apk"
DOWNLOAD_FILE "$WALLPAPER_APK" "$WORK_DIR/system/$WALLPAPER_PATH"
DECODE_APK "system" "system/priv-app/wallpaper-res/wallpaper-res.apk"
for f in "$APKTOOL_DIR/system/priv-app/wallpaper-res/wallpaper-res.apk/res/drawable-nodpi/dex_wallpaper_"*.webp; do
    COMPRESS_WEBP "$f"
done
for f in "$APKTOOL_DIR/system/priv-app/wallpaper-res/wallpaper-res.apk/res/drawable-nodpi/Wallpaper_"*.webp; do
    COMPRESS_WEBP "$f"
done
for f in "$APKTOOL_DIR/system/priv-app/wallpaper-res/wallpaper-res.apk/res/raw/E3_Infinite_Video_Wallpaper_"*.mp4; do
    ENCODE_MP4 "$f" &
done


# shellcheck disable=SC2046
wait $(jobs -p) || return 1


unset -f ENCODE_MP4 COMPRESS_WEBP
