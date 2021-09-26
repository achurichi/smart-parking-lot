#!/usr/bin/env bash

cd $(dirname "$0")
zip -r backups/db-backup_$(date +"%Y-%m-%d_%H-%M-%S").zip ../.db-data ../.db-images