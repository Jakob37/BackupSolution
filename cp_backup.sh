#!/bin/bash


my_dir="$(dirname "$0")"
script_name="$(basename "$0")"
source_path="${my_dir}/${script_name%.*}.conf"
echo "Loading parameters from: ${source_path}"
source ${source_path}

from_base=${from_base_conf}
to_base="${to_base_conf}/$(date +%y%m%d)"
dirs=${dirs_conf}

echo "Copying from: ${from_base}"
echo "Copying to: ${to_base}"
echo "Copying folders: ${dirs}"

echo "Will transfer following folders"
for dir in ${dirs}; do
    from_path="${from_base}/${dir}"
    size=$(du -sh "${from_path}" | cut -f1)
    echo -e "${dir}\t${size}"
done

for dir in ${dirs}; do

    from_path="${from_base}/${dir}"
    to_path="${to_base}/${dir}"
    command="cp --verbose -u ${from_path} ${to_path}"

    size=$(du -sh ${from_path} | cut -f1)
    echo "Command executed at $(date), size: ${size}"
    echo ${command}
done


