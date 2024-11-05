#!/usr/bin/env bash

# start system if not already booted
virsh -c qemu:///system start macOS
# open console and block
virt-manager --no-fork -c qemu:///system --show-domain-console macOS
# once console is closed, gracefully shut down
virsh -c qemu:///system shutdown macOS
