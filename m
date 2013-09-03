From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 03 Sep 2013 16:29:04 +0000
Subject: build regressions 2013-09-03
Message-Id: <52260e50.tAbHIzfWlA/AigZv%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
sdr-msi3101.c:(.text+0x1f56cb): undefined reference to `vb2_vmalloc_memops'
usb.c:(.text+0xe6da9): undefined reference to `usb_kill_urb'
usb.c:(.text+0xe6dcc): undefined reference to `usb_free_urb'
usb.c:(.text+0xe6e2d): undefined reference to `usb_free_urb'
usb.c:(.text+0xe6e38): undefined reference to `usb_free_urb'
usb.c:(.text+0xe6e43): undefined reference to `usb_free_urb'
usb.c:(.text+0xe7087): undefined reference to `usb_submit_urb'
usb.c:(.text+0xe715c): undefined reference to `usb_submit_urb'
usb.c:(.text+0xe73e0): undefined reference to `usb_kill_urb'
usb.c:(.text+0xe73ef): undefined reference to `usb_kill_urb'
usb.c:(.text+0xe73fe): undefined reference to `usb_kill_urb'
usb.c:(.text+0xe745c): undefined reference to `usb_submit_urb'
usb.c:(.text+0xe7523): undefined reference to `usb_submit_urb'
usb.c:(.text+0xe77b4): undefined reference to `usb_submit_urb'
usb.c:(.text+0xe78e0): undefined reference to `usb_submit_urb'
usb.c:(.text+0xe79a8): undefined reference to `usb_alloc_urb'
usb.c:(.text+0xe79e4): undefined reference to `usb_free_urb'
usb.c:(.text+0xe7b78): undefined reference to `usb_submit_urb'
usb.c:(.text+0xe7f72): undefined reference to `usb_alloc_urb'
usb.c:(.text+0xe7f8c): undefined reference to `usb_alloc_urb'
usb.c:(.text+0xe7fad): undefined reference to `usb_alloc_urb'
usb.c:(.text+0xe8144): undefined reference to `usb_submit_urb'
(.text+0xe84c9): undefined reference to `usb_deregister'
(.text+0xe8500): undefined reference to `usb_register_driver'
arch/microblaze/kernel/timer.c:193:2: error: implicit declaration of function 'sched_clock' [-Werror=implicit-function-declaration]
arch/microblaze/kernel/timer.c:266:60: error: conflicting types for 'sched_clock'
drivers/input/touchscreen/pixcir_i2c_ts.c:492:22: error: 'const struct pixcir_i2c_chip_data' has no member named 'reportid_max'

[warnings]
Warning(drivers/regulator/core.c:3750): No description found for parameter 'dev'
Warning(drivers/regulator/core.c:3815): No description found for parameter 'dev'
Warning(drivers/regulator/core.c:3815): Excess function parameter 'regulator' description in 'devm_regulator_unregister'
drivers/infiniband/hw/ocrdma/ocrdma_verbs.c:1832:7: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/infiniband/hw/ocrdma/ocrdma_verbs.c:2661:64: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]

[sparse]
kernel/notifier.c:54:25: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct notifier_block *<noident> @@    got struct notifier_bstruct notifier_block *<noident> @@
net/socket.c:2584:17: sparse: incorrect type in argument 2 (different modifiers) @@    expected struct net_proto_family *<noident> @@    got structstruct net_proto_family *<noident> @@
net/802/stp.c:78:17: sparse: incorrect type in argument 2 (different modifiers) @@    expected struct stp_proto *<noident> @@    got structstruct stp_proto *<noident> @@
net/802/stp.c:80:17: sparse: incorrect type in argument 2 (different modifiers) @@    expected struct stp_proto *<noident> @@    got structstruct stp_proto *<noident> @@
net/bridge/br_multicast.c:268:17: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct net_bridge_port_group *<noident> @@    got struct net_bridgestruct net_bridge_port_group *<noident> @@
net/bridge/br_multicast.c:644:9: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct net_bridge_port_group *<noident> @@    got struct net_bridgestruct net_bridge_port_group *<noident> @@
net/wireless/reg.c:223:9: sparse: incorrect type in argument 2 (different modifiers) @@    expected struct ieee80211_regdomain *<noident> @@    got structstruct ieee80211_regdomain *<noident> @@
net/wireless/reg.c:1451:25: sparse: incorrect type in argument 2 (different modifiers) @@    expected struct ieee80211_regdomain *<noident> @@    got struct ieee80211_struct ieee80211_regdomain *<noident> @@
net/wireless/reg.c:1471:25: sparse: incorrect type in argument 2 (different modifiers) @@    expected struct ieee80211_regdomain *<noident> @@    got struct ieee80211_struct ieee80211_regdomain *<noident> @@
net/wireless/reg.c:2152:17: sparse: incorrect type in argument 2 (different modifiers) @@    expected struct ieee80211_regdomain *<noident> @@    got struct ieee80211_struct ieee80211_regdomain *<noident> @@
net/wireless/reg.c:2173:25: sparse: incorrect type in argument 2 (different modifiers) @@    expected struct ieee80211_regdomain *<noident> @@    got structstruct ieee80211_regdomain *<noident> @@
net/wireless/reg.c:2300:9: sparse: incorrect type in argument 2 (different modifiers) @@    expected struct ieee80211_regdomain *<noident> @@    got struct ieee80211_regdomain const *sstruct ieee80211_regdomain *<noident> @@
net/wireless/scan.c:675:17: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct cfg80211_bss_ies *<noident> @@    got struct cfg80211_bss_iesstruct cfg80211_bss_ies *<noident> @@
net/wireless/scan.c:710:25: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct cfg80211_bss_ies *<noident> @@    got struct cfg80211_bss_iesstruct cfg80211_bss_ies *<noident> @@
net/wireless/scan.c:713:25: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct cfg80211_bss_ies *<noident> @@    got struct cfg80211_bss_iesstruct cfg80211_bss_ies *<noident> @@
net/wireless/scan.c:744:25: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct cfg80211_bss_ies *<noident> @@    got struct cfg80211_bss_iesstruct cfg80211_bss_ies *<noident> @@
net/wireless/scan.c:749:33: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct cfg80211_bss_ies *<noident> @@    got struct cfg80211_bss_iesstruct cfg80211_bss_ies *<noident> @@
net/wireless/scan.c:760:33: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct cfg80211_bss_ies *<noident> @@    got struct cfg80211_bss_iesstruct cfg80211_bss_ies *<noident> @@
net/wireless/scan.c:808:33: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct cfg80211_bss_ies *<noident> @@    got struct cfg80211_bss_iesstruct cfg80211_bss_ies *<noident> @@
drivers/net/tun.c:419:17: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct tun_file *<noident> @@    got struct tun_file [struct tun_file *<noident> @@
net/decnet/dn_route.c:347:25: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct dn_route *<noident> @@    got struct dn_route [struct dn_route *<noident> @@
net/decnet/dn_route.c:361:9: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct dn_route *<noident> @@    got struct dn_route [struct dn_route *<noident> @@
net/ipv4/ip_vti.c:145:25: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct ip_tunnel *<noident> @@    got struct ip_tunnel struct ip_tunnel *<noident> @@
net/ipv4/ip_sockglue.c:272:25: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct ip_ra_chain *<noident> @@    got struct ip_ra_chaistruct ip_ra_chain *<noident> @@
net/ipv6/ip6_tunnel.c:247:25: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct ip6_tnl *<noident> @@    got struct ip6_tnl [nstruct ip6_tnl *<noident> @@
net/ipv6/ip6_gre.c:279:25: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct ip6_tnl *<noident> @@    got struct ip6_tnl [nstruct ip6_tnl *<noident> @@
net/ipv6/sit.c:160:25: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct ip_tunnel *<noident> @@    got struct ip_tunnel struct ip_tunnel *<noident> @@
net/mac80211/sta_info.c:77:17: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct sta_info *<noident> @@    got struct sta_info [struct sta_info *<noident> @@
net/mac80211/sta_info.c:87:17: sparse: incorrect type in argument 2 (different address spaces) @@    expected struct sta_info *<noident> @@    got struct sta_info [struct sta_info *<noident> @@
net/netfilter/nf_log.c:45:17: sparse: incorrect type in argument 2 (different modifiers) @@    expected struct nf_logger *<noident> @@    got structstruct nf_logger *<noident> @@
net/netfilter/nf_log.c:116:9: sparse: incorrect type in argument 2 (different modifiers) @@    expected struct nf_logger *<noident> @@    got structstruct nf_logger *<noident> @@
net/netfilter/nf_log.c:274:17: sparse: incorrect type in argument 2 (different modifiers) @@    expected struct nf_logger *<noident> @@    got struct nf_logger struct nf_logger *<noident> @@
net/netfilter/nf_queue.c:36:9: sparse: incorrect type in argument 2 (different modifiers) @@    expected struct nf_queue_handler *<noident> @@    got structstruct nf_queue_handler *<noident> @@
net/netfilter/nfnetlink.c:71:9: sparse: incorrect type in argument 2 (different modifiers) @@    expected struct nfnetlink_subsystem *<noident> @@    got structstruct nfnetlink_subsystem *<noident> @@
drivers/gpio/gpiolib.c:1767:12: sparse: context imbalance in 'gpiod_set_debounce' - different lock contexts for basic block

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
