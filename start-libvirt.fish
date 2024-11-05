#!/usr/bin/env fish

set CURRENT_STATE (virsh -c qemu:///system list --all | grep macOS | awk '{print $3}')

if test $CURRENT_STATE = "paused"
    virsh -c qemu:///system resume macOS
else
    virsh -c qemu:///system start macOS
end

# open console and block
virt-manager --no-fork -c qemu:///system --show-domain-console macOS

set CURRENT_STATE (virsh -c qemu:///system list --all | grep macOS | awk '{print $3}')
# once console is closed, pause machine
if test $CURRENT_STATE = "running"
    virsh -c qemu:///system suspend macOS
end
