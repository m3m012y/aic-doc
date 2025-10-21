##############################
## Ubuntu 22.04
##############################
modprobe binder_linux devices="binder,hwbinder,vndbinder"
### optional module (removed since 5.18)
modprobe ashmem_linux
modprobe mac80211_hwsim
