#!/usr/bin/env bash

[ ! -d "${HOME}/qemu-errors" ] && mkdir  "${HOME}/qemu-errors"

qemu-system-x86_64 \
  -enable-kvm \
  -m 16G \
  -cpu host \
	-smp $(nproc) \
	-chardev qemu-vdagent,id=ch1,name=vdagent,clipboard=on \
  -device virtio-serial-pci \
  -device virtserialport,chardev=ch1,id=ch1,name=com.redhat.spice.0\
  -drive file=/media/hsacr/ce76293a-4d42-4ec2-b267-0a6addc3c73f/mount/arch.qcow2,format=qcow2 \
  -boot c \
  -display gtk \
	-net nic -net user,hostfwd=tcp::2222-:22 2>> "${HOME}/qemu-errors/$(date | tr ' ' '_')" \
	-device ich9-intel-hda,addr=1f.1 \
 -audiodev pa,id=snd0 \
 -device hda-output,audiodev=snd0 \

