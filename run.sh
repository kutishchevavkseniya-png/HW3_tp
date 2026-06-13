#!/bin/sh

set -eu

project_direction="$(cd "$(dirname "$0")" && pwd)"
data_direction="$project_direction/data"

generator_image_name="tp-generator"
reporter_image_name="tp-reporter"

mkdir -p "$data_direction"

case "${1:-}" in
  build_generator)
    docker build -t "$generator_image_name" "$project_direction/generator"
    ;;

  run_generator)
    docker run --rm -v "$data_direction:/data" "$generator_image_name"
    ;;

  build_reporter)
    docker build -t "$reporter_image_name" "$project_direction/reporter"
    ;;

  run_reporter)
    docker run --rm -v "$data_direction:/data" "$reporter_image_name"
    ;;

  structure)
    find "$project_direction" -maxdepth 3 -print
    ;;

  clear_data)
    find "$data_direction" -type f -delete
    ;;

  inside_generator)
    docker run --rm -v "$data_direction:/data" "$generator_image_name" sh
    ;;

  inside_reporter)
    docker run --rm -v "$data_direction:/data" "$reporter_image_name" sh
    ;;

  *)
    echo "Использование: ./run.sh <command>"
    echo "Команды:"
    echo "  build_generator"
    echo "  run_generator"
    echo "  build_reporter"
    echo "  run_reporter"
    echo "  structure"
    echo "  clear_data"
    echo "  inside_generator"
    echo "  inside_reporter"
    exit 1
    ;;
esac