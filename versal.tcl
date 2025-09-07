connect
targets -set -nocase -filter {name =~ "*PMC*"}
puts stderr "INFO: Downloading BIN file: /home/kelvin/work/TE0950_trial0/versal_trial_0/images/linux/BOOT.BIN to the target."
device program "/home/kelvin/work/TE0950_trial0/versal_trial_0/images/linux/BOOT.BIN"
targets -set -nocase -filter {name =~ "*A72*#0"}
stop

targets -set -nocase -filter {name =~ "*Versal*"}
puts stderr "INFO: Loading image: /home/kelvin/work/TE0950_trial0/versal_trial_0/images/linux/Image at 0x200000."
dow -data -force "/home/kelvin/work/TE0950_trial0/versal_trial_0/images/linux/Image" 0x200000

puts stderr "INFO: Loading image: /home/kelvin/work/TE0950_trial0/versal_trial_0/images/linux/rootfs.cpio.gz.u-boot at 0x4000000."
dow -data -force "/home/kelvin/work/TE0950_trial0/versal_trial_0/images/linux/rootfs.cpio.gz.u-boot" 0x4000000

puts stderr "INFO: Loading image: /home/kelvin/work/TE0950_trial0/versal_trial_0/images/linux/boot.scr at 0x20000000."
dow -data -force "/home/kelvin/work/TE0950_trial0/versal_trial_0/images/linux/boot.scr" 0x20000000
targets -set -nocase -filter {name =~ "*A72*#0"}
con
exit
puts stderr "INFO: Saving XSDB commands to /home/kelvin/work/TE0950_trial0/versal_trial_0/versal.tcl."
puts stderr "INFO: You can run 'xsdb /home/kelvin/work/TE0950_trial0/versal_trial_0/versal.tcl' to execute."