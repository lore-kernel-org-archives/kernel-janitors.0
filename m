From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 31 Aug 2013 16:52:42 +0000
Subject: build regressions 2013-08-31
Message-Id: <52221f5a.OU3Nwoa3xUyw7kOU%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
include/linux/percpu_ida.h:30:2: error: unknown type name 'cpumask_t'
sysctl_net.c:(.text+0x263f8): undefined reference to `default_qdisc_ops'
sysctl_net.c:(.text+0x26bbc): undefined reference to `default_qdisc_ops'
dns_query.c:(.text+0x2f394): undefined reference to `default_qdisc_ops'
dns_query.c:(.text+0x2fd30): undefined reference to `default_qdisc_ops'
include/linux/percpu_ida.h:30: error: expected specifier-qualifier-list before 'cpumask_t'
net-sysfs.c:(.text+0x1c458): undefined reference to `default_qdisc_ops'
net-sysfs.c:(.text+0x1c838): undefined reference to `default_qdisc_ops'
net/sched/sch_mq.c:(.text+0x20af6): undefined reference to `default_qdisc_ops'
net/sched/sch_mq.c:(.text+0x20b00): undefined reference to `default_qdisc_ops'
bus.c:(.text+0x9dd): multiple definition of `virtfn_release'
drivers/pci/access.o:access.c:(.text+0x252c): first defined here
probe.c:(.text+0x158d): multiple definition of `virtfn_release'
drivers/pci/access.o:access.c:(.text+0x252c): first defined here
host-bridge.c:(.text+0x2aa): multiple definition of `virtfn_release'
drivers/pci/access.o:access.c:(.text+0x252c): first defined here
remove.c:(.text+0x412): multiple definition of `virtfn_release'
drivers/pci/access.o:access.c:(.text+0x252c): first defined here
pci.c:(.text+0x6c12): multiple definition of `virtfn_release'
drivers/pci/access.o:access.c:(.text+0x252c): first defined here
pci-driver.c:(.text+0x15c0): multiple definition of `virtfn_release'
drivers/pci/access.o:access.c:(.text+0x252c): first defined here
search.c:(.text+0xb40): multiple definition of `virtfn_release'
drivers/pci/access.o:access.c:(.text+0x252c): first defined here
pci-sysfs.c:(.text+0x2634): multiple definition of `virtfn_release'
drivers/pci/access.o:access.c:(.text+0x252c): first defined here
rom.c:(.text+0x300): multiple definition of `virtfn_release'
drivers/pci/access.o:access.c:(.text+0x252c): first defined here
setup-res.c:(.text+0x540): multiple definition of `virtfn_release'
drivers/pci/access.o:access.c:(.text+0x252c): first defined here
setup-bus.c:(.text+0x1c72): multiple definition of `virtfn_release'
drivers/pci/access.o:access.c:(.text+0x252c): first defined here
slot.c:(.text+0xcea): multiple definition of `virtfn_release'
drivers/pci/access.o:access.c:(.text+0x252c): first defined here
quirks.c:(.text+0x5566): multiple definition of `virtfn_release'
drivers/pci/access.o:access.c:(.text+0x252c): first defined here
pci-acpi.c:(.text+0x6a2): multiple definition of `virtfn_release'
drivers/pci/access.o:access.c:(.text+0x252c): first defined here
pci-label.c:(.text+0x844): multiple definition of `virtfn_release'
drivers/pci/access.o:access.c:(.text+0x252c): first defined here
of.c:(.text+0x0): multiple definition of `virtfn_release'
drivers/pci/access.o:access.c:(.text+0x252c): first defined here
sch_generic.c:(.text+0x68388): undefined reference to `default_qdisc_ops'
sch_mq.c:(.text+0x69300): undefined reference to `default_qdisc_ops'
(.text+0x44d39): undefined reference to `default_qdisc_ops'
include/linux/extcon.h:245:1: error: expected identifier or '(' before '{' token
(.text+0x592df): undefined reference to `first_system_vector'
(.text+0x592eb): undefined reference to `first_system_vector'
nouveau_drm.c:(.text+0x29b279): undefined reference to `nouveau_switcheroo_optimus_dsm'
drivers/pci/pcie/aer/aerdriver.o:(.text+0x1a70): first defined here
drivers/pci/hotplug/pci_hotplug_core.o:(.text+0x940): first defined here
drivers/pci/pcie/portdrv_core.o:(.text+0x240): first defined here
net/sched/sch_fq.c:491:2: error: implicit declaration of function 'prefetch' [-Werror=implicit-function-declaration]
net/sched/sch_mq.o:(.text+0x355e8): undefined reference to `default_qdisc_ops'
(.text.dev_activate+0x104): undefined reference to `default_qdisc_ops'
(.text.dev_activate+0x164): undefined reference to `default_qdisc_ops'
(.text.dev_activate+0x194): undefined reference to `default_qdisc_ops'
(.text.mq_init+0xa8): undefined reference to `default_qdisc_ops'
(.text.mq_init+0xbc): undefined reference to `default_qdisc_ops'
net/built-in.o:(.toc+0x0): undefined reference to `default_qdisc_ops'
net/built-in.o:(.toc+0x8): undefined reference to `default_qdisc_ops'
arch/s390/mm/page-states.c:104:51: error: 'struct free_list' has no member named 'next'
drivers/pci/access.o:(.text+0x1760): first defined here
drivers/pci/access.o:(.text+0x1760): first defined here
drivers/pci/access.o:(.text+0x1760): first defined here
drivers/pci/access.o:(.text+0x1760): first defined here
drivers/pci/access.o:(.text+0x1760): first defined here
drivers/pci/access.o:(.text+0x1760): first defined here
drivers/pci/access.o:(.text+0x1760): first defined here
drivers/pci/access.o:(.text+0x1760): first defined here
drivers/pci/access.o:(.text+0x1760): first defined here
drivers/pci/access.o:(.text+0x1760): first defined here
drivers/pci/access.o:(.text+0x1760): first defined here
drivers/pci/access.o:(.text+0x1760): first defined here
drivers/pci/access.o:(.text+0x1760): first defined here
drivers/pci/access.o:(.text+0x1760): first defined here
drivers/pci/access.o:(.text+0x1760): first defined here
drivers/pci/access.o:(.text+0x1760): first defined here
drivers/pci/hotplug/pci_hotplug_core.o:pci_hotplug_core.c:(.text+0x360): first defined here
drivers/pci/hotplug/shpchp_ctrl.o:shpchp_ctrl.c:(.text+0xfc0): first defined here
drivers/pci/pcie/portdrv_core.o:portdrv_core.c:(.text+0x1c0): first defined here
drivers/pci/hotplug/pciehp_ctrl.o:pciehp_ctrl.c:(.text+0x460): first defined here
drivers/pci/hotplug/pciehp_ctrl.o:pciehp_ctrl.c:(.text+0x460): first defined here
net-procfs.c:(.text+0x1a8dc): undefined reference to `default_qdisc_ops'

[warnings]
net/sched/sch_mqprio.c:128:8: warning: passing argument 2 of 'qdisc_create_dflt' discards 'const' qualifier from pointer target type [enabled by default]
net/sched/sch_generic.c:691:8: warning: passing argument 2 of 'qdisc_create_dflt' discards 'const' qualifier from pointer target type [enabled by default]
net/sched/sch_mq.c:61:8: warning: passing argument 2 of 'qdisc_create_dflt' discards 'const' qualifier from pointer target type [enabled by default]
sound/soc/codecs/wm8904.c:1205:2: warning: passing argument 1 of 'snd_soc_dapm_new_widgets' from incompatible pointer type [enabled by default]
arch/x86/xen/enlighten.c:1331:17: warning: unused variable 'dummy' [-Wunused-variable]
drivers/regulator/da9063-regulator.c:854:6: warning: 'da9063_reg_matches' may be used uninitialized in this function [-Wmaybe-uninitialized]
mm/page_alloc.c:1637:13: warning: 'change_pageblock_range' defined but not used
arch/s390/mm/page-states.c:104:61: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/net/ethernet/sfc/mcdi.c:960:1: warning: 'efx_mcdi_print_fwver' uses dynamic stack allocation [enabled by default]
WARNING: mm/built-in.o(.text.unlikely+0xbc3): Section mismatch in reference from the function alloc_usemap_and_memmap() to the function .init.text:init_frontswap()

[sparse]
drivers/staging/lustre/lustre/ptlrpc/sec_bulk.c:126:11: sparse: symbol 'pools_shrinker_seeks' was not declared. Should it be static?
drivers/net/ethernet/qlogic/qlcnic/qlcnic_dcb.c:60:6: sparse: symbol 'qlcnic_set_dcb_ops' was not declared. Should it be static?
drivers/net/ethernet/emulex/benet/be_cmds.c:748:29: sparse: restricted __le32 degrades to integer
drivers/net/vmxnet3/vmxnet3_drv.c:1364:33: sparse: incorrect type in argument 2 (different base types) @@    expected unsigned long long [unsigned] [usertype] addr @@    got g long [unsigned] [usertype] addr @@
drivers/net/vmxnet3/vmxnet3_drv.c:1370:72: sparse: incorrect type in argument 2 (different base types) @@    expected unsigned long long [unsigned] [usertype] addr @@    got g long [unsigned] [usertype] addr @@
drivers/net/vmxnet3/vmxnet3_drv.c:2051:48: sparse: incorrect type in argument 3 (different base types) @@    expected unsigned long [unsigned] [usertype] size @@    got d long [unsigned] [usertype] size @@
drivers/net/vmxnet3/vmxnet3_drv.c:2084:17: sparse: incorrect type in argument 3 (different base types) @@    expected unsigned long [unsigned] [usertype] size @@    got d long [unsigned] [usertype] size @@
net/netfilter/nf_conntrack_seqadj.c:24:46: sparse: incorrect type in argument 2 (different base types) @@    expected unsigned int [unsigned] [usertype] seq2 @@    got ed int [unsigned] [usertype] seq2 @@
net/netfilter/nf_conntrack_seqadj.c:25:42: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] correction_pos @@    got ed int [unsigned] [usertype] correction_pos @@
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:215:46: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] <noident> @@    got ed int [unsigned] [usertype] <noident> @@
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:48: sparse: cast to restricted __be32
net/netfilter/nf_synproxy_core.c:220:46: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] <noident> @@    got ed int [unsigned] [usertype] <noident> @@
net/netfilter/nf_synproxy_core.c:224:58: sparse: incorrect type in argument 3 (different base types) @@    expected restricted __be32 [usertype] from @@    got unsigned int [unsrestricted __be32 [usertype] from @@
net/netfilter/nf_synproxy_core.c:224:63: sparse: incorrect type in argument 4 (different base types) @@    expected restricted __be32 [usertype] to @@    got unsignrestricted __be32 [usertype] to @@
net/ipv4/netfilter/ipt_SYNPROXY.c:35:25: sparse: incorrect type in assignment (different base types) @@    expected restricted __be32 [usertype] saddr @@    got unsignrestricted __be32 [usertype] saddr @@
net/ipv4/netfilter/ipt_SYNPROXY.c:36:25: sparse: incorrect type in assignment (different base types) @@    expected restricted __be32 [usertype] daddr @@    got unsignrestricted __be32 [usertype] daddr @@
net/ipv4/netfilter/ipt_SYNPROXY.c:89:43: sparse: incorrect type in argument 2 (different base types) @@    expected unsigned int [unsigned] [usertype] saddr @@    got ed int [unsigned] [usertype] saddr @@
net/ipv4/netfilter/ipt_SYNPROXY.c:89:55: sparse: incorrect type in argument 3 (different base types) @@    expected unsigned int [unsigned] [usertype] daddr @@    got ed int [unsigned] [usertype] daddr @@
net/ipv4/netfilter/ipt_SYNPROXY.c:130:43: sparse: incorrect type in argument 2 (different base types) @@    expected unsigned int [unsigned] [usertype] saddr @@    got ed int [unsigned] [usertype] saddr @@
net/ipv4/netfilter/ipt_SYNPROXY.c:130:55: sparse: incorrect type in argument 3 (different base types) @@    expected unsigned int [unsigned] [usertype] daddr @@    got ed int [unsigned] [usertype] daddr @@
net/ipv4/netfilter/ipt_SYNPROXY.c:175:43: sparse: incorrect type in argument 2 (different base types) @@    expected unsigned int [unsigned] [usertype] saddr @@    got ed int [unsigned] [usertype] saddr @@
net/ipv4/netfilter/ipt_SYNPROXY.c:175:55: sparse: incorrect type in argument 3 (different base types) @@    expected unsigned int [unsigned] [usertype] daddr @@    got ed int [unsigned] [usertype] daddr @@
net/ipv4/netfilter/ipt_SYNPROXY.c:213:43: sparse: incorrect type in argument 2 (different base types) @@    expected unsigned int [unsigned] [usertype] saddr @@    got ed int [unsigned] [usertype] saddr @@
net/ipv4/netfilter/ipt_SYNPROXY.c:213:55: sparse: incorrect type in argument 3 (different base types) @@    expected unsigned int [unsigned] [usertype] daddr @@    got ed int [unsigned] [usertype] daddr @@
net/ipv4/netfilter/ipt_SYNPROXY.c:223:27: sparse: cast from restricted __be16
net/ipv4/netfilter/ipt_SYNPROXY.c:223:27: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned short [unsigned] [usertype] val @@    got signed short [unsigned] [usertype] val @@
net/ipv4/netfilter/ipt_SYNPROXY.c:223:27: sparse: cast from restricted __be16
net/ipv4/netfilter/ipt_SYNPROXY.c:223:27: sparse: cast from restricted __be16
net/ipv4/netfilter/ipt_SYNPROXY.c:223:27: sparse: restricted __be16 degrades to integer
net/ipv4/netfilter/ipt_SYNPROXY.c:223:27: sparse: cast to restricted __be16
net/ipv4/netfilter/ipt_SYNPROXY.c:223:27: sparse: cast from restricted __be16
net/ipv4/netfilter/ipt_SYNPROXY.c:223:27: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned short [unsigned] [usertype] val @@    got signed short [unsigned] [usertype] val @@
net/ipv4/netfilter/ipt_SYNPROXY.c:223:27: sparse: cast from restricted __be16
net/ipv4/netfilter/ipt_SYNPROXY.c:223:27: sparse: cast from restricted __be16
net/ipv4/netfilter/ipt_SYNPROXY.c:223:27: sparse: restricted __be16 degrades to integer
net/ipv4/netfilter/ipt_SYNPROXY.c:223:27: sparse: cast to restricted __be16
net/ipv4/netfilter/ipt_SYNPROXY.c:223:27: sparse: cast from restricted __be16
net/ipv4/netfilter/ipt_SYNPROXY.c:223:27: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned short [unsigned] [usertype] val @@    got signed short [unsigned] [usertype] val @@
net/ipv4/netfilter/ipt_SYNPROXY.c:223:27: sparse: cast from restricted __be16
net/ipv4/netfilter/ipt_SYNPROXY.c:223:27: sparse: cast from restricted __be16
net/ipv4/netfilter/ipt_SYNPROXY.c:223:27: sparse: restricted __be16 degrades to integer
net/ipv4/netfilter/ipt_SYNPROXY.c:223:27: sparse: cast to restricted __be16
net/ipv4/netfilter/ipt_SYNPROXY.c:223:27: sparse: cast from restricted __be16
net/ipv4/netfilter/ipt_SYNPROXY.c:223:27: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned short [unsigned] [usertype] val @@    got signed short [unsigned] [usertype] val @@
net/ipv4/netfilter/ipt_SYNPROXY.c:223:27: sparse: cast from restricted __be16
net/ipv4/netfilter/ipt_SYNPROXY.c:223:27: sparse: cast from restricted __be16
net/ipv4/netfilter/ipt_SYNPROXY.c:223:27: sparse: restricted __be16 degrades to integer
net/ipv4/netfilter/ipt_SYNPROXY.c:223:27: sparse: cast to restricted __be16
net/ipv4/netfilter/ipt_SYNPROXY.c:223:25: sparse: incorrect type in assignment (different base types) @@    expected restricted __be16 [usertype] window @@    got e] window @@
net/ipv6/netfilter/ip6t_SYNPROXY.c:238:27: sparse: cast from restricted __be16
net/ipv6/netfilter/ip6t_SYNPROXY.c:238:27: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned short [unsigned] [usertype] val @@    got signed short [unsigned] [usertype] val @@
net/ipv6/netfilter/ip6t_SYNPROXY.c:238:27: sparse: cast from restricted __be16
net/ipv6/netfilter/ip6t_SYNPROXY.c:238:27: sparse: cast from restricted __be16
net/ipv6/netfilter/ip6t_SYNPROXY.c:238:27: sparse: restricted __be16 degrades to integer
net/ipv6/netfilter/ip6t_SYNPROXY.c:238:27: sparse: cast to restricted __be16
net/ipv6/netfilter/ip6t_SYNPROXY.c:238:27: sparse: cast from restricted __be16
net/ipv6/netfilter/ip6t_SYNPROXY.c:238:27: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned short [unsigned] [usertype] val @@    got signed short [unsigned] [usertype] val @@
net/ipv6/netfilter/ip6t_SYNPROXY.c:238:27: sparse: cast from restricted __be16
net/ipv6/netfilter/ip6t_SYNPROXY.c:238:27: sparse: cast from restricted __be16
net/ipv6/netfilter/ip6t_SYNPROXY.c:238:27: sparse: restricted __be16 degrades to integer
net/ipv6/netfilter/ip6t_SYNPROXY.c:238:27: sparse: cast to restricted __be16
net/ipv6/netfilter/ip6t_SYNPROXY.c:238:27: sparse: cast from restricted __be16
net/ipv6/netfilter/ip6t_SYNPROXY.c:238:27: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned short [unsigned] [usertype] val @@    got signed short [unsigned] [usertype] val @@
net/ipv6/netfilter/ip6t_SYNPROXY.c:238:27: sparse: cast from restricted __be16
net/ipv6/netfilter/ip6t_SYNPROXY.c:238:27: sparse: cast from restricted __be16
net/ipv6/netfilter/ip6t_SYNPROXY.c:238:27: sparse: restricted __be16 degrades to integer
net/ipv6/netfilter/ip6t_SYNPROXY.c:238:27: sparse: cast to restricted __be16
net/ipv6/netfilter/ip6t_SYNPROXY.c:238:27: sparse: cast from restricted __be16
net/ipv6/netfilter/ip6t_SYNPROXY.c:238:27: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned short [unsigned] [usertype] val @@    got signed short [unsigned] [usertype] val @@
net/ipv6/netfilter/ip6t_SYNPROXY.c:238:27: sparse: cast from restricted __be16
net/ipv6/netfilter/ip6t_SYNPROXY.c:238:27: sparse: cast from restricted __be16
net/ipv6/netfilter/ip6t_SYNPROXY.c:238:27: sparse: restricted __be16 degrades to integer
net/ipv6/netfilter/ip6t_SYNPROXY.c:238:27: sparse: cast to restricted __be16
net/ipv6/netfilter/ip6t_SYNPROXY.c:238:25: sparse: incorrect type in assignment (different base types) @@    expected restricted __be16 [usertype] window @@    got e] window @@
sound/soc/codecs/rt5640.c:929:6: sparse: symbol 'hp_amp_power_on' was not declared. Should it be static?
drivers/net/ethernet/sfc/ef10.c:2124:6: sparse: symbol 'efx_ef10_filter_update_rx_scatter' was not declared. Should it be static?
drivers/net/ethernet/sfc/mcdi.c:906:9: sparse: Variable length array is used.
drivers/net/ethernet/sfc/mcdi.c:916:35: sparse: cannot size expression
drivers/net/ethernet/sfc/mcdi.c:935:43: sparse: cannot size expression
drivers/usb/core/hub.c:4965:21: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] len @@    got restrunsigned int [unsigned] len @@
drivers/usb/core/hub.c:4966:41: sparse: restricted __le16 degrades to integer
drivers/usb/core/hub.c:4968:60: sparse: cast to restricted __le16
drivers/gpu/drm/nouveau/nouveau_drm.c:765:6: sparse: symbol 'nouveau_drm_ioctl' was not declared. Should it be static?
drivers/uio/uio_mf624.c:45:6: sparse: symbol 'mf624_disable_interrupt' was not declared. Should it be static?
drivers/uio/uio_mf624.c:73:6: sparse: symbol 'mf624_enable_interrupt' was not declared. Should it be static?
drivers/ata/libata-core.c:574:19: sparse: restricted __le32 degrades to integer
drivers/ata/libata-core.c:575:20: sparse: restricted __le32 degrades to integer
drivers/ata/libata-core.c:576:20: sparse: restricted __le32 degrades to integer
drivers/ata/libata-core.c:577:20: sparse: restricted __le32 degrades to integer
drivers/spi/spi-fsl-dspi.c:140:33: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got sn:2>*addr @@
drivers/spi/spi-fsl-dspi.c:143:33: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got sn:2>*addr @@
drivers/spi/spi-fsl-dspi.c:132:35: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got sn:2>*addr @@
drivers/spi/spi-fsl-dspi.c:241:47: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got sn:2>*addr @@
drivers/spi/spi-fsl-dspi.c:132:35: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got sn:2>*addr @@
drivers/spi/spi-fsl-dspi.c:259:29: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got sn:2>*addr @@
drivers/spi/spi-fsl-dspi.c:266:29: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got sn:2>*addr @@
drivers/spi/spi-fsl-dspi.c:298:52: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got sn:2>*addr @@
drivers/spi/spi-fsl-dspi.c:299:53: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got sn:2>*addr @@
drivers/spi/spi-fsl-dspi.c:300:43: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got sn:2>*addr @@
drivers/spi/spi-fsl-dspi.c:304:44: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got sn:2>*addr @@
drivers/spi/spi-fsl-dspi.c:318:38: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:2>*addr @@    got sn:2>*addr @@
drivers/spi/spi-fsl-dspi.c:327:34: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got sn:2>*addr @@
drivers/spi/spi-fsl-dspi.c:386:40: sparse: incorrect type in argument 2 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got sn:2>*addr @@
drivers/spi/spi-fsl-dspi.c:485:20: sparse: incorrect type in assignment (different address spaces) @@    expected void *base @@    got void [noderef] <avoid *base @@
mm/mlock.c:440:49: sparse: context imbalance in 'munlock_vma_pages_range' - unexpected unlock
include/linux/rcupdate.h:322:30: sparse: context imbalance in 'test_clear_page_writeback' - unexpected unlock
include/linux/rcupdate.h:322:30: sparse: context imbalance in 'test_set_page_writeback' - unexpected unlock
net/sched/sch_generic.c:691:43: sparse: incorrect type in argument 2 (different modifiers) @@    expected struct Qdisc_ops *ops @@    got struct Qdisc_ops const *extern [addresstruct Qdisc_ops *ops @@
net/sched/sch_mq.c:60:54: sparse: incorrect type in argument 2 (different modifiers) @@    expected struct Qdisc_ops *ops @@    got struct Qdisc_ops const *extern [addresstruct Qdisc_ops *ops @@
net/sched/sch_mqprio.c:127:54: sparse: incorrect type in argument 2 (different modifiers) @@    expected struct Qdisc_ops *ops @@    got struct Qdisc_ops const *extern [addresstruct Qdisc_ops *ops @@
fs/btrfs/send.c:400:51: sparse: incorrect type in argument 2 (different address spaces) @@    expected char const [noderef] <asn:1>*<noident> @@    got sn:1>*<noident> @@
fs/btrfs/send.c:2255:9: sparse: incorrect type in argument 3 (different base types) @@    expected unsigned long long [unsigned] [usertype] value @@    got g long [unsigned] [usertype] value @@
fs/btrfs/send.c:2260:17: sparse: incorrect type in argument 3 (different base types) @@    expected unsigned long long [unsigned] [usertype] value @@    got g long [unsigned] [usertype] value @@
fs/btrfs/send.c:3662:50: sparse: incorrect type in argument 2 (different address spaces) @@    expected char [noderef] <asn:1>*<noident> @@    got sn:1>*<noident> @@
fs/btrfs/send.c:3738:9: sparse: incorrect type in argument 3 (different base types) @@    expected unsigned long long [unsigned] [usertype] value @@    got g long [unsigned] [usertype] value @@
drivers/staging/media/msi3101/sdr-msi3101.c:1362:29: sparse: symbol 'msi3101_ioctl_ops' was not declared. Should it be static?
net/netfilter/nf_conntrack_core.c:63:5: sparse: symbol 'nf_nat_seq_adjust_hook' was not declared. Should it be static?

[coccinelle]
sound/soc/fsl/fsl_spdif.c:1105:1-7: Replace memcpy with struct assignment

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
