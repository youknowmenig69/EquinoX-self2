LOG_STEP_IN "- Adding AI"
ADD_TO_WORK_DIR "pa3qxxx" "system" "system/priv-app/AICore" 0 0 755 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "pa3qxxx" "system" "system/priv-app/AiWallpaper" 0 0 755 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "pa3qxxx" "system" "system/priv-app/Moments" 0 0 755 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "pa3qxxx" "system" "system/priv-app/SamsungSmartSuggestions" 0 0 755 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "pa3qxxx" "system" "system/priv-app/PhotoEditor_AIFull" 0 0 755 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "pa3qxxx" "system" "system/app/SketchBook" 0 0 755 "u:object_r:system_file:s0"
SET_FLOATING_FEATURE_CONFIG "SEC_FLOATING_FEATURE_FRAMEWORK_SUPPORT_PERSONALIZED_DATA_CORE" "TRUE"
LOG_STEP_OUT

# Media Context Analyzer
LOG_STEP_IN "- Adding Media Context Analyzer feature"
ADD_TO_WORK_DIR "a56xnaxx" "system" "system/etc/mediacontextanalyzer/Detection.tflite" 0 0 644 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "a56xnaxx" "system" "system/etc/mediacontextanalyzer/human-pet-det_SR-V131.tflite" 0 0 644 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "a56xnaxx" "system" "system/etc/mediacontextanalyzer/human-pet-pose_SR-V200.tflite" 0 0 644 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "a56xnaxx" "system" "system/etc/mediacontextanalyzer/Keyword.tflite" 0 0 644 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "a56xnaxx" "system" "system/etc/mediacontextanalyzer/keyword-classification_SR-V031.tflite" 0 0 644 "u:object_r:system_file:s0"
EVAL "ln -s \"human-pet-pose_SR-V200.tflite\" \"$WORK_DIR/system/system/etc/mediacontextanalyzer/Pose.tflite\""
SET_METADATA "system" "system/etc/mediacontextanalyzer/Pose.tflite" 0 0 644 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "a56xnaxx" "system" "system/lib64/libcontextanalyzer_jni.media.samsung.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "a56xnaxx" "system" "system/lib64/libmediacontextanalyzer.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "a56xnaxx" "system" "system/lib64/libvideo-highlight-arm64-v8a.so" 0 0 644 "u:object_r:system_lib_file:s0"
SET_FLOATING_FEATURE_CONFIG "SEC_FLOATING_FEATURE_MMFW_CONFIG_MEDIA_CONTEXT_ANALYZER_CORE" "GPU"
SET_FLOATING_FEATURE_CONFIG "SEC_FLOATING_FEATURE_MMFW_SUPPORT_MEDIA_CONTEXT_ANALYZER" "TRUE"
LOG_STEP_OUT

# Audio eraser
LOG_STEP_IN "- Adding Audio eraser feature"
ADD_TO_WORK_DIR "pa2qxxx" "system" "system/etc/audio_ae_intervals.conf" 0 0 644 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "pa2qxxx" "system" "system/etc/fastScanner.tflite" 0 0 644 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "pa2qxxx" "system" "system/etc/mss_v0.13.0_4ch.sorione" 0 0 644 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "pa2qxxx" "system" "system/etc/public.libraries-audio.samsung.txt" 0 0 644 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "pa2qxxx" "system" "system/lib64/libmediasndk.mediacore.samsung.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "pa2qxxx" "system" "system/lib64/libmediasndk.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "pa2qxxx" "system" "system/lib64/libmultisourceseparator.audio.samsung.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "pa2qxxx" "system" "system/lib64/libmultisourceseparator.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "pa2qxxx" "system" "system/lib64/libsbs.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "pa2qxxx" "system" "system/lib64/libtensorflowlite_gpu_delegate.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "$([[ "$TARGET_OS_SINGLE_SYSTEM_IMAGE" == "mssi" ]] && echo "gts11xx" || echo "pa2qxxx")" \
    "system" "system/lib64/libveframework.videoeditor.samsung.so" 0 0 644 "u:object_r:system_lib_file:s0"
SET_FLOATING_FEATURE_CONFIG "SEC_FLOATING_FEATURE_AUDIO_CONFIG_MULTISOURCE_SEPARATOR" "{FastScanning_6, SourceSeparator_4, Version_1.3.0}"
LOG_STEP_OUT


