#!/bin/bash
#mknod /dev/loop0 b 7 0
mkdir /mnt/iso1
[[ -f /iso/coreos-setup-template.iso ]] || wget -P /iso https://github.com/Cube-Earth/container-tools-coreos-setup-iso/releases/download/1.0/coreos-setup-template.iso
mount -o loop /iso/coreos-setup-template.iso /mnt/iso1
cp -R /mnt/iso1 /tmp_iso
mkdir /tmp_iso/profiles

ls -1 /profiles | sed 's/\.yaml$//g' | xargs -n1 -I{} ct -in-file "/profiles/{}.yaml" -out-file "/tmp_iso/profiles/{}.ign"
xorrisofs -V "COREOS SETUP" -follow-links -J -l -R -b boot/syslinux/isolinux.bin -c boot/syslinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o /iso/coreos-setup.iso /tmp_iso/ && isohybrid /iso/coreos-setup.iso
