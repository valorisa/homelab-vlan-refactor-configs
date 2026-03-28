# Checklist de Migration - Homelab VLAN Refactor

## Pré-requis
- [ ] Backup config Fortinet effectué
- [ ] Backup config Cisco effectué (`copy run tftp`)
- [ ] Console physique accessible (câble RJ45-USB)
- [ ] Câble de secours VLAN 1 prêt (port recovery Fortinet)
- [ ] VM Windows Server 2022 prête (DHCP/DNS/AD)

## Phase 1 - Hardware
- [ ] Carte LSI 9300-8i installée avec ventilo
- [ ] NVMe 2 To installé et vissé correctement
- [ ] Copie `dd` effectuée sans erreur
- [ ] Resize LVM validé (`pvresize`, `lvextend`)

## Phase 2 - Réseau
- [ ] LAG Up sur Fortinet (`get system interface`)
- [ ] LAG Up sur Cisco (`show etherchannel summary`)
- [ ] VLANs trunk vérifiés (`show interfaces trunk`)
- [ ] Ping Gateway .254 OK depuis chaque VLAN

## Phase 3 - Services
- [ ] DHCP Relay actif sur Fortinet
- [ ] Étendues DHCP créées sur WS2022
- [ ] Réservations DHCP configurées (AP, Switch, NAS)

## Phase 4 - WiFi
- [ ] Contrôleur UniFi on-prem déployé
- [ ] 4x U7 Lite adoptés
- [ ] PPSK testé (2 SSID, mots de passe différents)
- [ ] Handover WiFi validé (déplacement physique)

## Phase 5 - Sauvegardes
- [ ] QNAP connecté en 10 Gb/s
- [ ] Script Rsync testé manuellement
- [ ] Débit > 500 Mo/s validé
- [ ] Shutdown QNAP post-backup fonctionnel

## Phase 6 - Validation Finale
- [ ] Test débit 10 Gb/s (`iperf3 -c 10.20.10.10`)
- [ ] MDNS Spotify Connect fonctionnel (VLAN Admin → VLAN PC)
- [ ] Tous les IoT migrés vers VLAN 100
- [ ] VLAN 1000 vidé (plus aucun appareil)
- [ ] Dashboard UniFi : 0 alerte critique

## Notes
> Date de migration : _______________
> Technicien : _______________
> Temps total : _______________
