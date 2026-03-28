#!/bin/bash
# rsync-backup.sh - Sauvegarde TrueNAS vers QNAP avec shutdown auto
# Projet : homelab-vlan-refactor-configs
# Source : Transcription iMot3k - VLAN Grand Remplacement

SOURCE="/mnt/pool/data/"
DEST="admin@10.20.10.10:/backup/"
LOG="/var/log/rsync-qnap.log"

echo "$(date) - Début Rsync TrueNAS -> QNAP" >> $LOG
rsync -avh --progress $SOURCE $DEST >> $LOG 2>&1

if [ $? -eq 0 ]; then
    echo "$(date) - Rsync terminé avec succès" >> $LOG
    echo "$(date) - Extinction du QNAP en cours..." >> $LOG
    ssh admin@10.20.10.10 "/sbin/shutdown -h now"
else
    echo "$(date) - ERREUR Rsync - Code: $?" >> $LOG
    exit 1
fi
