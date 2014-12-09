echo GRUB_CMDLINE_LINUX=\"cgroup_enable=memory swapaccount=1\" >>/etc/default/grub
update-grub
